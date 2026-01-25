package controller.cart;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.cart.Cart;
import model.cart.CartItem;
import model.product.Product;
import model.product.ProductCard;
import service.CartService;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet
{
//
//    AddItem(Product)
//    DeleteItem(Pid)
//    DelAll
//            List
//    Get(Pid)
//    TotalQuantities
//            TotalAmount
//    Update(pid, p)
//    Promotion(p)

    private CartService cartService;

    @Override
    public void init() throws ServletException
    {
        this.cartService = new CartService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession(false);
        Cart myCart = (Cart) session.getAttribute("cart");
        if(myCart == null)
        {
            myCart = new Cart();
        }

        request.setAttribute("cart", myCart);
        request.getRequestDispatcher("/customer/pages/Cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = 1;

        HttpSession session = request.getSession(false);
        Cart myCart = (Cart) session.getAttribute("cart");

        if(myCart == null) myCart = new Cart();


        ProductCard productCard = this.cartService.getProductCard(productId);

        CartItem exist = myCart.isExist(productCard);

        boolean success = false;
        if(exist != null)
        {
            exist.increaseQuantity();
            success = true;
        }else
        {
            //add new cart item
            CartItem newItem = new CartItem(productCard, quantity, productCard.getPrice());
            myCart.addNewItem(newItem);
            success = true;
        }

        System.out.println("Cart: " + myCart.getCart());


        session.setAttribute("cart", myCart);
        // Trả JSON response
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setStatus(HttpServletResponse.SC_OK); // 200 OK

        // Tạo JSON: Có thể tùy chỉnh chi tiết hơn (ví dụ add items list nếu cần update full cart UI)
        Map<String, Object> jsonResponse = new HashMap<>();
        jsonResponse.put("success", success);
        jsonResponse.put("cart", myCart.getCart());

        Gson gson = new Gson();
        String json = gson.toJson(jsonResponse);
        response.getWriter().print(json);
        response.getWriter().flush();

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {

        int cartItemId = Integer.parseInt(req.getParameter("cartItemId"));

        HttpSession session = req.getSession(false);
        Cart myCart = (Cart) session.getAttribute("cart");

        boolean success = myCart.deleteItemById(cartItemId);

        session.setAttribute("cart", myCart);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write("{\"status\":\"success\"}");

    }
}
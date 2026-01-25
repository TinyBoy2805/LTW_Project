package service;

import dao.ProductDAO;
import model.product.FilterRequest;
import model.orders.PageInformation;
import model.product.Product;
import model.product.ProductCard;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public class ProductService
{
    private ProductDAO productDAO = new ProductDAO();
    public List<Product> getProducts() throws SQLException
    {
        return this.productDAO.getListProduct();
    }

    public List<ProductCard> getProductByPage(int page, int pageSize) throws SQLException
    {
        return this.productDAO.getProductByPage(page, pageSize);
    }

    public int getTotalProducts() throws SQLException
    {
        return this.productDAO.getTotalProducts();
    }

    public Product getOneProduct(int id)
    {
        return this.productDAO.getProduct(id);
    }

    public List<ProductCard> getProductsByName(String productName)
    {
        return this.productDAO.getProductsByName(productName);
    }

    public PageInformation<ProductCard> getProduct(int pageIndex) {
        int PAGE_SIZE = 12;
        int totalProduct = this.productDAO.getTotalProducts();
        int totalPage = (totalProduct % PAGE_SIZE != 0) ? (totalProduct / PAGE_SIZE) + 1 : totalProduct / PAGE_SIZE;

        List<ProductCard> data = this.productDAO.getProducts(pageIndex, PAGE_SIZE);

        PageInformation<ProductCard> information = new PageInformation<>();
        information.setData(data);
        information.setPageIndex(pageIndex);
        information.setPageSize(PAGE_SIZE);
        information.setTotalItems(totalProduct);
        information.setTotalPage(totalPage);

        return information;
    }

    public PageInformation<ProductCard> searchProduct(String productName, int pageIndex) {
        int PAGE_SIZE = 12;
        int totalProduct = this.productDAO.countSearchProduct(productName);
        int totalPage = (totalProduct % PAGE_SIZE != 0) ? (totalProduct / PAGE_SIZE) + 1 : totalProduct / PAGE_SIZE;

        List<ProductCard> data = this.productDAO.searchSearch(productName, pageIndex, PAGE_SIZE);

        PageInformation<ProductCard> infor = new PageInformation<>();
        infor.setData(data);
        infor.setPageIndex(pageIndex);
        infor.setPageSize(PAGE_SIZE);
        infor.setTotalItems(totalProduct);
        infor.setTotalPage(totalPage);

        return infor;
    }

    public PageInformation<ProductCard> filterProducts(HashMap<String, Object> filterRaw, int pageIndex) {
        int PAGE_SIZE = 12;

        // lấy trạng thái trên filter
        String status = (String) (filterRaw.get("status")) ;
        // lấy danh mục
        String category = (filterRaw.get("category")) != null ? (String) filterRaw.get("category") : null;
        // lấy số lượng
        int quantity = (filterRaw.get("quantity") != null ? Integer.parseInt((String) filterRaw.get("quantity")) : 0);

        FilterRequest fr = new FilterRequest(category, status, quantity);

        int totalProduct = this.productDAO.countFilterProducts(fr);
        int totalPage = (totalProduct % PAGE_SIZE != 0) ? (totalProduct / PAGE_SIZE) + 1 : totalProduct / PAGE_SIZE;

        List<ProductCard> data = this.productDAO.filterProduct(fr, pageIndex, PAGE_SIZE);

        PageInformation<ProductCard> infor = new PageInformation<>();
        infor.setData(data);
        infor.setPageIndex(pageIndex);
        infor.setPageSize(PAGE_SIZE);
        infor.setTotalItems(totalProduct);
        infor.setTotalPage(totalPage);

        return infor;
    }

    public List<String> getAllCategoryNames() {
        return this.productDAO.getAllCategoryNames();
    }

    public static void main(String[] args) {
        var list = new ProductDAO().getAllCategoryNames();
        list.forEach(System.out::println);
    }
}

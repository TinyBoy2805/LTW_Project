package service;

import dao.ProductDAO;
import model.product.*;
import model.orders.PageInformation;

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

    public List<ProductCard> getProductsByCategory(String categoryParam)
    {
        return this.productDAO.getProductsByCategory(categoryParam);
    }

    public List<ProductCard> getFilteredProducts(List<String> brands, List<String> types, List<Integer> ratings)
    {
        return this.productDAO.getFilteredProducts(brands, types, ratings);
    }

    //admin service
    public PageInformation<AdminProductCard> getProduct(int pageIndex) {
        int PAGE_SIZE = 12;
        int totalProduct = this.productDAO.getTotalProducts();
        int totalPage = (totalProduct % PAGE_SIZE != 0) ? (totalProduct / PAGE_SIZE) + 1 : totalProduct / PAGE_SIZE;

        List<AdminProductCard> data = this.productDAO.getProducts(pageIndex, PAGE_SIZE);

        PageInformation<AdminProductCard> information = new PageInformation<>();
        information.setData(data);
        information.setPageIndex(pageIndex);
        information.setPageSize(PAGE_SIZE);
        information.setTotalItems(totalProduct);
        information.setTotalPage(totalPage);

        return information;
    }

    public PageInformation<AdminProductCard> searchProduct(String productName, int pageIndex) {
        int PAGE_SIZE = 12;
        int totalProduct = this.productDAO.countSearchProduct(productName);
        int totalPage = (totalProduct % PAGE_SIZE != 0) ? (totalProduct / PAGE_SIZE) + 1 : totalProduct / PAGE_SIZE;

        List<AdminProductCard> data = this.productDAO.searchProduct(productName, pageIndex, PAGE_SIZE);

        PageInformation<AdminProductCard> infor = new PageInformation<>();
        infor.setData(data);
        infor.setPageIndex(pageIndex);
        infor.setPageSize(PAGE_SIZE);
        infor.setTotalItems(totalProduct);
        infor.setTotalPage(totalPage);

        return infor;
    }

    public PageInformation<AdminProductCard> filterProducts(HashMap<String, Object> filterRaw, int pageIndex) {
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

        List<AdminProductCard> data = this.productDAO.filterProduct(fr, pageIndex, PAGE_SIZE);

        PageInformation<AdminProductCard> infor = new PageInformation<>();
        infor.setData(data);
        infor.setPageIndex(pageIndex);
        infor.setPageSize(PAGE_SIZE);
        infor.setTotalItems(totalProduct);
        infor.setTotalPage(totalPage);

        return infor;
    }

    public int addNewProduct(Product product, List<ProductImage> productImages){
        return this.productDAO.addNewProduct(product, productImages);
    }

    public Product getProductByID(int productID) {
        return this.productDAO.getProductByID(productID);
    }

    public List<ProductImage> getImagesByID(int productID) {
        return this.productDAO.getImagesByID(productID);
    }

    public void updateProduct(Product product, List<ProductImage> images, int productID) {
        this.productDAO.updateProduct(product, images, productID);
    }

    public boolean deleteProduct(int productID) {
        return this.productDAO.deleteProduct(productID);
    }
}

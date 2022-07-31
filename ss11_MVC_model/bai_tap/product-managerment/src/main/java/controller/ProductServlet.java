package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    if (action == null){
        action="";
    }
    switch (action){
        case "create":
            showCreateProduct(request,response);
            break;
        case "update":
            showUpdateProduct(request,response);
            break;
        case "delete":
            showDeleteProduct(request,response);
            break;
        case "search":
            showSearchById(request,response);
            break;
        case "searchName":
            showSearchByName(request,response);
            break;
        default:
            showWeb(request,response);
    }
    }

    private void showWeb(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList =productService.findAll();
        request.setAttribute("productList",productList);
        try {
            request.getRequestDispatcher("view/product/list.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }


    private void showSearchByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<Product>products = productService.findByName(name);
        RequestDispatcher dispatcher =request.getRequestDispatcher("view/product/list.jsp");
        if (products.size()==0){
            request.setAttribute("message","Not Found");
        }else {
            request.setAttribute("productList",products);
        }
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showSearchById(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Product> products = new ArrayList<>();
        products.add(productService.findById(id));
        request.setAttribute("productList",products);
        RequestDispatcher dispatcher =request.getRequestDispatcher("view/product/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.remove(id);
        showWeb(request,response);
    }


    private void showUpdateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("product",product);
        try {
            request.getRequestDispatcher("view/product/update.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateProduct(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/product/add.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action="";
        }
        switch (action){
            case "create":
                addProduct(request,response);
                break;
            case "update":
                updateProduct(request,response);
            default:
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        Product product = new Product(id,name,price,describe,producer);
        productService.update(id,product);
        showWeb(request,response);
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = productService.findAll();
        int id = products.get(products.size()-1).getId() +1;
        String name = request.getParameter("name");
        double price =Double.parseDouble(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        Product product = new Product(id,name,price,describe,producer);
        productService.save(product);
        request.setAttribute("massage","Add product complete");
       showWeb(request,response);
    }
}

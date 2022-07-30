package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> displayAll();
    void add(Product product);
    void update (int id, String name, double price, String produce, String image);
    Product removeById (int id);
    Product findById(int id);
    List<Product> searchByName(String name);
}

package repository;

import model.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> displayAll();
    void add(Product product);
    void update (int id, String name, double price, String describe, String producer);
    void removeById (int id);
    Product findById(int id);
    List<Product> findByName(String name);
}

package service.impl;

import model.Product;
import repository.ProductRepository;
import repository.ProductRepositoryImpl;
import service.ProductService;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    private ProductRepository productRepository = new ProductRepositoryImpl();
    @Override
    public List<Product> displayAll() {
        return productRepository.displayAll();
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public void update(int id, String name, double price, String describe, String producer) {
        productRepository.update(id, name, price, describe, producer);
    }

    @Override
    public Product removeById(int id) {
        productRepository.removeById(id);
        return null;
    }

    @Override
    public Product findById(int id) {
       return productRepository.findById(id);
    }

    @Override
    public List<Product> searchByName(String name) {
        return productRepository.findByName(name);
    }
}

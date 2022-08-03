package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository repositoryProduct = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return repositoryProduct.findAll();
    }

    @Override
    public void save(Product product) {
        repositoryProduct.save(product);
    }

    @Override
    public void update(int id, Product product) {
        repositoryProduct.update(id,product);
    }

    @Override
    public void remove(int id) {
        repositoryProduct.remove(id);
    }

    @Override
    public Product findById(int id) {
        return repositoryProduct.findById(id);
    }

    @Override
    public List<Product> findByName(String name) {
        return repositoryProduct.findByName(name);
    }
}

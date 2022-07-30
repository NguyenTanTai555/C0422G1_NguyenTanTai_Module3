package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"huda",13000,"Cans","Hue City"));
        productList.add(new Product(1,"Larue",12000,"Cans","DaNang City"));
        productList.add(new Product(1,"Tiger",13000,"Cans","American"));
        productList.add(new Product(1,"Pepsi",13000,"Cans","Pepcico"));
    }


    @Override
    public List<Product> displayAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public void update(int id, String name, double price, String describe, String producer) {
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()){
                productList.get(i).setName(name);
                productList.get(i).setPrice(price);
                productList.get(i).setDescribe(describe);
                productList.get(i).setProducer(producer);
            }
        }
    }

    @Override
    public void removeById(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()){
                productList.remove(productList.get(i));
            }
        }
    }

    @Override
    public Product findById(int id) {
        for (Product p: productList) {
            if(id == p.getId()){
                return p;
            }
        }
        return null;
    }

    @Override
    public List<Product> findByName(String name) {
        boolean flag = true;
        Product product = null;
        for (int i = 0; i < productList.size(); i++) {
            if (name.equalsIgnoreCase(productList.get(i).getName())){
                flag = false;
                product = productList.get(i);
            }
        }
        if (!flag){
            return productList;
        }
        else {
            return null;
        }
    }

}
package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.*;

public class ProductRepository implements IProductRepository {
    private static Map<Integer,Product> productMap = new HashMap<>();
    private static final String IMAGE_SAIGON="webapp/image/saigonbeer.jpg";
    private static final String IMAGE_LARUE="webapp/image/laruebeer.jpg";
    private static final String IMAGE_TIGER="webapp/image/tigerbeer.jpg";
    private static final String IMAGE_SAPPORO="webapp/image/sapporobeer.jpg";
    private static final String IMAGE_HUDA="webapp/image/hudabeer.jpg";
    private static final String IMAGE_HEINEKEN="webapp/image/heinekenbeer.png";
    private static final String IMAGE_SAIGON_LOGO ="webapp/image/logosabeco.jpg";
    private static final String IMAGE_LARUE_LOGO ="webapp/image/Logolarue.jpg";
    private static final String IMAGE_TIGER_LOGO ="webapp/image/logotiger.jpg";
    private static final String IMAGE_SAPPORO_LOGO ="webapp/image/logosapporo.jpg";
    private static final String IMAGE_HUDA_LOGO ="webapp/image/logohuda.jpg";
    private static final String IMAGE_HENIKEN_LOGO ="webapp/image/logoken.jpg";
    static {
        productMap.put(1,new Product(1,"Sai Gon Special",16000,IMAGE_SAIGON,IMAGE_SAIGON_LOGO));
        productMap.put(2,new Product(2,"Larue Beer",13000,IMAGE_LARUE,IMAGE_LARUE_LOGO));
        productMap.put(3,new Product(3,"Tiger Beer",19000,IMAGE_TIGER,IMAGE_TIGER_LOGO));
        productMap.put(4,new Product(4,"Sapporo Beer",80000,IMAGE_SAPPORO,IMAGE_SAPPORO_LOGO));
        productMap.put(5,new Product(5,"Huda Beer",14000,IMAGE_HUDA,IMAGE_HUDA_LOGO));
        productMap.put(6,new Product(6,"Heineken Beer",25000,IMAGE_HEINEKEN,IMAGE_HENIKEN_LOGO));
//        productMap.put(1,new Product(1,"Heineken Beer",25000,"dfgdf","jfhgh"));
//        productMap.put(2,new Product(2,"áo",25000,"dfgdf","jfhgh"));
//        productMap.put(3,new Product(3,"quần",25000,"dfgdf","jfhgh"));
//        productMap.put(4,new Product(4,"Heineken Beer",25000,"dfgdf","jfhgh"));
//        productMap.put(5,new Product(5,"Heineken Beer",25000,"dfgdf","jfhgh"));
//        productMap.put(6,new Product(6,"Heineken Beer",25000,"dfgdf","jfhgh"));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void save(Product product) {
        productMap.put(product.getId(),product);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id,product);
    }

    @Override
    public void remove(int id) {
        productMap.remove(id);
    }

    @Override
    public Product findById(int id) {
       return productMap.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productList = new ArrayList<>();
        for (Product p: productMap.values()) {
            if (p.getName().toLowerCase().contains(name.toLowerCase())){
                productList.add(p);
            }
        }
        return productList;
    }
}

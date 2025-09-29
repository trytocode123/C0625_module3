package com.example.product.repository;

import com.example.product.entity.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Samsung", 12000000, "Điện thoại", "Samsung"));
        productList.add(new Product(2, "Iphone", 21000000, "Điện thoại", "Apple"));
        productList.add(new Product(3, "Xiaomi", 32000000, "Điện thoại", "Xiaomi"));
        productList.add(new Product(4, "Nokia", 10000000, "Điện thoại", "Nokia"));
        productList.add(new Product(5, "Oppo", 9000000, "Điện thoại", "Oppo"));
        productList.add(new Product(6, "Vivo", 8500000, "Điện thoại", "Vivo"));
        productList.add(new Product(7, "Realme", 7000000, "Điện thoại", "Realme"));
        productList.add(new Product(8, "Asus ROG Phone", 25000000, "Điện thoại gaming", "Asus"));
        productList.add(new Product(9, "Google Pixel", 18000000, "Điện thoại", "Google"));
        productList.add(new Product(10, "Sony Xperia", 15000000, "Điện thoại", "Sony"));

    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public boolean add(Product product) {
        productList.add(product);
        return true;
    }

    @Override
    public boolean update(int i) {
        return false;
    }

    @Override
    public boolean delete(int i) {
        return false;
    }

    @Override
    public Product findById(int id) {
        return null;
    }
}

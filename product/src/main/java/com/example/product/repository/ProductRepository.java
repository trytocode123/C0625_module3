package com.example.product.repository;

import com.example.product.entity.Product;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {

    @Override
    public List<Product> findAll() {
        Connection connection = BaseRepository.getConnectDB();
        List<Product>
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

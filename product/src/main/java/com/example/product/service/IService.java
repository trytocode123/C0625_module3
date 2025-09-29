package com.example.product.service;

import com.example.product.entity.Product;

import java.util.List;

public interface IService {
    List<Product> findAll();

    boolean add(Product product);

    boolean update(int i);

    boolean delete(int i);

    Product findById(int id);
}

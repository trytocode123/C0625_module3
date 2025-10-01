package com.example.product.repository;

import com.example.product.dto.ProductDto;
import com.example.product.entity.Product;

import java.util.List;

public interface IRepository <T> {
    List<T> findAll();

    boolean add(T product);

    boolean update(T t);

    boolean delete(int i);

    Product findById(int id);
}

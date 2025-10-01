package com.example.product.service;

import com.example.product.dto.ProductDto;
import com.example.product.entity.Product;

import java.util.List;

public interface IService <T> {
    List<T> findAll();

    boolean add(T product);

    boolean update(T t);

    boolean delete(int i);

    T findById(int id);
}

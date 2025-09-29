package com.example.product.service;

import com.example.product.entity.Product;
import com.example.product.repository.IProductRepository;
import com.example.product.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public boolean add(Product product) {
        return false;
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

package com.example.product.service;

import com.example.product.dto.ProductDto;
import com.example.product.entity.Product;
import com.example.product.repository.IProductRepository;
import com.example.product.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll() {
        return null;
    }

    @Override
    public boolean add(Product product) {
        return productRepository.add(product);
    }

    @Override
    public boolean update(Product product) {
        return productRepository.update(product);
    }

    @Override
    public boolean delete(int iD) {
        return productRepository.delete(iD);
    }

    @Override
    public Product findById(int id) {
        return null;
    }
}

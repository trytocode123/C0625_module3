package com.example.product.service;

import com.example.product.dto.ProductDto;
import com.example.product.entity.Product;
import com.example.product.repository.IProductDtoRepository;
import com.example.product.repository.IProductRepository;
import com.example.product.repository.ProductDtoRepository;
import com.example.product.repository.ProductRepository;

import java.util.List;

public class ProductDtoService implements IProductDtoService {
    IProductDtoRepository productDtoRepository = new ProductDtoRepository();

    @Override
    public List<ProductDto> findAll() {
        return productDtoRepository.findAll();
    }

    @Override
    public boolean add(ProductDto product) {
        return false;
    }

    @Override
    public boolean update(ProductDto productDto) {
        return false;
    }

    @Override
    public boolean delete(int i) {
        return false;
    }

    @Override
    public ProductDto findById(int id) {
        return null;
    }

    @Override
    public List<ProductDto> find(String nameProduct, String iD) {
        return productDtoRepository.find(nameProduct, iD);
    }
}

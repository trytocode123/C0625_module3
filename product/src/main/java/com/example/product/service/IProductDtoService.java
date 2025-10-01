package com.example.product.service;

import com.example.product.dto.ProductDto;

import java.util.List;

public interface IProductDtoService extends IService <ProductDto> {
    List<ProductDto> find(String nameProduct, String iD);
}

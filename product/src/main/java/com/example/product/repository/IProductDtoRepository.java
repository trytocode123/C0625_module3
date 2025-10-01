package com.example.product.repository;

import com.example.product.dto.ProductDto;

import java.util.List;

public interface IProductDtoRepository extends IRepository<ProductDto> {
    List<ProductDto> find(String nameProduct, String iD);
}

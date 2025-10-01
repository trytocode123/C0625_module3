package com.example.product.service;

import com.example.product.dto.ProductDto;
import com.example.product.entity.Category;
import com.example.product.entity.Product;
import com.example.product.repository.CategoryRepository;
import com.example.product.repository.ICategoryRepository;


import java.util.List;

public class CategoryService implements ICategoryService {
    ICategoryRepository categoryRepository = new CategoryRepository();

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public boolean add(Category product) {
        return false;
    }

    @Override
    public boolean update(Category category) {
        return false;
    }

    @Override
    public boolean delete(int i) {
        return false;
    }

    @Override
    public Category findById(int id) {
        return null;
    }
}

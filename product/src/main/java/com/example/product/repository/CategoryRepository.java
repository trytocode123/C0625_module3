package com.example.product.repository;


import com.example.product.entity.Category;
import com.example.product.entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository{
    static final String SELECT = "select * from category";

    @Override
    public List<Category> findAll() {
        Connection connection = BaseRepository.getConnectDB();
        List<Category> categoryList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int iD = rs.getInt("id");
                String name = rs.getString("category_name");
                categoryList.add(new Category(iD,name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categoryList;
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
    public Product findById(int id) {
        return null;
    }
}

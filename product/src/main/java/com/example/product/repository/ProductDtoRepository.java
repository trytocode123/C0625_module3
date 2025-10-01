package com.example.product.repository;

import com.example.product.dto.ProductDto;
import com.example.product.entity.Product;
import com.example.product.service.IProductDtoService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDtoRepository implements IProductDtoRepository {
    static final String SELECT = "select p.id, p.product_name, p.description, p.price, p.producer, c.category_name from product p join category c on p.id_category = c.id";

    static final String SELECT_SEARCH1 = "select p.id, p.product_name, p.description, p.price, p.producer, c.category_name from product p join category c " +
            "on p.id_category = c.id where p.product_name like ? and p.id_category = ?";

    static final String SELECT_SEARCH2 = "select p.id, p.product_name, p.description, p.price, p.producer, c.category_name from product p join category c " +
            "on p.id_category = c.id where p.product_name like ?";

    @Override
    public List<ProductDto> findAll() {
        Connection connection = BaseRepository.getConnectDB();
        List<ProductDto> productDtoList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int iD = rs.getInt("id");
                String nameProduct = rs.getString("product_name");
                String description = rs.getString("description");
                double price = Double.parseDouble(rs.getString("price"));
                String producer = rs.getString("producer");
                String categoryName = rs.getString("category_name");
                productDtoList.add(new ProductDto(iD,nameProduct, price, description, producer, categoryName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productDtoList;
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
    public Product findById(int id) {
        return null;
    }

    @Override
    public List<ProductDto> find(String name, String iD) {
        List<ProductDto> productDtoList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = null;
            if (iD.equals("")) {
                preparedStatement = connection.prepareStatement(SELECT_SEARCH2);
                preparedStatement.setString(1, "%" + name.trim() + "%");

            } else {
                preparedStatement = connection.prepareStatement(SELECT_SEARCH1);
                preparedStatement.setString(1, "%" + name.trim() + "%");
                preparedStatement.setString(2, iD);
            }
            System.out.println(iD);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int iDFind = rs.getInt("id");
                String nameProduct = rs.getString("product_name");
                String description = rs.getString("description");
                double price = Double.parseDouble(rs.getString("price"));
                String producer = rs.getString("producer");
                String categoryName = rs.getString("category_name");
                productDtoList.add(new ProductDto(iDFind,nameProduct, price, description, producer, categoryName));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productDtoList;
    }


}

package com.example.product.repository;

import com.example.product.dto.ProductDto;
import com.example.product.entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    static final String INSERT = "INSERT INTO product (product_name, price, description, producer, id_category) VALUE (?,?,?,?,?)";
    static final String DELETE = "delete from product where id = ?";
    static final String UPDATE = "update product set product_name = ?, description = ?, producer = ?, id_category = ? where id = ?";

    @Override
    public List<Product> findAll() {
        return null;
    }

    @Override
    public boolean add(Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, product.getTenSanPham());
            preparedStatement.setDouble(2, product.getGiaSanPham());
            preparedStatement.setString(3, product.getMoTaSanPham());
            preparedStatement.setString(4, product.getNhaSanXuat());
            preparedStatement.setInt(5, product.getIdCategory());
            int row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Product product) {
        Connection connection  = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, product.getTenSanPham());
            preparedStatement.setString(2, product.getMoTaSanPham());
            preparedStatement.setString(3, product.getNhaSanXuat());
            preparedStatement.setInt(4, product.getIdCategory());
            preparedStatement.setInt(5, product.getId());
            int row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int iD) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, iD);
            int row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Product findById(int id) {
        return null;
    }
}

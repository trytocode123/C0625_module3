package com.example.user.repository;

import com.example.user.entity.User;

import java.util.List;

public interface IRepository {
    List<User> findAll();
    boolean add(User user);
    boolean delete(int i);
    boolean update(int i);
    User findByName(String name);
}

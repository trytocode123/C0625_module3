package com.example.user.service;

import com.example.user.entity.User;

import java.util.List;

public interface IService {
    List<User> findAll();
    boolean add(User user);
    boolean delete(int id);
    boolean update(int id);
    User findByName(String name);
}

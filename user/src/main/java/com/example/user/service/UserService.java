package com.example.user.service;

import com.example.user.entity.User;
import com.example.user.repository.IUserRepository;
import com.example.user.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    IUserRepository userRepository = new UserRepository();

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public boolean add(User user) {
        return userRepository.add(user);
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean update(int id) {
        return false;
    }

    @Override
    public User findByName(String name) {
        return null;
    }
}

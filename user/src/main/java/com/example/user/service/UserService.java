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
        int i = isValid(id);
        if (i != -1) {
            return userRepository.delete(id);
        }
        return false;
    }

    @Override
    public boolean update(int id, User user) {
        int i = isValid(id);
        if (i != -1) {
            return userRepository.update(id, user);
        }
        return false;
    }

    @Override
    public List<User> findByCountry(String country) {
        return userRepository.findByCountry(country);
    }

    int isValid(int id) {
        List<User> userList = findAll();
        for (int i = 0; i < userList.size(); i++) {
            if (userList.get(i).getId() == id) {
                return i;
            }
        }
        return -1;
    }
}

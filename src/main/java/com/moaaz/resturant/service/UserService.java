package com.moaaz.resturant.service;

import com.moaaz.resturant.model.User;
import com.moaaz.resturant.repository.PersonRepository;
import com.moaaz.resturant.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    @Autowired
    PersonRepository personRepository;
    @Autowired
    private UserRepository userRepository;

    public User addUser(User user) {
        return userRepository.save(user);
    }

    public void updateUser(User user) {
        userRepository.save(user);
    }

    public List<User> getAllUsers() {
//        return personRepository.findAllByRole("USER");
        return userRepository.findAll();
    }

    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }

    public User getUserByEmailAndPassword(String email, String password) {
        return userRepository.findByEmailAndPassword(email, password).orElse(null);
    }

    public User getByEmail(String email) {
        return userRepository.findByEmail(email).orElse(null);
    }

    public User getUserById(int id) {
        return userRepository.findById(id).orElse(null);
    }

    public List<User> getAllUsersThatAreHaveAOrder() {
        ArrayList<User> users = new ArrayList<>();
        for (User user :
                userRepository.findAll()) {
            if (user.getOrders() != null && user.getOrders().size() >= 1)
                users.add(user);
        }
        return users;
    }
}

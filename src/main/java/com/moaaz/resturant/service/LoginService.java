package com.moaaz.resturant.service;

import com.moaaz.resturant.model.Person;
import com.moaaz.resturant.repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
    @Autowired
    PersonRepository personRepository;

    public int login(String email, String password) {
        Person person = personRepository.findByEmailAndPassword(email, password).orElse(null);
        if (person == null)
            return -1;
        else if (person.getRole().equals("ADMIN"))
            return 1;
        return 2;

    }


}

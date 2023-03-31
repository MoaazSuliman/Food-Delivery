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
        // There Are No Admin Or User In Our DB.
        if (person == null)
            return -1;
        // This Email And Password For Admin In Our DB.
        else if (person.getRole().equals("ADMIN"))
            return 1;
        // At The End This Email And Password Are For User In our DB.
        return 2;

    }


}

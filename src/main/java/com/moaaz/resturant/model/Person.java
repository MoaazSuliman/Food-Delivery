package com.moaaz.resturant.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.*;

//@MappedSuperclass
@Entity(name = "person")

@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @NotEmpty(message = "Empty")
    @NotNull(message = "Null")
    private String name;
    private String address;
    private String email;
    private String password;
    private String question;
    private String answer;

    private String role;


}

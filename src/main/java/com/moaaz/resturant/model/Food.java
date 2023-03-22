package com.moaaz.resturant.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Food {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String detail;
    private String url;
    private double price;
    private double discount;
    private double total;

    @ManyToOne
    private Category category;



}

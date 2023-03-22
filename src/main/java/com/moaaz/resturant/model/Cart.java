package com.moaaz.resturant.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Cart {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private int id;
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    private List<Food> foods;


    @OneToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;


    public void addFood(Food food) {
        this.foods.add(food);
    }

}

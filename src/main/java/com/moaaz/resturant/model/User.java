package com.moaaz.resturant.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity(name = "person_user")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class User extends Person {


    @OneToMany
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private List<Order> orders;
    @OneToOne(mappedBy = "user" , cascade = CascadeType.ALL)
    private Cart cart;

    public void addFoodToCart(Food food) {
        cart.addFood(food);
    }

    public void addOrder(Order order) {
        orders.add(order);
    }
}

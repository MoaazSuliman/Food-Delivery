package com.moaaz.resturant.service;

import com.moaaz.resturant.model.Cart;
import com.moaaz.resturant.model.Food;
import com.moaaz.resturant.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {

    @Autowired
    CartRepository cartRepository;

    public void addCart(Cart cart) {
        cartRepository.save(cart);
    }

    public void updateCart(Cart cart) {
        cartRepository.save(cart);
    }

    public void deleteCartById(int id) {
        cartRepository.deleteById(id);
    }

    public Cart getCartById(int id) {
        return cartRepository.findById(id).orElse(null);
    }

    public double getTotalMoneyForThisCart(Cart cart) {
        double totalAfter = 0;
        List<Food> foods = cart.getFoods();
        for (int i = 0; i < foods.size(); i++) {
            totalAfter += foods.get(i).getTotal();
        }
        return totalAfter;
    }

    public double getTotalMoneyForThisCartBeforeDiscount(Cart cart) {
        double totalBeforeDiscount = 0;
        List<Food> foods = cart.getFoods();
        for (int i = 0; i < foods.size(); i++) {
            totalBeforeDiscount += foods.get(i).getPrice();
        }
        return totalBeforeDiscount;
    }

    public Cart deleteFoodFromCart(int foodId, Cart cart) {
        List<Food> foods = cart.getFoods();
        for (int i = 0; i < foods.size(); i++) {
            if (foods.get(i).getId() == foodId) {
                foods.remove(i);
                break;
            }
        }
        cart.setFoods(foods);
        return cart;
    }

    public void restartCart(Cart cart) {
        cart.setFoods(null);
        updateCart(cart);
    }

}

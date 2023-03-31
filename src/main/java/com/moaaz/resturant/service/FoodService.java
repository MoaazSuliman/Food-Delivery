package com.moaaz.resturant.service;

import com.moaaz.resturant.model.Food;
import com.moaaz.resturant.repository.FoodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FoodService {
    @Autowired
    private FoodRepository foodRepository;

    public void addFood(Food food) {
        food.setTotal(getTotalPriceForFoodAfterDiscount(food));
        foodRepository.save(food);
    }

    public void updateFood(Food food) {
        food.setTotal(getTotalPriceForFoodAfterDiscount(food));
        foodRepository.save(food);
    }

    public Food getFoodById(int id) {
        return foodRepository.findById(id).orElse(null);
    }

    public List<Food> getAllFoods() {
        return foodRepository.findAll();
    }

    public void deleteFoodById(int id) {
        foodRepository.deleteById(id);
    }

    private double getTotalPriceForFoodAfterDiscount(Food food) {
        return food.getPrice() - (food.getPrice() * (food.getDiscount() / 100));

    }
}

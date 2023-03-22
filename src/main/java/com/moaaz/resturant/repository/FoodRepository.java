package com.moaaz.resturant.repository;

import com.moaaz.resturant.model.Food;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FoodRepository extends JpaRepository<Food , Integer> {
}

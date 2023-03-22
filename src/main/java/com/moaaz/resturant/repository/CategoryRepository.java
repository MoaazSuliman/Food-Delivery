package com.moaaz.resturant.repository;

import com.moaaz.resturant.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category , Integer> {
}

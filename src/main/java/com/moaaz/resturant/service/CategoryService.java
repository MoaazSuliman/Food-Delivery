package com.moaaz.resturant.service;

import com.moaaz.resturant.model.Category;
import com.moaaz.resturant.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {

    @Autowired
    CategoryRepository categoryRepository;

    public void addCategory(Category category) {
        categoryRepository.save(category);

    }

    public void updateCategory(Category category) {
        categoryRepository.save(category);
    }
    public Category getCategoryById(int id){
        return categoryRepository.findById(id).orElse(null);
    }
    public void deleteCategoryById(int id) {
        categoryRepository.deleteById(id);
    }

    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }
}

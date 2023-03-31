package com.moaaz.resturant.controller;

import com.moaaz.resturant.model.Category;
import com.moaaz.resturant.model.Food;
import com.moaaz.resturant.model.User;
import com.moaaz.resturant.security.SessionSecurity;
import com.moaaz.resturant.service.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;


@Controller
public class AdminController {
    @Autowired
    private FoodService foodService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private UserService userService;
    @Autowired
    private ReservationService reservationService;

    @Autowired
    private OrderService orderService;

    @GetMapping("/dashboard")
    public String dashboard(ModelMap model, HttpSession session) {
        if (!new SessionSecurity().adminSecurity(session))
            return "/login";
        System.out.println(foodService.getAllFoods().size() + "**********************************************************");
        model.put("foods", foodService.getAllFoods());
        return "dashboard";
    }

    @GetMapping("/createFood")
    public String createFood(ModelMap model) {
        model.put("categories", categoryService.getAllCategories());
        return "createFood";
    }

    @PostMapping("/createFood")
    public String createFood(@RequestParam String name,
                             @RequestParam String detail,
                             @RequestParam double price,
                             @RequestParam double discount,
                             @RequestParam int categoryId,
                             @RequestParam String file
    ) throws IOException {

        Food food = new Food(0, name, detail, file, price, discount, 0, categoryService.getCategoryById(categoryId));
        foodService.addFood(food);
        return "redirect:/dashboard";
    }

    @GetMapping("/updateFood/{foodId}")
    public String updateFood(@PathVariable int foodId, ModelMap model) {
        model.put("food", foodService.getFoodById(foodId));
        model.put("categories", categoryService.getAllCategories());
        return "updateFood";
    }

    @PostMapping("/updateFood/{foodId}")
    public String updateFood(@PathVariable int foodId,
                             @RequestParam String name,
                             @RequestParam String detail,
                             @RequestParam double price,
                             @RequestParam double discount,
                             @RequestParam int categoryId,
                             @RequestParam String file) {
        Food food = foodService.getFoodById(foodId);
        food = new Food(foodId, name, detail, file, price, discount, 0,
                categoryService.getCategoryById(categoryId));
        foodService.updateFood(food);
        return "redirect:/dashboard";

    }

    @GetMapping("/deleteFood/{foodId}")
    public String deleteFood(@PathVariable int foodId) {
        foodService.deleteFoodById(foodId);
        return "redirect:/dashboard";
    }

    @GetMapping("/createCategory")
    public String createCategory() {
        return "createCategory";
    }

    @GetMapping("/getAllCategories")
    public String getAllCategories(ModelMap model) {
        model.put("categories", categoryService.getAllCategories());
        return "getAllCategories";
    }

    @PostMapping("/createCategory")
    public String createCategory(@RequestParam String name, @RequestParam String detail) {
        Category category = new Category(0, name, detail);
        categoryService.addCategory(category);
        return "redirect:/getAllCategories";
    }

    @GetMapping("/updateCategory/{categoryId}")
    public String updateCategory(@PathVariable int categoryId, ModelMap model) {
        Category category = categoryService.getCategoryById(categoryId);
        model.put("category", category);
        return "updateCategory";

    }

    @PostMapping("/updateCategory/{categoryId}")
    public String updateCategory(@PathVariable int categoryId,
                                 @RequestParam String name,
                                 @RequestParam String detail) {
        Category category = categoryService.getCategoryById(categoryId);
        category.setName(name);
        category.setDetail(detail);
        categoryService.updateCategory(category);
        return "redirect:/getAllCategories";
    }

    @GetMapping("/deleteCategory/{categoryId}")
    public String deleteCategory(@PathVariable int categoryId) {
        categoryService.deleteCategoryById(categoryId);
        return "redirect:/getAllCategories";
    }


    @GetMapping("/getAllUsers")
    public String getAllUsers(ModelMap model) {
        model.put("users", userService.getAllUsers());
        return "users";
    }

    @GetMapping("/deleteUser/{userId}")
    public String deleteUser(@PathVariable int userId) {
        userService.deleteUser(userId);
        return "redirect:/getAllUsers";
    }

    @GetMapping("/getAllReservations")
    public String getAllReservations(ModelMap model) {
        model.put("reservations", reservationService.getAllReservation());
        return "getAllReservations";
    }

    @GetMapping("/deleteReservation/{reservationId}")
    public String deleteReservation(@PathVariable int reservationId) {
        reservationService.deleteReservationById(reservationId);
        return "redirect:/getAllReservations";
    }


    @GetMapping("/sales")
    public String waitingUsers(ModelMap model) {
        model.put("users", userService.getAllUsersThatAreHaveAOrder());
        return "viewUserThatInWaiting";
    }

    @GetMapping("/viewOrdersForUser/{userId}")
    public String viewOrderForUser(@PathVariable int userId, ModelMap model) {
        User user = userService.getUserById(userId);
        model.put("total", orderService.getAllTotalForOrders(user.getOrders()));
        model.put("orders", user.getOrders());
        return "viewAllOrdersForUser";
    }

    @GetMapping("viewOrder/{orderId}")
    public String viewOrder(@PathVariable int orderId, ModelMap model, HttpSession session) {
        if (!new SessionSecurity().adminSecurity(session))
            return "redirect:/login";
        System.out.println(orderId + "********************************************");
        System.out.println(orderService.getOrderById(orderId).getFoods().size());
        model.put("foods", orderService.getOrderById(orderId).getFoods());
        return "viewOrder";
    }


    @GetMapping("/deleteAllOrdersForUser/{userId}")
    public String deleteAllOrderForUser(@PathVariable int userId) {
        User user = userService.getUserById(userId);
        user.setOrders(null);
        userService.updateUser(user);
        return "redirect:/sales";
    }
    /*Moaaz Is The Best Now And Forever*/
}

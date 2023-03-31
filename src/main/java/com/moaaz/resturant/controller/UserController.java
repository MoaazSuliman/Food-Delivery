package com.moaaz.resturant.controller;

import com.moaaz.resturant.model.*;
import com.moaaz.resturant.security.SessionSecurity;
import com.moaaz.resturant.service.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Controller
public class UserController {
    @Autowired
    private CartService cartService;
    @Autowired
    private UserService userService;
    @Autowired
    private LoginService loginService;
    @Autowired
    private FoodService foodService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private ReservationService reservationService;
    @Autowired
    private MailSenderService mailSenderService;

    @GetMapping("/")
    public String first() {
        return "redirect:/index";
    }

    @GetMapping("/register")
    public String signup(ModelMap model) {

        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }

    @PostMapping("/register")
    public String signup(@ModelAttribute("user") User user) {
        user.setRole("USER");
        user.setCart(new Cart());
        userService.addUser(user);
        /*Send Message To Email To Make Him Now He Is In Our DB Now*/
        mailSenderService.sendMessage("Welcome In Our Klassy Restaurant... ", user.getEmail());
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "login";
    }


    @GetMapping("/index")
    public String home(ModelMap model, HttpSession session) {
        model.put("foods", foodService.getAllFoods());
        if (session.getAttribute("number") == null)
            session.setAttribute("number", 0);
        if (session.getAttribute("reservation") != null)
            model.put("reservation", true);
        return "index";
    }

    @GetMapping("/indexFromCart")
    public String indexFromCart(HttpSession session) {
        session.setAttribute("number", 0);
        return "redirect:/index";
    }

    @GetMapping("/addToCart/{foodId}")
    public String addToCart(HttpSession session, @PathVariable int foodId, HttpSession number) {
        if (!new SessionSecurity().userSecurity(session))
            return "redirect:/login";
        Food food = foodService.getFoodById(foodId);
        int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        /*Create Cart If Null And Add Food To It If Not Null*/
        user.addFoodToCart(food);
        userService.updateUser(user);
        if (number.getAttribute("number") != null) {
            int x = (int) number.getAttribute("number");
            number.setAttribute("number", x + 1);
        } else number.setAttribute("number", 1);
        return "redirect:/myCart2";
    }

    @GetMapping("/myCart")
    public String myCart(ModelMap model, HttpSession session) {
        int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        model.put("cart", user.getCart());
        return "myCart";

    }

    @GetMapping("/myCart2")
    public String myCart2(ModelMap model, HttpSession session) {
        if (!new SessionSecurity().userSecurity(session))
            return "redirect:/login";
        int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        model.put("cart", user.getCart());
        model.put("userId", user.getId());
        model.put("totalAfter", cartService.getTotalMoneyForThisCart(user.getCart()));
        model.put("totalBefore", cartService.getTotalMoneyForThisCartBeforeDiscount(user.getCart()));
        model.put("foods", user.getCart().getFoods());
        model.put("orders", user.getOrders());
        return "myCart2";

    }

    @GetMapping("/deleteFoodFromCart/{foodId}")
    public String deleteFoodFromCart(@PathVariable int foodId, HttpSession session) {
        int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        user.setCart(cartService.deleteFoodFromCart(foodId, user.getCart()));
        cartService.updateCart(user.getCart());
        return "redirect:/myCart2";
    }


    @GetMapping("/buyNow/{userId}")
    public String buyNow(@PathVariable int userId) {
        User user = userService.getUserById(userId);
        Order order = new Order(0, user.getCart().getFoods(), String.valueOf(LocalDate.now()), true,
                cartService.getTotalMoneyForThisCart(user.getCart()));
        user.addOrder(order);
        cartService.restartCart(user.getCart());
        userService.updateUser(user);
        mailSenderService.sendMessage("Thank You For Your Order From Our Klassy Restaurant....", user.getEmail());
        return "redirect:/myCart2";

    }

    @GetMapping("/deleteOrderById/{orderId}")
    public String deleteOrderById(@PathVariable int orderId, HttpSession session) {
        // Get User
        int userId = (int) session.getAttribute("userId");
        User user = userService.getUserById(userId);
        // at the first we should remove the order from user.
        user = orderService.removeOrderFromUser(orderId, user);
        userService.updateUser(user);
        // Then delete Order From DB
        orderService.deleteOrderById(orderId);
        return "redirect:/myCart2";
    }

    @GetMapping("/printOrders/{userId}")
    @ResponseBody
    public String printOrders(@PathVariable int userId) {
        User user = userService.getUserById(userId);
        return user.getOrders().toString();
    }

    @PostMapping("/addReservation")
    public String addReservation(@RequestParam String name,
                                 @RequestParam String email,
                                 @RequestParam String phone,
                                 @RequestParam int numberOfGuests,
                                 @RequestParam String date,
                                 @RequestParam Time time,
                                 @RequestParam String message,
                                 HttpSession session
    ) {
        Reservation reservation = new Reservation(0, name, email, phone, date, numberOfGuests, time, message);
        reservationService.addReservation(reservation);
        String senderMessage = "You Have A Table In Our Klassy Restaurant In " + String.valueOf(time) + "... You 'll Hava A Good Time.";
        mailSenderService.sendMessage(senderMessage, email);
        session.setAttribute("reservation", true);
        return "redirect:/index";

    }

}

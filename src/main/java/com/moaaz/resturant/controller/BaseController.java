package com.moaaz.resturant.controller;

import com.moaaz.resturant.model.User;
import com.moaaz.resturant.service.LoginService;
import com.moaaz.resturant.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BaseController {


    @Autowired
    private UserService userService;
    @Autowired
    private LoginService loginService;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String login(ModelMap model, @RequestParam String email, @RequestParam String password, HttpSession session) {
        int x = loginService.login(email, password);
        System.out.println(x + "******************************************************************************PersonId");
        if (x == -1) {
            model.put("error", true);
            model.put("email", email);
            model.put("password", password);
            return "login";
        }
        if (x == 1) {
            session.setAttribute("adminId", true);
            return "redirect:/dashboard";
        }
        User user = userService.getUserByEmailAndPassword(email, password);
        session.setAttribute("userId", user.getId());
        session.setAttribute("login", true);
        session.setAttribute("number", 0);
        return "redirect:/index";
    }

    @GetMapping("/forgetPassword")
    public String forgetPassword(ModelMap model) {
        model.put("users", userService.getAllUsers());
        return "forgetPassword";
    }

    @PostMapping("/forgetPassword")
    public String forgetPassword(@RequestParam String email,
                                 @RequestParam String question,
                                 @RequestParam String answer,
                                 @RequestParam String password,
                                 @RequestParam String confirmPassword,
                                 ModelMap model) {
        if (!password.equals(confirmPassword)) {
            model.put("errorMsg", "PASSWORDS ISN'T SAME.");
            model.put("error", true);
            model.put("users", userService.getAllUsers());
            model.put("email", email);
            model.put("answer", answer);
            return "forgetPassword";
        }
        User user = userService.getByEmail(email);
        if (user == null) {
            model.put("errorMsg", "This Email Not In Our DB...");
            model.put("error", true);
            model.put("users", userService.getAllUsers());
            model.put("email", email);
            model.put("answer", answer);
            return "forgetPassword";
        }
        if (!user.getQuestion().equals(question)) {
            model.put("errorMsg", "Error Question For This Email...");
            model.put("error", true);
            model.put("users", userService.getAllUsers());
            model.put("email", email);
            model.put("answer", answer);
            return "forgetPassword";
        }
        if (!user.getAnswer().equals(answer)) {
            model.put("errorMsg", "Answer Isn't Correct");
            model.put("error", true);
            model.put("users", userService.getAllUsers());
            model.put("email", email);
            model.put("answer", answer);
            return "forgetPassword";
        }
        user.setPassword(password);
        userService.updateUser(user);
        return "redirect:/login";

    }


}

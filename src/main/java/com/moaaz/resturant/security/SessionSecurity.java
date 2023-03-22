package com.moaaz.resturant.security;

import jakarta.servlet.http.HttpSession;

public class SessionSecurity {

    public static boolean adminSecurity(HttpSession session) {
        return (session.getAttribute("adminId") == null) ? false : true;
    }

    public static boolean userSecurity(HttpSession session) {
        return (session.getAttribute("userId") == null) ? false : true;
    }
}

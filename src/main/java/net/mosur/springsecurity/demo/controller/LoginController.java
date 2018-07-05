package net.mosur.springsecurity.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String showLoginPage(){

        return "bootstrap-login";
    }

    @GetMapping("/accessDenied")
    public String showAccessDeniedPage(){

        return "access-denied";
    }
}
package net.mosur.springsecurity.demo.controller;

import net.mosur.springsecurity.demo.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    @Autowired
    private UserDetailsManager userDetailsManager;

    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @InitBinder
    public void initBinder(WebDataBinder dataBinder){

        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);

        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    @GetMapping("/showForm")
    public String showRegisterPage(Model model){

        model.addAttribute("User", new User());

        return "register";
    }

    @PostMapping("/processForm")
    public String processForm(
            @Valid @ModelAttribute("User") User user,
            BindingResult bindingResult,
            Model model){

        //check Form
        if(bindingResult.hasErrors()){
            model.addAttribute("User", new User());
            model.addAttribute("registrationError",
                    "Username and Password cannot be empty");
            return "register";
        }

        //Form is valid

        // encrypt password
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        encodedPassword = "{bcrypt}"+ encodedPassword;

        //grant authorities (here all Users are EMPLOYEES)
        List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList("ROLE_EMPLOYEE");

        //Creating new user and saving to database via Spring Security
        org.springframework.security.core.userdetails.User tmpUser = new org.springframework.security.core.userdetails.User(
                user.getUserName(), encodedPassword, authorities);

        userDetailsManager.createUser(tmpUser);

        return "registration-confirmation";

    }
}

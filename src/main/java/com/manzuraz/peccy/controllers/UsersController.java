package com.manzuraz.peccy.controllers;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.manzuraz.peccy.models.User;
import com.manzuraz.peccy.services.UserService;
import com.manzuraz.peccy.validator.UserValidator;

@Controller
public class UsersController {
	private final UserValidator userValidator;
	private final UserService us;
	private String[] sites = new String[] {"AZA","SJO"};
	
	public UsersController(UserService us, UserValidator userValidator) {
		this.us=us;
		this.userValidator = userValidator;
	}
	
	@RequestMapping("/login") 
		public String home(@ModelAttribute("user") User user,@RequestParam(value="error", required=false) String error, 
				@RequestParam(value="logout", required=false) String logout, Model model){
		if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        model.addAttribute("sites", sites);
		return "index.jsp";
	}
	
	@RequestMapping("/registration") 
		public String reg(@Valid @ModelAttribute("user") User user, BindingResult result, 
				Model model, HttpSession session, HttpServletRequest request) {
		userValidator.validate(user, result);
		if (result.hasErrors()) {
			model.addAttribute("sites", sites);
            return "index.jsp";
        }else {
        us.saveWithUserRole(user);
        try {
            request.login(user.getEmail(),user.getPasswordConfirmation());
        } catch (ServletException e) {
            System.out.println("IT DID NOT WORK :C");
        }	
        return "redirect:/";
        }
	}
}
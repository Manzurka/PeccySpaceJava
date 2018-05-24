package com.manzuraz.peccy.controllers;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.manzuraz.peccy.models.User;
import com.manzuraz.peccy.services.PostService;
import com.manzuraz.peccy.services.UserService;

@Controller
public class PostsController {
	private final PostService ps;
	private final UserService us;
	
	public PostsController(PostService ps,UserService us) {
		this.ps=ps;
		this.us=us;
	}
	
	@RequestMapping("/")
		public String dashboard(Principal principal, Model model) {
		
		User currentUser = us.findByEmail(principal.getName());
		System.out.println(currentUser.getName());
		model.addAttribute("currentUser", currentUser);
			return "dashboard.jsp";
	}
}

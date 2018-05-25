package com.manzuraz.peccy.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.manzuraz.peccy.models.Post;
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
		model.addAttribute("currentUser", currentUser);
		return "dashboard.jsp";
	}
	
//	@PostMapping("/post/{id}/update") //update
//	public String update(@RequestParam("post") String post, @PathVariable("id") Long id) {
//		Post p = ps.findById(id);
//		p.setPost(post);
//		ps.savePost(p);
//		return "redirect:/"; 
//	}
	
}

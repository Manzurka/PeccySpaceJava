package com.manzuraz.peccy.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.manzuraz.peccy.models.Post;
import com.manzuraz.peccy.models.User;
import com.manzuraz.peccy.services.PostService;
import com.manzuraz.peccy.services.UserService;

@RestController
public class PostsAPI {
	private final PostService ps;
	private final UserService us;
	
	public PostsAPI(PostService ps,UserService us) {
		this.ps=ps;
		this.us=us;
	}
	
	@RequestMapping("/posts") //display all notes
	public List<Post> index(Principal principal, Model model){
		User currentUser = us.findByEmail(principal.getName());
		System.out.println(currentUser.getName());
		model.addAttribute("currentUser", currentUser);
		return ps.all_posts();
	}

	@PostMapping("/add") //create a new note
	public Post create(Principal principal, @RequestParam("title") String title, @RequestParam("post") String post) {
		User author = us.findByEmail(principal.getName());
		Post p = new Post();
		p.setTitle(title);
		p.setPost(post);
		p.setAuthor(author);
		return ps.savePost(p);
	}
}

package com.manzuraz.peccy.controllers;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	
	@RequestMapping("/posts") //display all posts
	public List<Post> index(){
		return ps.all_posts();
		
	}
	
//	@RequestMapping("/search") //display all posts
//	public List<Post> search(@RequestParam("search_box") String word){
//		return ps.findByPost(word);
//		
//	}

	@PostMapping("/add") //create a new post
	public Post create(Principal principal, @RequestParam("title") String title, @RequestParam("post") String post) {
		Post p = new Post();
		p.setTitle(title);
		p.setPost(post);
		return ps.savePost(p);
	}
	
//	@PostMapping("/post/{id}/update") //update
//	public Post update(@RequestParam("post") String post,@PathVariable("id") Long id, HttpServletResponse response) {
//		System.out.println("test1")
//		Post p = ps.findById(id);
//		p.setPost(post);
//		return ps.savePost(p);
//}

//	@PostMapping("/notes/{id}/delete")  //delete
//		public void delete(@PathVariable("id") Long id, HttpServletResponse response) {
//		Post p = ps.findById(id);
//		ps.delete(p);
//	//	Response res= new Response("Done", note);
//	//	return res;
//		try {
//			response.sendRedirect("/");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//}
}
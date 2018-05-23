package com.manzuraz.peccy.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.manzuraz.peccy.models.Post;
import com.manzuraz.peccy.models.Comment;
import com.manzuraz.peccy.repositories.CommentRepository;
import com.manzuraz.peccy.repositories.PostRepository;

@Service
public class PostService {
	private final PostRepository pr;
	private final CommentRepository cr;
	
	
	PostService(PostRepository pr, CommentRepository cr) {
		this.pr = pr;
		this.cr = cr;
	}
	
	
	public List<Post> all_posts(){
		return pr.findAll();
	}
	
	
	public List<Comment> all_comments(){
		return cr.findAll();
	}
	
}

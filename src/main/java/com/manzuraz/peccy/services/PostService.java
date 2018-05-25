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
	
	
	public PostService(PostRepository pr, CommentRepository cr) {
		this.pr = pr;
		this.cr = cr;
	}
	
	public List<Post> all_posts(){
		return pr.findAll();
	}
	
	public List<Comment> all_comments(){
		return cr.findAll();
	}
	
	public Post savePost(Post post) {
		return pr.save(post);
	}
	
	public Post findById(Long id) {
		return pr.findById(id).get();
	}
	
	public void delete(Post p) {
		pr.delete(p);
	}
	
//	public List<Post> findByPost(String word){
//		return pr.findByPostContaining(word);
//	}
}

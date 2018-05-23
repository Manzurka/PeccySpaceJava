package com.manzuraz.peccy.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "comments")
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long Id;
	
	@Column
	@Size(min = 3)
	private String comment;
	
	// Grabs the User's ID
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User user_comments;
	
	// Grabs the post that the comment is being sent too
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "post_id")
	private Post post_comments;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="MM/dd/yyyy")
	private Date createdAt;

	@Column
	@DateTimeFormat(pattern="MM/dd/yyyy")
	private Date updatedAt;
	
	@PrePersist
	protected void onCreate() {
		this.createdAt=new Date();
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt=new Date();
	}

	public long getId() {
		return Id;
	}

	public void setId(long id) {
		Id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public User getUser_comments() {
		return user_comments;
	}

	public void setUser_comments(User user_comments) {
		this.user_comments = user_comments;
	}

	public Post getPost_comments() {
		return post_comments;
	}

	public void setPost_comments(Post post_comments) {
		this.post_comments = post_comments;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
	
	

}

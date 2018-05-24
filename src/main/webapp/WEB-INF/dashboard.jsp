<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  		<script src="js/jquery.js"></script>
		<title>MyPeccySpace</title>
		<style type="text/css">
        	<%@ include file="static/css/dashboard.css" %>
        </style>
		<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Lora" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">

	</head>
	<body>
		<div id="first">
			<h1>WELCOME <c:out value="${currentUser.name}"/>!</h1>
			<h1 id="webname">MyPeccySpace</h1>
	    </div>
	    <nav class="navbar navbar-light bg-light">
	            <div  id="links">
	              <a class="btn btn-light" href="/user/edit">Edit my profile <i class="fas fa-pencil-alt"></i></i></a>
	              <a class="btn btn-light" href="/user/show">Show my profile <i class="far fa-user"></i></a>
	              <form id="logoutForm" method="POST" action="/logout" class="logout">
				        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				        <input type="submit" value="Logout" />
		    	  </form>
	            </div>
	     </nav>
         <form method="get" action="/results">
        
             <input  id="search_box" type="text" name="search_box"  placeholder="Enter keyword" >
             <button class="btn" id="search_submit" type="submit">Search <i class="fas fa-search"></i></button>
         </form>
     
	    <h2>Recent Posts:</h2>
	    <div id="all_posts">
		</div>
	    <div id="postbox">
	            <form action="/add" method="post" enctype="multipart/form-data">
	                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                <div class="form-group col-md-12">
	                    <h3>Add Question or Share your knowledge:</h3>
	                    <div class="row">
	                        <label for="title">Title</label>
	                    </div>
	                    <input type="text" name="title" placeholder="Enter title">
	                </div>
	                <div class="form-group col-md-12">
	                    <div class="row">
	                        <label for="post">Question or Post</label>
	                    </div>
	                    <textarea rows=5 cols=55 type="text" name="post" placeholder="Enter text"></textarea>
	                </div>
	               	
	                    <i class="fas fa-cloud-upload-alt"></i> <input class="btn btn-lg mb-4" type="submit" value="Post">
	            </form>
	     </div>

		
	     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
   </body>
</html>
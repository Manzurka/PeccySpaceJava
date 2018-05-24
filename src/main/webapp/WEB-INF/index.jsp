<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>MyPeccySpace Login</title>
		<style type="text/css">
        	<%@ include file="static/css/style.css" %>
        </style>
       
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
         <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
         <script type="text/javascript" src="js/weather.js"></script>

	</head>
	<body> 
		<div class="jumbotron jumbotron-fluid">
	        <div class="container">
	            <h1 class="display-4">WELCOME to MyPeccySpace!</h1>
	            <p class="lead">The Seller Support associate hub for Questions and Answers</p>
	        </div>
        </div>
        <div class="left-side">
        	<div class="welcome">
	            <h1>Registration</h1>
	            <form:form method="POST" action="/registration" modelAttribute="user">
			       <div class="row">
	                    <div class="col-md-6">
				            <form:label path="name">Name:</form:label>
				            <form:input path="name"/>
			       		</div>
	                </div>
		        	<p><form:errors path="name"/></p>
					<div class="row">
		             	<div class="col-md-6">
				            <form:label path="email">Email:</form:label>
				            <form:input path="email"/>
				       	</div>
			        </div>
		        	<p><form:errors path="email" /></p>
		        	<div class="row">
	                	<div class="col-md-6">
				            <form:label path="location">Location:</form:label>
				            <form:select path ="location">
				              	<form:options path ="location" items='${sites}'/>
				            </form:select>
	 					</div>
           			</div>
		          	<div class="row">
             			<div class="col-md-6">
				            <form:label path="skill">Skill:</form:label>
				            <form:select path ="skill">
				              	<form:option value="IIDP">IIDP</form:option>
				                <form:option value="FBA">FBA</form:option>
				                <form:option value="M@">M@</form:option>
				            </form:select>
		        		</div>
           		 	</div>
			       	<div class="row">
	             		<div class="col-md-6">
				            <form:label path="password">Password:</form:label>
				            <form:password path="password"/>
			       		</div>
	           		</div>
			        <p><form:errors path="password" /></p>
			        <div class="row">
	             		<div class="col-md-6">
				            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
				            <form:password path="passwordConfirmation"/>
			        	</div>
	           		</div>
		            <p><form:errors path="passwordConfirmation"/></p>
		        	<input type="submit" value="Register"/>
	    		</form:form>
        	</div>
        	<div class ="welcome">
            	<h1>Login</h1>
            
	            <c:if test="${errorMessage != null}">
		        	<span><c:out value="${errorMessage}"></c:out></span>
		    	</c:if>
		    	
		    	<form method="POST" action="/login">
			        <div class="row">
                  		<div class="col-md-4">
				            <label for="username">Email: </label>
				            <input type="text" id="username" name="username"/>
			         	</div>
                	</div>
			        <div class="row">
                  		<div class="col-md-4">
				            <label for="password">Password: </label>
				            <input type="password" id="password" name="password"/>
			       		</div>
                	</div>
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			        <input type="submit" value="Login"/>
		    	</form>
	   		</div>
		 	<c:if test="${logoutMessage != null}" >
		       <span><c:out value="${logoutMessage}"></c:out></span>
		   	</c:if>
	  </div>
	   <div class="right-side">
          <h3>Associate Quicklinks:</h3>
          <div id="tools" align='right'>
            <nav>
              <ul>
                <li><a href="https://mytime-lite.aka.corp.amazon.com/wfc/applications/suitenav/navigation.do?ESS=true?redirect=/wfc/applications/wtk/html/ess/timestamp.jsp" target="_blank">Kronos</a></li>
                <li><a href="https://sellercentral.amazon.com/forums/" target="_blank">Seller Forums</a></li>
                <li><a href="https://share.amazon.com/sites/nasolutionspace/" target="_blank">SRD</a></li>
                <li><a href="https://w.amazon.com/index.php/Main_Page" target="_blank">Wiki</a></li>
                <li><a href="https://hub.amazon.work/employees/101972614/dashboard" target="_blank">Amazon Hub</a></li>
              </ul>
            </nav>
          </div>
		 <nav>
                <form action="">
                    <input id="search" type="text" name="search" placeholder="Enter city"/>            
                    <input id="btn" type="submit" value="Search Weather"/>
                </form>
       	 </nav>
       	 <div id="result">
       	 </div>
          <h3>Your Amazon News:</h3>

          <div id="url"></div>

        </div>

        <footer>
          <span>Contact Us</span>
          <br>
          <span><a href="">1-800-lab206-az</a></span>
          <br>
          <a href="https://www.facebook.com"><img src="static/images/social_icons.png" width="350"></a>
        </footer>
	  
	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	</body>
</html>
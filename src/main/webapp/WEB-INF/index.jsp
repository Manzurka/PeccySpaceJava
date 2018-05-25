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

	</head>
	<body> 
		<div class="jumbotron jumbotron-fluid">
	        <div class="container">
	            <h1 class="display-4">WELCOME to TeccySpace!</h1>
	            <p class="lead">The Seller Support associate hub for Questions and Answers</p>
	        </div>
        </div>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#register">Register</button>
      </div>
      
      <div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLongTitle">Register</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
             
			<p><form:errors path="user.*"/></p>

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
		        	<input type="submit" value="Register" class="btn btn-success"/>
	    		</form:form>


            </div>

          </div>
        </div>
      </div>
      
      &nbsp;&nbsp;&nbsp;
      
        	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#login">Login</button>
      
      <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLongTitle">Login</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">


                  <form method="POST" action="/login" id="loginForm">
			        <div class="row">
                  		<div class="col-md-4">
				            <label for="username">Email: </label>
				            <input type="text" id="username" name="username"/>
			         	</div>
                	</div>
			        <div class="row">
                  		<div class="col-md-4">
				            <label>Password: </label>
				            <input type="password" name="password"/>
			       		</div>
                	</div>
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			        <br>
			        <input type="submit" value="Login" class="btn btn-info"/>
		    	</form>


            </div>

          </div>
        </div>
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

          <div id="url"></div>

        </div>

	  	<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
        
        
            $('#loginForm').formValidation({
                framework: 'bootstrap',
                excluded: ':disabled',
                icon: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    username: {
                        validators: {
                            notEmpty: {
                                message: 'The username is required'
                            }
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {
                                message: 'The password is required'
                            }
                        }
                    }
                }
            });
        
     
        
        </script>
	</body>
</html>
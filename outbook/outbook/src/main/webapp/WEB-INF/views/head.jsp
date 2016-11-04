<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page isELIgnored="false"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>My Book Store</title>


<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" />




<body>
<nav class="navbar navbar-inverse-fixed-top" style="background-color: rgb(128,0,0);">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
       <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand mylink" href="#">Outbook</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
    <ul class="nav navbar-nav">
      <li class="active"><a href="${pageContext.request.contextPath}/index">Home</a></li>
      <li><a href="${pageContext.request.contextPath}/aboutus">About Us</a></li>
      <li><a href="${pageContext.request.contextPath}/contactus">Contact Us</a></li> 
      <li><a href="${pageContext.request.contextPath}/allproducts">Products</a></li>
      
      
       
      
      
      	<%
		if (request.isUserInRole("ADMIN"))
		{
		%> 
      <li><a href="${pageContext.request.contextPath}/allcategories">Categories</a></li>
      	<%
		}
		%> 
    </ul>
    
      <ul class="nav navbar-nav navbar-right">
      
      <c:choose>
	      					<c:when test="${not empty pageContext.request.userPrincipal}">
	      						<li><a href="${pageContext.request.contextPath}/index">${pageContext.request.userPrincipal.name}</a></li>
	      						<li><a href="${pageContext.request.contextPath}/logout">Log Out</a></li>
	      						
	      					</c:when>
	      					
	      					<c:otherwise>
	      						<li><a href="${pageContext.request.contextPath}/loginpage"><span class="glyphicon glyphicon-user"></span>Login</a></li>
				        		<li><a href="${pageContext.request.contextPath}/signup"><span class="glyphicon glyphicon-log-in"></span>Sign Up</a></li>
				        		${isAdmin}
	      					</c:otherwise>
	      				</c:choose>
      </ul>
    </div>
    </div> 
</nav>
<footer style="background-color: #333333; position: fixed; bottom:0px; width: 100%; z-index:4; color: #FFFFFF; padding-top: 10px; box-shadow: -10px 5px 40px #000000;" class="container-fluid text-center">
		<p><b>&copy; Sakshi Arora</b></p>
	</footer>
	</body>
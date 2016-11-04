<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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




<c:import url="/head-meta"/>

<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>

</head>
<body>
<c:import url="/head"/>





<div class="container">
  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="${pageContext.request.contextPath}/resources/images/book1.jpg" alt="Chania" width="460" height="345">
      
      </div>

      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/book2.jpg" alt="Chania" width="460" height="345">
        
      </div>
    
      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/book3.jpg" alt="Flower" width="460" height="345">
        
      </div>

      <div class="item">
        <img src="${pageContext.request.contextPath}/resources/images/book4.jpg" alt="Flower" width="460" height="345">
     
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>  
    
  </div>
</div>
<br>
                    <div class="container-wrapper">
                    <div class="container">
                    <center><h2>Outbook 
                    </h2>
                    </center>
                    <div class="Text12">
                    <label for="text">Outbook has been in the business of helping school, college and university
                     students to find and buy cheap textbooks online since 2012. Thousands of independent booksellers
                     - many of them local bookstores - list their new and used textbooks for sale on our site. There
                     are books from all the major publishers including McGraw Hill and Houghton Mifflin. The sellers
                     ship the books straight to the buyers. The used copies include older editions and they are usually 
                     available at the cheapest prices online  even as cheap as plus shipping. Competition between 
                     sellers on our marketplace ensures prices remain cheaper than elsewhere.In my bookstore I have 
                     collection of all books like spiritual,fiction,non-fiction,religious books,story books,history books
                     school books,even for childen fun loving books also...
                    </label>
        </div>
        </div>
</body>
</html>
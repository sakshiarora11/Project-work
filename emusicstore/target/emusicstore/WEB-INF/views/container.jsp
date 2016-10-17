<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>

</head>
<body>
<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      
    </ol>

    
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="resources/images/5.jpg"/>
		 <div class="carousel-caption">
          <p class="text-center"><em><h2><strong>Welcome To Music Hub</strong></h2></em></p>
           </div>
      </div>

      <div class="item">
        <img src="resources/images/2.jpg" alt="Chania" width="460" height="345">
		<div class="carousel-caption">
          <p class="text-center"><em><h2><strong>Music is the strongest form of magic</strong></h2></em></p>
           </div>
		
      </div>
    
      <div class="item">
        <img src="resources/images/3.jpg" alt="Flower" width="460" height="345">
		<div class="carousel-caption">
          <p class="text-center"> <h2><em><strong>Music is the divine way to tell beautiful, poetic things to the heart.</strong></em></h2></p>
           </div>
      </div>

      
    </div>

    
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


</body>
</html>
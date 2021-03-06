<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>My Music Hub</title>


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

<div class="navbar-wrapper">
<div class="container">
<nav class="navbar navbar-inverse navbar-static-top">
<div class="container">
<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand"href="#">My Music Store</a>
</div>
<div id="navbar"class="navbar-collapse collapse">
<ul class="nav navbar-nav">

<li><a href="<c:url value="/" />">Home</a></li>
<li><a href="<c:url value="/product/productList/all"/>">Products</a></li>
<li><a href="<c:url value="/about" />">About Us</a></li>
</ul>
<ul class="nav navbar-nav pull-right">
<c:if test="${pageContext.request.userPrincipal.name != null}">
<li><a>Welcome: ${pageContext.request.userPrincipal.name}</a></li>
<li><a href="<c:url value="/j_spring_security_logout"/>">Logout</a></li>
<c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
<li><a href="<c:url value="/customer/cart"/>">Cart</a></li>
</c:if>
<c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
<li><a href="<c:url value="/admin"/>">Admin</a></li>
</c:if>
</c:if>
<c:if test="${pageContext.request.userPrincipal.name == null}">
<li><a href="<c:url value="/login" />">Login</a></li>
<li><a href="<c:url  value="/register" />">Register</a></li>
</c:if>
</ul>
</div>
</div>
</nav>
</div>
</div>





</body>
</html>
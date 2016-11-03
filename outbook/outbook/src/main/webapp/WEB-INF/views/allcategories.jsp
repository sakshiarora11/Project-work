<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<c:import url="/head-meta"/>

</head>

<script type="text/javascript">

	var myApp = angular.module("myApp",[]);

	myApp.controller("myCtrl",function($scope)
	{
		$scope.search = '';
		
		$scope.data=${CategoryJSON};
	});
</script>

<body ng-app="myApp" ng-controller="myCtrl">
<c:import url="/head"/>

	<div class="container">
	
		<div class="row">
		<BR>
		<BR>
		<BR>
		<BR>
		
			<div class="col-lg-12">
				<label style="font-size: 40px;" class="alert alert-info">All Categories</label>
			</div>
			
		</div>
		
		<div class="row">
		
			<div class="col-lg-12">
				<a href="${pageContext.request.contextPath}/addcategories" class="btn btn-danger">Add Category</a>
			</div>
			
		</div>
		
		<div class="row">
		
			<div class="col-lg-12">
				<input type="text" placeholder="Enter Search Key" ng-model="search" class="form-control"/>
			</div>
			
		</div>
	
		<div class="row" ng-repeat="x in data| filter : search">
		
			<div class="col-lg-6">
				<br>
				{{x.CategoryName}}
			</div>
			<div class="col-lg-3">
				<a href="${pageContext.request.contextPath}/DeleteCategoryFromDB/{{x.CategoryId}}" class="btn btn-info">Delete Category</a>
				<br>
				<br>
					
			</div>
			
			<div class="col-lg-3">
				<a href="${pageContext.request.contextPath}/updatecategories/{{x.CategoryId}}" class="btn btn-success">Update Category</a>
				<br>
				<br>
					
			</div>
		
			
		</div>
	
	</div>

</body>
</html>
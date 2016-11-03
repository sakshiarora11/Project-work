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
///////////////////////////////////////
	
	myApp.factory('UserService', ['$http', '$q', function($http, $q){
	 
    return {
         
            fetchAllItems: function() {
                    return $http.post('http://localhost:9002/Outbook/flows/fetchitems/')
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while fetching items');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
            
            deleteItem: function(id){
                    return $http.post('http://localhost:9002/Outbook/flows/deleteItem/'+id)
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while deleting item');
                                        return $q.reject(errResponse);
                                    }
                            );
            }
         
    };
 
}]);
//////////////////////////////////////////////////
	myApp.controller("myCtrl",["$scope","UserService",function($scope,$UserService)
	{
		$scope.data = [];
		
		$UserService.fetchAllItems().then(
			    function(result) {
			    	$scope.data = result;
			        console.log(result);
			        console.log($scope.data);
			     }
			 );
		
		$scope.DeleteFromCart = function(id)
		{
			$UserService.deleteItem(id).then(
				    function(result) {
				    	$scope.data = result;
				        console.log(result);
				        console.log($scope.data);
				     }
				 );
		}
	}]);
</script>

<body ng-app="myApp" ng-controller="myCtrl">

<c:import url="/head"/>

<br><br><br>

<form action="${flowExecutionUrl}&_eventId=goToProducts" method="post">
	<input type="submit" value="Back To Products" class="btn btn-danger"/>
</form>

<form action="${flowExecutionUrl}&_eventId=goToCheckout" method="post">
	<input type="submit" value="Confirm Shipping Details" class="btn btn-success"/>
</form>


<!--  -->

<div class="container" ng-repeat="x in data">
		
		

			<div class="row">
			
				<br>
				<div class="col-lg-12">
					<img src="${pageContext.request.contextPath}/{{x.Image}}" class="img img-responsive"></img>
				</div>
				
			</div>
		
			<div class="row">
			
				<br>
				<div class="col-lg-6">
					<label>Product Name:</label>
				</div>
				<div class="col-lg-6">
					<label>{{x.Name}}</label>
				</div>
				
			</div>
			
			<div class="row">
			
				<br>
				<div class="col-lg-6">
					<label>Product Description:</label>
				</div>
				<div class="col-lg-6">
					<label>{{x.Description}}</label>
				</div>
				
			</div>
			
			<div class="row">
			
				<br>
				<div class="col-lg-6">
					<label>Product Category:</label>
				</div>
				<div class="col-lg-6">
					<label>{{x.Category}}</label>
				</div>
				
			</div>
			
			<div class="row">
			
				<br>
				<div class="col-lg-6">
					<label>Product Price:</label>
				</div>
				<div class="col-lg-6">
					<label>{{x.Price}}</label>
				</div>
				
			</div>
			
			<div class="row">
			
				<br>
				<div class="col-lg-6">
					<label>Product Qty:</label>
				</div>
				<div class="col-lg-6">
					<label>{{x.Qty}}</label>
				</div>
				
			</div>
			
			
			<div class="row">
			
				<div class="col-lg-12">
					<br>
					<input type="submit" value="Delete From Cart" class="btn btn-danger" ng-click="DeleteFromCart(x.CartID)" />
				</div>
			
			</div>
			
		
		<br><br><br>
		
	</div>

<!--  -->

</body>
</html>
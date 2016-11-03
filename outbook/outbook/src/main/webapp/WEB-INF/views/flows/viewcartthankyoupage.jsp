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
         
            clearCart: function() {
                    return $http.post('http://localhost:9002/Outbook/flows/clearCart/')
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while fetching items');
                                        return $q.reject(errResponse);
                                    }
                            );
            }
         
    };
 
}]);
//////////////////////////////////////////////////
	myApp.controller("myCtrl",["$scope","UserService",function($scope,$UserService)
	{
		
		$UserService.clearCart().then(
			    function(result) {
			    	$scope.data = result;
			        console.log(result);
			        
			     }
			 );
		
		
	}]);
</script>

<body ng-app="myApp" ng-controller="myCtrl">

<c:import url="/head"/>

<br><br><br>

<h1 class="alert alert-success">Thank you for your business.</h1>

<br>

<a href="${pageContext.request.contextPath}/index" class="btn btn-warning">Home</a>
<a href="${pageContext.request.contextPath}/allproducts" class="btn btn-success">Back to Products</a>

</body>
</html>
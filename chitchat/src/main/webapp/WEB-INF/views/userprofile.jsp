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
     return $http.post('http://localhost:12216/chitchat/userprofile')
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

}]);
</script>

<body ng-app="myApp" ng-controller="myCtrl">

<div ng-controller="MyController" ng-init="getItems()">
     <ul>
        <li ng-repeat="item in items.results"> {{item.email}} </li>
    </ul>
</div>







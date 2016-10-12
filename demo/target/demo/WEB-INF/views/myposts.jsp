<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/header.jsp"%>


<div class="container-wrapper">
    <div class="container"  ng-app="postApp">
        <div class="page-header">
            <h3>My Posts</h3>
	   </div>
		<div ng-controller = "postCtrl">
      <c:forEach items="${userPost}" var="userpost">
                   <c:if test="${pageContext.request.userPrincipal.name  == userpost.username}">
                    ${userpost.posttitle}<br>
                    ${userpost.postmessage}<br>
                    ${userpost.username}<br>
                    ${userpost.postdate}<br>
       				<a href="editmypost/${userpost.postid}" class="btn btn-primary">Edit</a> 
                    <a href="" ng-click="delmypost(${userpost.postid})" class="btn btn-primary">Delete</a> <hr>
                  </c:if>
            </c:forEach>
      

</div>
</div>
<script>
var postApp = angular.module ("postApp", []);

postApp.controller("postCtrl", function ($scope, $http){
	
	 $scope.delmypost = function (postid) {
		    $http.put('/demo/deletemy/'+postid).success(function (data) {
	        	$scope.refreshPost();
	        });
		 };
		 
		 $scope.refreshPost = function () {
			 alert("aa gya");
		        $http.get('/demo/myposts').success(function (data) {
		        	  $scope.userPost=data;
		        });
		    };
	
});


</script>

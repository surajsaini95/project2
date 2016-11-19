<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/header.jsp"%>

<br><br>
<br><br>

<div style=" 
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 10px;
						    width: 20%;
						     background:#C0C0C0;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;">
                <h2 align="center">My Posts</h2>
	   </div>
<br>
<hr style=" display: block;
    margin-top: 0.5em;
    margin-bottom: 0.5em;
    margin-left: auto;
    margin-right: auto;
    border-style: inset;
    border-width: 4px;
border-color:#00f6ff;
width:100%;">
<br>
	   
	
	<div ng-app="postApp" ng-controller = "postCtrl">
      <c:forEach items="${userPost}" var="userpost">
                  
                  <c:if test="${pageContext.request.userPrincipal.name  == userpost.username}">
                    <div style=" margin:auto;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 60%;
						     background:#C0C0C0;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;">Title:${userpost.posttitle}<br>
                    Message:${userpost.postmessage}<br>
                    
                    Date:${userpost.postdate}<hr>
       				<a href="editmypost/${userpost.postid}" class="btn btn-primary">Edit</a> 
                    <a href="" ng-click="delmypost(${userpost.postid})" class="btn btn-primary">Delete</a> 
                </div>  <br><br></c:if>
            </c:forEach>
      

</div>
<script>
var postApp = angular.module ("postApp", []);

postApp.controller("postCtrl", function ($scope, $http){
	
	 $scope.delmypost = function (postid) {
		    $http.put('/demo/deletemy/'+postid).success(function (data) {
	        	
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

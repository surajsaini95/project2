<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@page isELIgnored="false" %>	
<html>
<head>
<c:url value="/resources/bootstrap/css" var="a"></c:url>
<c:url value="/resources/bootstrap/js" var="b"></c:url>
<link href="${a}/bootstrap.min.css" rel="stylesheet"/>
 <script src="${b}/jquery-2.2.3.min.js">
 </script>
<script src="${b}/bootstrap.min.js">
</script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
 <script>
 angular.module('myApp', [])
 .controller('ctrl2', function($scope) {
  $scope.chat =${list}  
 });
</script>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>demo</title>

    <!-- Angular JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js" > </script>
    <script type="text/javascript" src="<c:url value="/resources/js/controller.js" />"></script>
    

    <%--Jquery--%>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

    <%--Data Table--%>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">

    <!-- Carousel CSS -->
    <link href="<c:url value="/resources/css/carousel.css" />" rel="stylesheet">

    <!-- Main CSS -->
    <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">

    <link href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" rel="stylesheet">
<style> 
body
{
background-image:url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsuSaHXZoElkVtFCAZclL--s30IiS7m4X-x6vNAaJK1J3RQ7kb");
}
</style>

</head>
<body>
<div class="navbar-wrapper">
    <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                            aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                 
                </div>
                 <div align="right" class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="display:block">

                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="<c:url value="/" /> ">Home</a></li>
                       <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
                                  <li><a href="<c:url value="/editpost" /> ">Recent Posts</a></li>
                  	   </c:if>
                      <c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
                                 <li><a href="<c:url value="/recentpost" /> ">Recent Posts</a></li>
                      </c:if>
                    <li><a href="<c:url value="/chat" /> ">Chatold</a></li>
                     <li><a href="chatroom">CHAT</a></li>
     	<li class="${param.page == 'chatroom' ? 'active' : ''}"><a href="<c:url value="/chatroom.html" />">New Chatroom</a></li>
					<li class="${param.page == 'list' ? 'active' : ''}"><a href="<c:url value="/chatroom/list.html" />">Chatroom List</a></li>
				
                        </ul>
                       <ul class="nav navbar-nav pull-right">
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <li><a>Welcome: ${pageContext.request.userPrincipal.name}</a></li>
                             <li><a href="<c:url value="/addpost" />">Add Post</a></li>
                      <li><a href="<c:url value="/myposts" /> ">My Posts</a></li>
                      <li><a href="<c:url value="/j_spring_security_logout" />">Logout</a></li>
                                  </c:if>
                        <c:if test="${pageContext.request.userPrincipal.name  == null}">
                        <li><a href="<c:url value="/login" />">Login</a></li>
                        <li><a href="<c:url value="/register" />">Register</a></li>
                        </c:if>
                    </ul>
                </div>
            </div></div>
        </nav>

    </div>
</div>

<br><br><br>
<div class="jumbotron" style=" margin:auto;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 30%;
						     background:#00f6ff;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;
						   ">
<h2>${chatroom.name}</h2>
${chatroom.description}<br><br>
</div>
<br>
<div class="jumbotron" style=" margin:auto;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 90%;
						    height:25%;
						     background:#C0C0C0;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;
						   ">

<form action="" method="post">
	<input type="hidden" name="id" value="${chatroom.id}">
	<div class="form-group">
		<div class="col-sm-5">
			<input  class="form-control" placeholder="Message" name="message" autofocus="autofocus"></textarea>
		</div>
		<div class="col-sm-5">
			<input type="submit" class="btn btn-primary" value="Send" />
		</div>
	</div>
</form>
</div>
<br><br><br>
<script>
 var repeatme = function print() {
		$.ajax({
			url : '<spring:url value="/chatroom/detail/${chatroom.id}.json" />',
			cache : false
		}).done(function(data) {
			$(".messages").html("");
			$.each(data.chatmessages, function(index, value) {
				$(".messages").append(value.message + "<br>");
			});
		});
	};

	$(document).ready(function() {
		repeatme();
		//setInterval(repeatme, 1000);
	}); 
</script>

<!-- <div class="list-group" ng-repeat="x in chat">
    <a href="#" class="list-group-item active">
        <p class="list-group-item-text">{{x.message}}</p>
    </a>
</div> -->
<div class="messages" style=" margin:auto;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 90%;
						    
						     background:#C0C0C0;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;
						   "></div>

<br>
           
<c:forEach items="${messages}" var="m">
               <div style=" margin:auto;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 90%;
						     background:#00f6ff;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;">
                     <table width=100%><tr><td><center> $(m)</center></td></tr></table>
                   
                   
                   
           </div><br>
            </c:forEach>
 
</body>
</html>

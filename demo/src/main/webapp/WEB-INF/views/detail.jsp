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
    

    Jquery
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">

   
    <!-- Main CSS -->
    <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">

    <link href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" rel="stylesheet">
<style> 
body
{
background-image:url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsuSaHXZoElkVtFCAZclL--s30IiS7m4X-x6vNAaJK1J3RQ7kb");
}
/* 
div {
 border: 1px dotted red;
 padding: 10px;    
}
 */
#my{
position:relative;
float:right;
               				 border-radius: 25px;
						    border: 1px solid #73AD21;
						    padding: 10px;
						    width: 60%;
						     background:#00f6ff;
						    color:black;
						   
						    border-style:solid;
						    border-color:blue;
}
#other{
float:left;
               				 border-radius: 25px;
						    border: 1px solid #73AD21;
						    padding: 10px;
						    width: 60%;
						     background:#00f6ff;
						    color:black;
						    
						    border-style:solid;
						    border-color:blue;
}
#space{
margin:auto;
               				 border-radius: 5px;
						    border: 1px solid #73AD21;
						    padding: 10px;
						    width: 80%;
						     background:orange;
						   border-style:solid;
						    border-color:transparent;
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
                    <li><a href="<c:url value="/chat" /> ">Chat</a></li>
                    
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

<br>
<div class="jumbotron" style=" margin:auto;
               				 border-radius: 20px;
						    border: 1px solid #73AD21;
						    padding: 5px;
						    width: 30%;
						     background:#00f6ff;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;
						   ">
<h2>Chatroom : ${chatroom.name}</h2>
User : ${pageContext.request.userPrincipal.name}<br><br>
</div>
<br>
<div class="jumbotron" style=" margin:auto;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 10px;
						    width: 90%;
						    height:15%;
						     background:#C0C0C0;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;
						   ">

<form action="" method="post">
	<input type="hidden" name="id" value="${chatroom.id}">
	<input type="hidden" name="user" value="${pageContext.request.userPrincipal.name}">
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
<br>
<br>

<jsp:include page="texts.jsp"/>
</body>


</html>






<%-- 
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
    

    Jquery
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">

   
    <!-- Main CSS -->
    <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">

    <link href="https://cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css" rel="stylesheet">
<style> 
body
{
background-image:url("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsuSaHXZoElkVtFCAZclL--s30IiS7m4X-x6vNAaJK1J3RQ7kb");
}
/* 
div {
 border: 1px dotted red;
 padding: 10px;    
}
 */
#my{
position:relative;
float:right;
               				 border-radius: 25px;
						    border: 1px solid #73AD21;
						    padding: 10px;
						    width: 60%;
						     background:#00f6ff;
						    color:black;
						   
						    border-style:solid;
						    border-color:blue;
}
#other{
float:left;
               				 border-radius: 25px;
						    border: 1px solid #73AD21;
						    padding: 10px;
						    width: 60%;
						     background:#00f6ff;
						    color:black;
						    
						    border-style:solid;
						    border-color:blue;
}
#space{
margin:auto;
               				 border-radius: 5px;
						    border: 1px solid #73AD21;
						    padding: 10px;
						    width: 80%;
						     background:orange;
						   border-style:solid;
						    border-color:transparent;
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
                    <li><a href="<c:url value="/chat" /> ">Chat</a></li>
                    
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

<br>
<div class="jumbotron" style=" margin:auto;
               				 border-radius: 20px;
						    border: 1px solid #73AD21;
						    padding: 5px;
						    width: 30%;
						     background:#00f6ff;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;
						   ">
<h2>Chatroom : ${chatroom.name}</h2>
User : ${pageContext.request.userPrincipal.name}<br><br>
</div>
<br>
<div class="jumbotron" style=" margin:auto;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 10px;
						    width: 90%;
						    height:15%;
						     background:#C0C0C0;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;
						   ">

<form action="" method="post">
	<input type="hidden" name="id" value="${chatroom.id}">
	<input type="hidden" name="user" value="${pageContext.request.userPrincipal.name}">
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
<br>
<script>
 var repeatme = function print() {
		$.ajax({
			url : '<spring:url value="/chatroom/detail/${chatroom.id}.json" />',
			cache : false
		}).done(function(data) {
			$(".messages").html("");
			$.each(data.chatmessages, function(index, value) {
				
				var iDiv = document.createElement('div');
			if(value.user=="${pageContext.request.userPrincipal.name}")
					{
					iDiv.id = 'my';
					iDiv.innerHTML ='I said  :   ';
					}
				else
				{
				iDiv.id = 'other';

				iDiv.innerHTML =value.user+' said  :   ';
				}
			
			/* iDiv.className = 'block';
			 */	  
				document.getElementsByClassName('messages')[0].appendChild(iDiv);
				
			
				iDiv.innerHTML =iDiv.innerHTML+value.message;
				
				/* var iDiv2 = document.createElement('div');
				iDiv2.id = 'space';
				document.getElementsByClassName('messages')[0].appendChild(iDiv2);
				 */
				
		/* 		document.getElementById('my').innerHTML.append("<br> By me..");
		 */ 	/* 	$(".messages").innerHTML=value.user;
				 */
				
				
			});
		});
	};

	$(document).ready(function() {
		 repeatme();  
		/* $route.reload(); */
		$interval(repeatme,1000); 
	}); 
	
	
	
</script>

<script>
 var app=angular.module('myApp', [])
 app.controller('ctrl2', function($scope,$http) {
	 $http.get("/chatroom/detail/${chatroom.id}.json")
	    .then(function(response) {
	        $scope.messages = response.data;
	    });
 });
</script>

<div ng-app="myApp" ng-controller="ctrl2" class="messages" style=" margin:auto;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 90%;
						    height:70%;
						    overflow:auto;
						     background:white;
						    color:black;
						   /*  opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;
						   "></div>
<br>
<br>
<div ng-app="myApp" ng-controller="ctrl2"> 

<p>Today's welcome message is:</p>
<h1>{{messages}}</h1>

</div>
</body>


</html>
 --%>
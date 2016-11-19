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
    

    <%--Jquery--%>
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
				document.getElementsByClassName('messages')[0].appendChild(iDiv);
				iDiv.innerHTML =iDiv.innerHTML+value.message;
				
			});
		});
	};

	$(document).ready(function() {
	 repeatme();  
		/* $route.reload(); */
		/*$interval(repeatme,1000);  */
		setInterval(function(){
			repeatme()
		},1000);
		
	}); 
	
	setTimeout("repeatme();",1000);
	
</script>
<div class="messages" style=" margin:auto;
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
</body>
</html>

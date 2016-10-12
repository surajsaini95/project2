<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/header.jsp"%>

<br><br>
<br><br>

<div style=" margin:auto;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 10px;
						    width: 20%;
						     background:#C0C0C0;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;">
                <h3>All Posts</h3>
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
width:90%;">
<br>
	   
        <!-- <div style="          margin:auto;
               				 border-radius: 25px;
						    border: 5px solid #73AD21;
						    padding: 20px;
						    width: 90%;
						    overflow:scroll; 
						    height:400px;
						     background:black;
						    color:#00f6ff;
						    border-style:solid;
						    border-color:green;">
        -->       
           
	    <c:forEach items="${userPost}" var="userpost">
               <div style=" float:left;
               				 border-radius: 50%;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 8%;
						     background:#C0C0C0;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;">
                   <p>${userpost.username}</p>
         </div>
         <div style=" float:clear;
         margin:-10px;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 70%;
						     background:#00f6ff;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;">
                    
                    <p>${userpost.postmessage}</p>
                   
           </div><br>
            </c:forEach>
 
         
      


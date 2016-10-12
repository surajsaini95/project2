<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/header.jsp"%>

<br><br>
   <div class="page-header">
            <h3>All Posts</h3>
	   </div>
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
               <div style=" margin:auto;
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
                   
           </div><br><br><br>
            </c:forEach>
 
         
      


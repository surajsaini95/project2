<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/header.jsp" %>
<br>
<br>
<br>
<br>
<div style=" float:left;
               				 border-radius: 50%;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 15%;
						     background:#00f6ff;
						     		    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;">
                  
  <h2>Add post</h2>
</div>
<br>
<br>
<br>
<br>
<br>
          <div style=" float:left;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 50%;
						     background:#00f6ff;
						     		    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;">
						    
    <form:form action="${pageContext.request.contextPath}/addnewpost" method="post" commandName="userPost" >
        <div class="form-group">
            <label for="title">Title</label> <form:errors path="posttitle" cssStyle="color: #ff0000;" />
            <form:input path="posttitle" id="title"  class="form-Control"/>
        </div>

       
        <div class="form-group">
            <label for="message">message</label>
            <form:textarea path="postmessage" id="message" class="form-Control"/>
        </div>
   <br><br>
 
    <form:input path="username" id="username" type="hidden" value="${pageContext.request.userPrincipal.name}"/>
 
        <input type="submit" value="Add Post" class="btn btn-default">
        <input type="reset" value="Clear" class="btn btn-default">
       </form:form>

 
 </div>

   <%@include file="/WEB-INF/views/footer.jsp" %>

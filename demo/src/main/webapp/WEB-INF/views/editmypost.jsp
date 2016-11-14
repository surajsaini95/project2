<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/header.jsp" %>
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
	   
	 <div style=" margin:auto;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 60%;
						     background:#C0C0C0;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;">    <form:form action="${pageContext.request.contextPath}/editmy" method="post" commandName="userPost" >
        <form:hidden path="postid" value="${userPost.postid}" />
        <form:hidden path="username" value="${userPost.username}" />
        <%-- <form:hidden path="postdate" value="${userPost.postdate}" />
         --%>

        <div class="form-group">
            <label for="title">Title</label>
            <form:input path="posttitle" id="title" class="form-Control" value="${userPost.posttitle}"/>
        </div>

        <div class="form-group">
            <label for="message">Message</label>
            <form:textarea path="postmessage" id="message" class="form-Control" value="${userPost.postmessage}"/>
        </div>

       
        <br><br>
        <input type="submit" value="Edit" class="btn btn-default">
        <a href="<c:url value="/myposts" />" class="btn btn-default">Cancel</a>
        </form:form>

</div>
      
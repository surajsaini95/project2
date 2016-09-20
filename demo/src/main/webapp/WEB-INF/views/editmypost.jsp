<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Edit Post</h1>
	    </div>

        <form:form action="${pageContext.request.contextPath}/editmy" method="post" commandName="userPost" >
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

</div></div>
      
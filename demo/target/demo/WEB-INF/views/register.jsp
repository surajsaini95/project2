<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/header.jsp" %>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Register Customer</h1>

            <p class="lead">Please fill in your information below:</p>
        </div>

        <form:form action="${pageContext.request.contextPath}/register" method="post" commandName="customer">

        <h3>Basic Info</h3>

        <div class="form-group">
            <label for="name">Name</label><form:errors path="customerName" cssStyle="color: #ff0000"/>
            <form:input path="customerName" id="name" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="email">Email</label><span style="color: #ff0000">${emailMsg}</span><form:errors
                path="customerEmail" cssStyle="color: #ff0000"/>
            <form:input path="customerEmail" id="email" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <form:input path="customerPhone" id="phone" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="username">Username</label><span style="color: #ff0000">${usernameMsg}</span><form:errors
                path="username" cssStyle="color: #ff0000"/>
            <form:input path="Username" id="username" class="form-Control"/>
        </div>

        <div class="form-group">
            <label for="password">Password</label><form:errors path="password" cssStyle="color: #ff0000"/>
            <form:password path="password" id="password" class="form-Control"/>
        </div>


        
        <br><br>
        <input type="submit" value="submit" class="btn btn-default">
        <a href="<c:url value="/" />" class="btn btn-default">Cancel</a>
        </form:form>


        <%@include file="/WEB-INF/views/footer.jsp" %>

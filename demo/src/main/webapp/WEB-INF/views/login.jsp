<%@include file="/WEB-INF/views/header.jsp" %>
<br>
<br>
<br>
<br>
<div style=" float:left;
               				 border-radius: 50%;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 11%;
						     background:#00f6ff;
						     		    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;">
                  
  <h2>Login</h2>
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
                  
  
            <c:if test="${not empty msg}">
                <div class="msg">${msg}</div>
            </c:if>

            <form name="loginForm" action="<c:url value="/j_spring_security_check" />" method="post">
                <c:if test="${not empty error}">
                    <div class="error" style="color: #ff0000;">${error}</div>
                </c:if>
                <div class="form-group">
                    <label for="username">User: </label>
                    <input type="text" id="username" name="username" class="form-control" autofocus/>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" class="form-control" />
                </div>

                <input type="submit" value="Submit" class="btn btn-default">

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>

        </div>
    

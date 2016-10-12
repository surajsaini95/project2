<%@include file="/WEB-INF/views/header.jsp" %>

<%@page isELIgnored="false" %>	
<c:url value="/resources/bootstrap/css" var="a"></c:url>
<c:url value="/resources/bootstrap/js" var="b"></c:url>
<link href="${a}/bootstrap.min.css" rel="stylesheet"/>
 <script src="${b}/jquery-2.2.3.min.js">
 </script>
<script src="${b}/bootstrap.min.js">
</script>
<br>
<br>
<br>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="jumbotron" style=" margin:auto;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 50%;
						     background:#00f6ff;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;
						   ">
<h2><center>Create a new chatroom here...</center></h2>
</div>
<br>
<br>
 <div style=" margin:auto;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 40%;
						     background:#C0C0C0;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;">
                    <form:form cssClass="form-horizontal" commandName="chatroom">

	<c:if test="${param.success}">
		<div class="form-group">
			<div class="col-sm-6">
				<div class="alert alert-success">
					Successfully saved!
				</div>
			</div>
		</div>
	</c:if>

	<div class="form-group errorMsg" style="display: none">
		<div class="col-sm-6">
			<div class="alert alert-danger">
				Error! Check form!
			</div>
		</div>
	</div>

	<form:errors path="name" />
	<div class="form-group">
		<div class="col-sm-12">
			<form:input cssClass="form-control" placeholder="Name" path="name" />
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-12">
			<form:textarea cssClass="form-control" placeholder="Description" path="description" />
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-5">
			<input type="submit" class="btn btn-primary btnSubmit" value="Create" />
		</div>
	</div>
</form:form>

                    
                                
           </div><br>
           


<script type="text/javascript">
	$(document).ready(function() {
		$(".btnSubmit").click(function(e) {
			if(! $("#name").val()) {
				e.preventDefault();
				$(".errorMsg").show();
			}
		});
	});
</script>


<%@include file="/WEB-INF/views/footer.jsp" %>
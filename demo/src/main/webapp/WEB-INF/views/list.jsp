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


<br>
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
<h2><center>Chatrooms Available to join......</center></h2>
</div>
<br>
<br>
 <div style=" margin:auto;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 90%;
						     background:#C0C0C0;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;">
                    
                    <table width=100%><th><td><center>Name</center></td><td><center>Description</center></td><td><center>Remove</center></td></th></table>
                   
           </div><br>
           
<c:forEach items="${chatrooms}" var="chat">
               <div style=" margin:auto;
               				 border-radius: 50px;
						    border: 1px solid #73AD21;
						    padding: 20px;
						    width: 90%;
						     background:#00f6ff;
						    color:black;
						    /* opacity:0.5; */
						    border-style:solid;
						    border-color:transparent;">
                     <table width=100%><tr><td><center><a href="detail.html?id=${chat.id}"> ${chat.name}</a></center></td><td><center>${chat.description}</center></td><td><center><a href="remove.html?id=${chat.id}" class="btn btn-primary btn-danger btn-remove">remove</a>
	</center></td></tr></table>
                   
                   
                   
           </div><br>
            </c:forEach>
 <br><br><br><br><br>


<a href="<c:url value="/chatroom.html" />"><div class="jumbotron" style=" margin:auto;
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
<h4><center>Make a new chatroom......</center></h4>

<script type="text/javascript">

$(document).ready(function() {
	$(".btn-remove").click(function(e) {
		// do not remove just yet :-)
		e.preventDefault();
		// pass URL to dialog
		$("#myModal .btn-danger").attr("href", $(this).attr("href"));
		// show dialog
		$('#myModal').modal();
	});
});
	
</script>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">Really remove?</h4>
      </div>
      <div class="modal-body">
        Do you really want to remove this chatroom? 
        There's no going back!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <a type="button" class="btn btn-danger" href="">remove</a>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<%@include file="/WEB-INF/views/footer.jsp" %>

<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/template/header.jsp"%>

<script>
   
   $(document).ready(function(){
        var searchCondition = '${searchCondition}';

        $('.table').DataTable({
           /*  "lengthMenu": [[1,2,3,5,10,-1], [1,2,3,5,10, "All"]],
            */  scrollY:        '50vh',
            scrollCollapse: true,
            "paging":   false,
             "oSearch": {"sSearch": searchCondition,
            	 			"hidden":true}
             
        });
    });

</script>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h3>All Posts</h3>
	   </div>

        <table class="table table-striped table-hover" >
            <thead>
            <tr class="bg-success">
                <th>Post Title</th>
                <th>Post Message</th>
                <th>Posted by</th>
                <th>Post Time</th>
             </tr>
            </thead>
            <c:forEach items="${userPost}" var="userpost">
                <tr>
                    <td>${userpost.posttitle}</td>
                    <td>${userpost.postmessage}</td>
                    <td>${userpost.username}</td>
                    <td>${userpost.postdate}</td>
                </tr>
            </c:forEach>
        </table>


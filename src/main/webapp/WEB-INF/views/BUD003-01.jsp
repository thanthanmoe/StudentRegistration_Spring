<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="ttm.*,ttm.daos.CourseDao,ttm.models.*,java.util.*"%>
<%@ include file="header.jsp"%>
    
        <title>Course Management</title>
</head>

<body>
<%@ include file="navbar.jsp"%>
<%
CourseDao cdao = new CourseDao();
	List<CourseModel> srs=cdao.allCourse();
	request.setAttribute("list", srs);
%>
    <div class="main_contents">
    <div id="sub_content">
        <form class="row g-3 mt-3 ms-2" >
        	<h3 style="color: red">${error }</h3>
           
       
    	
        <table class="table table-striped" id="stduentTable">
            <thead>
                <c:if test="${list!=null }">
                <tr>
                    
                    <th scope="col">Course ID</th>
                    <th scope="col">Course Name</th>
                    <th scope="col">Details</th>
                    
                </tr>
                </c:if>
            </thead>
            <tbody>
            <c:forEach items="${list }" var="u">
                <tr>
                    <td>COU${u.id}</td>
                    <td>${u.course_name }</td>
                    
                
                <td><button type="submit" class="btn btn-secondary mb-3" data-bs-toggle="modal"
                    data-bs-target="#exampleModal" onclick="location.href = '/StudentRegistrationSpring/courseDelete/${u.id}';">Delete</button></td>
    
                </tr>
    		 <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Course Deletion</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        
                         <h5 style="color: rgb(127, 209, 131);">Are you sure want to delete !</h5>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success col-md-2" data-bs-dismiss="modal" onclick="location.href = '/StudentRegistrationSpring/courseDelete/${u.id}';">Ok</button>
    
                    </div>
                    
                </div>
            </div>
        </div>
                </c:forEach>
            </tbody>
        </table>
    
        </form>
       
    </div>
</div>
 <%@ include file="footer.jsp"%>


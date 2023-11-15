<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="ttm.*,ttm.daos.UserDao,ttm.models.*,java.util.*"%>
<%@ include file="header.jsp"%>
    
        <title>User Management</title>
</head>

<body>
<%@ include file="navbar.jsp"%>
	<%
	UserDao userdao = new UserDao();
	 List<UserModel> urs = userdao.getallUser();

	request.setAttribute("urs", urs);
%>
    <div class="main_contents">
    <div id="sub_content">
        <form class="row g-3 mt-3 ms-2" action="/StudentRegistrationSpring/userSearch" method="POST">
        	<h3 style="color: red">${error }</h3>
            <div class="col-auto">
                <input type="text" class="form-control" id="staticEmail2" placeholder="User ID" name="id">
            </div>
            <div class="col-auto">
                <input type="text" class="form-control" id="inputPassword2" placeholder="User Name" name="name">
            </div>
    
            <div class="col-auto">
                <input type="submit" class="btn btn-primary mb-3" value="Search">
            </div>
           
            
           
            <div class="col-auto" class="row g-3 mt-3 ms-2">
                <button type="reset" class="btn btn-danger mb-3">Reset</button>
            </div>
        </form>
    	
        <table class="table table-striped" id="stduentTable">
            <thead>
                <c:if test="${urs!=null }">
                <tr>
                    
                    <th scope="col">User ID</th>
                    <th scope="col">User Name</th>
                    <th scope="col">Email</th>
                     <th scope="col"> &#128526;Role 	&#128248;Photo</th>
                     <th scope="col"></th>
                    <th scope="col">Details</th>
                    
                </tr>
                </c:if>
            </thead>
            <tbody>
     
			<c:forEach items="${ur != null ? ur : urs}" var="u">
                <tr>
                    <td>USR${u.id}</td>
                    <td>${u.name }</td>
                    <td>${u.email}</td>
                    <td>
                    <c:set var="id" value="${u.id}" />
                   ${u.role }
                   <%
					
                    int userId = (Integer) pageContext.getAttribute("id");
					UserDao dao = new UserDao();
					List<UserModel> us = dao.userPhoto(userId);
					request.setAttribute("images", us);
					%>
					<c:if test="${empty images}">
										<img src="assets/image/admin.JPG" alt="..."
											style="width: 70px; height: 70px; border-radius: 45%;">
				</c:if>
 					<c:forEach items="${images}" var="ims">
									<c:if test="${not empty ims.user_photo}">
										<img src="assets/image/${ims.user_photo}" alt="..."
											style="width: 70px; height: 70px; border-radius: 45%;">
									</c:if>
									
						</c:forEach><td>
                
                <td><button type="button" class="btn btn-secondary mb-3" data-bs-toggle="modal"
                    data-bs-target="#exampleModal" onclick="location.href = '/StudentRegistrationSpring/userDelete/${u.id}';">Delete</button></td>
    
                </tr>
    		 <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Student Deletion</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        
                         <h5 style="color: rgb(127, 209, 131);">Are you sure want to delete !</h5>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success col-md-2" data-bs-dismiss="modal" onclick="location.href = '/StudentRegistrationSpring/userDelete/${u.id}';">Ok</button>
    
                    </div>
                    
                </div>
            </div>
        </div>
                </c:forEach>
            </tbody>
        </table>
    
       
       
    </div>
</div>
 <%@ include file="footer.jsp"%>


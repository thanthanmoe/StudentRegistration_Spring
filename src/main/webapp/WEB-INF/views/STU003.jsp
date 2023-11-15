<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="ttm.*,ttm.daos.StudentDao,ttm.models.*,java.util.*"%>
<%@ include file="header.jsp"%>
    
        <title>Student Search</title>
</head>

<body>
<%@ include file="navbar.jsp"%>
<%
	StudentDao sdao = new StudentDao();
	 List<StudentModel> sr = sdao.allStudentUser();

	request.setAttribute("srs", sr);
%>
      <div class="main_contents">
    <div id="sub_content">
      <form:form class="row g-3 mt-3 ms-2" action="/StudentRegistrationSpring/studentSearch" method="POST">
      <h3 style="color: red">${error }</h3>
        <div class="col-auto">
          <label for="staticEmail2" class="visually-hidden">studentID</label>
          <input type="text"  class="form-control" id="staticEmail2" placeholder="Student ID" name="id">
        </div>
        <div class="col-auto">
          <label for="inputPassword2" class="visually-hidden">studentName</label>
          <input type="text" class="form-control" id="inputPassword2" placeholder="Student Name" name="name">
        </div>
        <div class="col-auto">
            <label for="inputPassword2" class="visually-hidden">Course</label>
            <input type="text" class="form-control" id="inputPassword2" placeholder="Course" name="attend">
          </div>
        <div class="col-auto">
          <button type="submit" class="btn btn-success mb-3" >Search</button>
        </div>
        
        <div class="col-auto">
          <button type="reset" class="btn btn-secondary mb-3">Reset</button>
        </div>
      </form:form>
<div>
<c:if test="${srs!=null }">
      <table class="table table-striped" id="stduentTable">
        <thead>
          
          <tr>
            <th scope="col">&#128526;</th>
            <th scope="col">Student ID</th>
            <th scope="col">Name</th>
            <th scope="col">Course Name</th>
             <th scope="col">Photo</th>
            <th scope="col">Details</th>
          </tr>
          
        </thead>
        <tbody>
	      <c:forEach items="${list != null ? list :srs}" var="u" varStatus="status">
	          <tr>
	           <td>${status.index+1}</td>
				<td>STU${u.getId()}</td>
				<td>${u.getName()}</td>
				<td>  <c:set var="id" value="${u.getId()}" />
				<%
					
                    int studentId = (Integer) pageContext.getAttribute("id");
					StudentDao dao = new StudentDao();
					List<StudentModel> stu = dao.studentId(studentId);
					request.setAttribute("stu", stu);
					%>
				<c:forEach items="${stu}" var="stu" varStatus="status">
				${stu.getAttend()}${status.last ? '' : ','}
				</c:forEach>
				</td>
				<td><img src="assets/image/${u.getPhoto()}" alt="..." style="width: 70px; height: 70px; border-radius: 45%;"> </td>
				<td>
	              <a href="/StudentRegistrationSpring/stuUpdate/${u.getId()}" class="btn btn-secondary mb-2">See More</a> 
	            </td>
	           </tr>
	         </c:forEach>
          
         
          
        </tbody>
      </table>
      </c:if>
    </div>
</div>
</div>
 <%@ include file="footer.jsp"%>      
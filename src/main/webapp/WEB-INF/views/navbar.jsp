
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page
	import="ttm.*,ttm.daos.UserDao,ttm.daos.CourseDao,ttm.models.*,java.util.*"%>
<c:set var="image" value="${empty usr ? null : usr}" />
<%
UserDao udao = new UserDao();
int user_id = (Integer) session.getAttribute("user_id");
List<UserModel> usr = udao.userPhoto(user_id);
request.setAttribute("image", usr);

String id = String.valueOf(user_id);
List<UserModel> user = udao.userId(id);
request.setAttribute("user", user);
%>

<div id="testheader">
	<div class="container">
		<div class="row mb-5">
			<div class="col-md-5">
				<a href="#"><h3>Student Registration</h3></a>
			</div>
			<c:forEach items="${image}" var="im">
			
				<div class="col-md-1">
				
					<img  src="${pageContext.request.contextPath}/assets/image/${im.user_photo}" alt="..."
						style="width: 70px; height: 70px; border-radius: 45%;">
						
				</div>
			</c:forEach>
			<c:if test="${empty image}">
				<div class="col-md-1">
				
					<img src="${pageContext.request.contextPath}/assets/image/admin.JPG" alt="..."
						style="width: 70px; height: 70px; border-radius: 45%;">
						
				</div>
			</c:if>
			
			<div class="col-md-4">
				<p>${sessionScope.foundUser.role}:
					<c:forEach items="${user}" var="user">${user.name }</c:forEach> <input type="button"
						class="btn btn-secondary" value="UpdateProfile"
						onclick="location.href='/StudentRegistrationSpring/userUpdate/${sessionScope.foundUser.id}';">
				</p>
				<p>
				<%
            Date currentDate = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            String formattedDate = formatter.format(currentDate);
            out.println(formattedDate);
          %>
			</p>
			
			</div>
			<div class="col-md-1">
				<input type="button" class="btn btn-secondary" id="lgnout-button"
					value="Log Out"
					onclick="location.href='/StudentRegistrationSpring/logout'">
			</div>
		</div>
	</div>
</div>
<c:if test="${sessionScope.foundUser.role=='Admin'}">
	<!-- <div id="testsidebar">Hello World </div> -->
	<div class="sidenav">

		<button class="dropdown-btn">
			Class Management <i class="fa fa-caret-down"></i>
		</button>

		<div class="dropdown-container">
			<a href="/StudentRegistrationSpring/course">Course Registration </a>
			<a href="/StudentRegistrationSpring/allCourse">Course Management</a> <a
				href="/StudentRegistrationSpring/student">Student Registration </a>
			<a href="/StudentRegistrationSpring/studentSearch">Student Search
			</a>
		</div>
		<a href="/StudentRegistrationSpring/userSearch">Users Management</a>
	</div>


	<script>
            /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
            var dropdown = document.getElementsByClassName("dropdown-btn");
            var i;
            
            for (i = 0; i < dropdown.length; i++) {
              dropdown[i].addEventListener("click", function() {
              this.classList.toggle("active");
              var dropdownContent = this.nextElementSibling;
              if (dropdownContent.style.display === "block") {
              dropdownContent.style.display = "none";
              } else {
              dropdownContent.style.display = "block";
              }
              });
            }
            </script>
</c:if>

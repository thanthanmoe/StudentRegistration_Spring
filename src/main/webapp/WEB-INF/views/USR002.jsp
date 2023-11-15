
   <%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="ttm.*,ttm.daos.UserDao,ttm.daos.CourseDao,ttm.models.*,java.util.*"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="header.jsp"%>
  
        <title class="text-dark">User Update</title>
</head>

<style>
	.input-group {
  position: relative;
}

#togglePasswordIcon,#togglePasswordIcons {
  position: absolute;
  top: 50%;
  right: 10px;
  transform: translateY(-50%);
  cursor: pointer;
}
</style>
<body>
<%@ include file="navbar.jsp"%>
    <div class="main_contents">
    <div id="sub_content">
        <form:form action="/StudentRegistrationSpring/update" method="POST" modelAttribute="user" enctype="multipart/form-data"  onsubmit="return validateForm()">
        <h2 class="col-md-6 offset-md-2 text-dark mb-5 mt-4">User Update</h2>
       <h3 style="color: red" class="col-md-6 offset-md-2 mb-2 mt-2">${error }</h3>
        <h3 style="color: red" class="col-md-6 offset-md-2 mb-2 mt-2">${success }</h3>
       
      <c:forEach items="${image}" var="im">
    
        <div class="row mb-4">
            <div class="col-md-2"></div>
            <label for="text" class="col-md-2 text-dark col-form-label">Delete Profile Photo</label>
            <div class="col-md-4">
           &#128073;&#127995;
             <a href="/StudentRegistrationSpring/photoDelete/${sessionScope.foundUser.id}">
		      <img  src="${pageContext.request.contextPath}/assets/image/${im.user_photo}" alt="..."
								style="width: 70px; height: 70px; border-radius: 45%;">
		     </a>
            </div>
        </div>
        
        </c:forEach>
        <div class="row mb-4">
            <div class="col-md-2"></div>
            
            <div class="col-md-4">
                <input type="hidden" class="form-control" id="id"  name="id" value="${id }" readonly="readonly">
            </div>
        </div>
        <c:forEach items="${users }" var="u">
        
        
        <div class="row mb-4">
            <div class="col-md-2"></div>
            <label for="text" class="col-md-2 text-dark col-form-label">User Name</label>
            <div class="col-md-4">
                <input type="text" class="form-control" id="name"  name="name" value="${u.name }" placeholder="Enter Name" required>
            </div>
        </div>
       
         <div class="row mb-4">
            <div class="col-md-2"></div>
            <label for="email" class="col-md-2 text-dark col-form-label">Email</label>
            <div class="col-md-4">
                <input type="text" class="form-control" id="email" name="email" value="${u.email }" placeholder="Enter Email" required>
            </div>
        </div>
        <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="Passowrd" class="col-md-2 text-dark col-form-label">Passowrd</label>
					<div class="col-md-4 form-group">
						<div class="input-group">
							<input type="password" class="form-control" id="password"
								name="password"  value="${u.password }" placeholder="Enter Password" required> <i
								class="fa fa-eye-slash" id="togglePasswordIcon"
								onclick="togglePasswordVisibility()"></i>
						</div>
					</div>
				</div>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="confirmPassword" class="col-md-2 text-dark col-form-label">Confirm Passowrd</label>

					<div class="col-md-4 form-group">
						<div class="input-group">
							<input type="password" class="form-control" id="passwords"
								name="password1"  value="${u.password }" placeholder="Enter Confirm Password" required> <i
								class="fa fa-eye-slash" id="togglePasswordIcons" 
								onclick="togglePasswordVisibilitys()" ></i>
						</div>
						<div id="passError" class="input-group" style="color: red;"></div>
					</div>
					
				</div>
         
        <div class="row mb-4">
            <div class="col-md-2"></div>
            <label for="userRole" class="col-md-2 text-dark col-form-label">User Role</label>
            <div class="col-md-4">
                <select class="form-select" aria-label="Education" id="userRole" name="role" required>
                     <option <c:if test="${u.role=='Admin' }">selected</c:if> value="Admin" <c:if test="${u.role=='User' }">disabled="disabled"</c:if>>Admin</option>
                    <option <c:if test="${u.role=='User' }">selected</c:if> value="User" <c:if test="${u.role=='Admin' }">disabled="disabled"</c:if>>User</option>


                </select>
               
            </div>
        </div>
        <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="name" class="col-md-2 col-form-label">Photo</label>
                <div class="col-md-4">
                    <input type="file" class="form-control" id="part" name="file" >
                   
                </div>
               
            </div>
            
     </c:forEach>
     
        <div class="row mb-4">
            <div class="col-md-4"></div>

            <div class="col-md-6">
               

                <button type="button" class="btn btn-success col-md-2" data-bs-toggle="modal" data-bs-target="#exampleModal" >Update</button>
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title text-dark" id="exampleModalLabel">User Update</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                               
                               <h5 style="color: rgb(127, 209, 131);">Succesfully Updated !</h5>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success col-md-2" data-bs-dismiss="modal">Ok</button>
								
							</div>
                        </div>
                    </div>
         </div>
  		 <c:choose>
    <c:when test="${sessionScope.foundUser.role == 'Admin'}">
        <button type="button" class="btn btn-secondary col-md-2" onclick="location.href='/StudentRegistrationSpring/mnu';">Back</button>
    </c:when>
    <c:otherwise>
        <button type="button" class="btn btn-secondary col-md-2" onclick="location.href='/StudentRegistrationSpring/student';">Back</button>
    </c:otherwise>
</c:choose>

		

		</div>
    
		</div>
        
        </form:form>
 </div>
 </div>
 <script type="text/javascript">
 function validateForm() {
	    var password = document.getElementById("password").value;
	    var confirmPassword = document.getElementById("passwords").value;

	    if (password !== confirmPassword) {
	    	document.getElementById("passError").innerHTML = "Password and Confirm Password must match";
			return false;
	    }

	}
 
function togglePasswordVisibility() {
    var passwordInput = document.getElementById("password");
    var toggleIcon = document.getElementById("togglePasswordIcon");

    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        toggleIcon.classList.remove("fa-eye-slash");
        toggleIcon.classList.add("fa-eye");
    } else {
        passwordInput.type = "password";
        toggleIcon.classList.remove("fa-eye");
        toggleIcon.classList.add("fa-eye-slash");
    }
}

function togglePasswordVisibilitys() {
    var passwordInput = document.getElementById("passwords");
    var toggleIcon = document.getElementById("togglePasswordIcons");

    if (passwordInput.type === "password") {
        passwordInput.type = "text";
        toggleIcon.classList.remove("fa-eye-slash");
        toggleIcon.classList.add("fa-eye");
    } else {
        passwordInput.type = "password";
        toggleIcon.classList.remove("fa-eye");
        toggleIcon.classList.add("fa-eye-slash");
    }
}

</script>
 <%@ include file="footer.jsp"%>
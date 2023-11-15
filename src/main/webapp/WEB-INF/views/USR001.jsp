<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="ttm.*,java.util.*"%>
<%@ include file="header.jsp"%>
    
        <title>User Registration</title>
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
  
 <div id="testheader">
      <div class="container">
            <div class=row>        
                <div class="col-md-5 ">
            <a href="MNU001.jsp"><h3>User Registration</h3></a>
        </div>  
        <div class="col-md-6">
          
            <p>Current Date : <%
						  Date currentDate = new Date();
						  SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
						  String formattedDate = formatter.format(currentDate);
						  out.println(formattedDate);
						%></p>
        </div>  
          <div class="col-md-1" >
            <input type="button" class="btn-basic" id="lgnout-button" value="Login" onclick="location.href='/StudentRegistrationSpring/'">
        </div>   
    </div>
</div>

</div>
   
    
        
       
            <div class="main_contents">
    		<div id="sub_content">
        <form:form action="/StudentRegistrationSpring/userCreate" method="POST" modelAttribute="user"  onsubmit="return validateForm()">
       		
            <h2 class="col-md-6 offset-md-2 mb-5 mt-4"></h2>
           
            	 <h4 style="color: red" class="col-md-6 offset-md-2 mb-2 mt-2">${error }</h4>
            	 <h4 style="color: green" class="col-md-6 offset-md-2 mb-2 mt-2">${success }</h4>
          <%-- 
          	<div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="email" class="col-md-2 col-form-label">User Id</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" id="id" name="id" value="${ur.id }" required>
                </div>
            </div> --%>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="email" class="col-md-2 col-form-label">User Name</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" id="name" name="name" value="${user.name }" placeholder="Enter Name">
                	<div id="nameError" class="input-group" style="color: red;"></div>
                </div>
               
            </div>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="email" class="col-md-2 col-form-label">Email</label>
                <div class="col-md-4">
                    <input type="email" class="form-control" id="email" name="email" value="${user.email }" placeholder="Enter Email">
               <div id="emailError" class="input-group" style="color: red;"></div>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="Passowrd" class="col-md-2 col-form-label">Passowrd</label>
					<div class="col-md-4 form-group">
						<div class="input-group">
							<input type="password" class="form-control" id="password"
								name="password" value="${user.password }" placeholder="Enter Password" required> <i
								class="fa fa-eye-slash" id="togglePasswordIcon"
								onclick="togglePasswordVisibility()"></i>
						</div>
					</div>
				</div>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="confirmPassword" class="col-md-2 col-form-label">Confirm Passowrd</label>

					<div class="col-md-4 form-group">
						<div class="input-group">
							<input type="password" class="form-control" id="passwords"
								value="${user.password }" placeholder="Enter Comfirm Password" required> <i
								class="fa fa-eye-slash" id="togglePasswordIcons"
								onclick="togglePasswordVisibilitys()"></i>
						</div>
						<div id="passError" class="input-group" style="color: red;"></div>
					</div>
 				
				</div>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="userRole" class="col-md-2 col-form-label">User Role</label>
                <div class="col-md-4">
                    <select class="form-select" aria-label="Education" id="userRole" name="role">
                        <option <c:if test="${user.role=='Admin' }">selected</c:if> value="Admin">Admin</option>
                        <option <c:if test="${user.role=='User' }">selected</c:if> value="User">User</option>
    
    
                    </select>
                </div>
            </div>
            <c:if test="${success!=null }">
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="email" class="col-md-2 col-form-label">Enter Admin Code</label>
                <div class="col-md-4">
                    <input type="text" class="form-control" id="code" name="code" placeholder="Enter Admin Code" required>
                </div>
            </div>
            </c:if>
            
            <div class="row mb-4">
                <div class="col-md-4"></div>
    
                <div class="col-md-6">
                   
    
                    <button type="button" class="btn btn-secondary col-md-2" data-bs-toggle="modal" data-bs-target="#exampleModal">Add</button>
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Registration</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                   
                                   <h5 style="color: rgb(127, 209, 131);">Want to Sure Register?</h5>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-success col-md-2" data-bs-dismiss="modal" >Ok</button>
                                   
                                </div>
                            </div>
                        </div>
                </div>
     
            </div>
            
    </div>
    </form:form>
</div>
</div>
<script type="text/javascript">
function validateForm() {
	  var name = document.getElementById("name").value;
	  var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("passwords").value;
    if (name== "") {
		document.getElementById("nameError").innerHTML = "Please enter Name";
		return false;
	}
    if (email== "") {
		document.getElementById("emailError").innerHTML = "Please enter email";
		return false;
	}
    
    if (password !== confirmPassword) {
    	document.getElementById("passError").innerHTML = "Password and Confirm Password must match";
		return false;
    }

}
function togglePasswordVisibility() {
    var passwordInput = document.getElementById("password");
    var toggleIcon = document.getElementById("togglePasswordIcon");
    var password1 = document.getElementById("password").value;
    var confirmPassword = document.getElementById("passwords").value;
  

     
   
    
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
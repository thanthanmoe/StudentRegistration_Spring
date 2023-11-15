<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="header.jsp"%>
<title> Student Registration LGN001 </title>

</head>
<style>
.input-group {
  position: relative;
}

#togglePasswordIcon {
  position: absolute;
  top: 50%;
  right: 10px;
  transform: translateY(-50%);
  cursor: pointer;
}
</style>
<body class="login-page-body"> 
  
    <div class="login-page">
      <div class="form">
        <div class="login">
          <div class="login-header">
            <h1>Welcome!</h1>
            <p>Please check your data again.</p>
          </div>
        </div>
        <form:form class="login-form" action="/StudentRegistrationSpring/login" method="POST" modelAttribute="user">
          <p style="color: red">${error }</p>
          <p style="color: green;">${success }</p>
          <input type="text" placeholder="User Name" name="name" value="${user.name }"/>
          <div class="input-group">
							<input type="password" class="form-control" id="password"
								name="password" value="${user.password}" placeholder="Enter Password" required> <i
								class="fa fa-eye-slash" id="togglePasswordIcon"
								onclick="togglePasswordVisibility()"></i>
						</div>
          <button>Login</button>
          <p class="message">Not registered? <a href="/StudentRegistrationSpring/usr">Create an account</a></p>
        </form:form>
      </div>
    </div>
    <script type="text/javascript">
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
    </script>
</body>

</html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="ttm.*,ttm.daos.CourseDao,ttm.models.*,java.util.*"%>
<%@ include file="header.jsp"%>
    
        <title>Student Registration</title>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>

<%@ include file="navbar.jsp"%></br>

<%
CourseDao cdao = new CourseDao();
	List<CourseModel> srs=cdao.allCourse();
	request.setAttribute("list", srs);
%>
		<div class="main_contents">
    		<div id="sub_content">
    		   <h4 class="col-md-6 offset-md-2 mb-2 mt-2" style="color: green;">${success }</h4>
         <form:form action="/StudentRegistrationSpring/studentCreate" modelAttribute="student" method="POST" enctype="multipart/form-data" onsubmit="return validateForm()">

            <h2 class="col-md-6 offset-md-2 mb-5 mt-4">Student Registration</h2>
            <h4 class="col-md-6 offset-md-2 mb-2 mt-2" style="color: red;">${error }</h4>
            
           <%--  <div class="row mb-4">
                <div class="col-md-2"></div>
                <label  for="studentID" class="col-md-2 col-form-label">Student ID</label>
                <div class="col-md-4">
                    <input type="text" class="form-control"  name="studentId" id="studentId" value="${sr.studentId }">
                </div>
               <div id="studentIdError" class="col-md-4" style="color: red;"></div>
            </div> --%>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="name" class="col-md-2 col-form-label">Name</label>
					<div class="col-md-4">
						<input type="text" class="form-control" id="name" name="name" placeholder="Enter Name">
					</div>
					 <div id="nameError" class="col-md-4" style="color: red;"></div>
				</div>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="dob" class="col-md-2 col-form-label">DOB</label>
                <div class="col-md-4">
                    <input  type="date" class="form-control" id="date" name="registration_date" >
                </div>
                 <div id="dateError" class="col-md-4" style="color: red;"></div>
            </div>
            <fieldset class="row mb-4">
                <div class="col-md-2"></div>
                <legend class="col-form-label col-md-2 pt-0">Gender</legend>
                <div class="col-md-4">
                    <div class="form-check-inline">
                        <input  class="form-check-input" type="radio" name="gender" id="gridRadios1" value="male"
                            >
                        <label class="form-check-label" for="gridRadios1">
                            Male
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <input  class="form-check-input" type="radio" name="gender" id="gridRadios2" value="female">
                        <label class="form-check-label" for="gridRadios2">
                            Female
                        </label>
                    </div>
				</div>
				 <div id="genderError" class="col-md-4" style="color: red;"></div>
            </fieldset>
    
            <div class="row mb-4" >
                <div class="col-md-2"></div>
                <label for="phone" class="col-md-2 col-form-label">Phone</label>
                <div class="col-md-4">
                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter Phone No">
                </div>
                 <div id="phoneError" class="col-md-4" style="color: red;"></div>
            </div>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="education" class="col-md-2 col-form-label">Education</label>
                <div class="col-md-4">
                    <select class="form-select" aria-label="Education" id="education" name="education">
                        <option value="Bachelor of Information Technology">Bachelor of Information Technology</option>
                        <option  value="Diploma in IT">Diploma in IT</option>
                        <option  value="Bachelor of Computer Science">Bachelor of Computer Science</option>
    
                    </select>
                </div>
                 <div id="educationError" class="col-md-4" style="color: red;"></div>
            </div>
            <fieldset class="row mb-4">
                <div class="col-md-2"></div>
                <legend class="col-form-label col-md-2 pt-0">Attend</legend>
    
                <div class="col-md-4">
				                    
				  <c:forEach items="${list }" var="list">
				   	 <div class="form-check-inline col-md-3">
				                        <input  class="form-check-input"  type="checkbox" name="attend" id="attend" value="${list.course_name }"  multiple="multiple">
				                        <label class="form-check-label" for="gridRadios2">
				                           ${list.course_name }
				                        </label>
				                    </div>
				    </c:forEach>
                </div>
                 <div id="attendError" class="col-md-4" style="color: red;"></div>
                
    
    
    
            </fieldset>
            <div class="row mb-4">
                <div class="col-md-2"></div>
                <label for="name" class="col-md-2 col-form-label">Photo</label>
                <div class="col-md-4">
                    <input type="file" class="form-control" id="part" name="file">
                </div>
                <div id="partError" class="col-md-4" style="color: red;"></div>
            </div>
    			 
            <div class="row mb-4">
                <div class="col-md-4"></div>
    
                <div class="col-md-4">
                    <button type="reset" class="btn btn-danger ">
    
                        Reset
                    </button>
                    <button type="button" class="btn btn-secondary col-md-2" data-bs-toggle="modal" data-bs-target="#exampleModal" >
                        Add
                    </button>
                    
                   
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Student Registration</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <h5 style="color: rgb(127, 209, 131);">Sure Registered?</h5>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success col-md-2" data-bs-dismiss="modal">Ok</button>
                               
                            </div>
                        </div>
                    </div>
            </div>
           
                </div>

    
            </div>
    
            </form:form>
            
       </div>
       </div>

<script>
    function validateForm() {
      /*   var studentId = document.getElementById("studentId").value; */
        var name = document.getElementById("name").value;
        var date = document.getElementById("date").value;
        var gender = document.querySelector('input[name="gender"]:checked');
        var phone = document.getElementById("phone").value;
        var education = document.getElementById("education").value;
        var attend = document.querySelectorAll('input[name="attend"]:checked');
        var part = document.getElementById("part").value;
  
            // Validate studentId
            /* if (studentId== "") {

            	document.getElementById("studentIdError").innerHTML = "Please enter Student ID";
                return false;
            } */
            
           

	/// Validate name
		if (name== "") {
			document.getElementById("nameError").innerHTML = "Please enter Name";
			return false;
		}

		// Validate date
		if (date== "") {
			document.getElementById("dateError").innerText = "Please enter Date ";
			return false;
		}

		// Validate gender
		if (!gender) {
			document.getElementById("genderError").innerText = "Please select Gender";
			return false;
		}

		// Validate phone
		if (phone== "") {
			document.getElementById("phoneError").innerText = "Please enter Phone";
			return false;
		}else if (!isValidPhone(phone)) {
			document.getElementById("phoneError").innerHTML = "Phone No is invalid !!!";
            isValid = false;
          }

		// Validate education
		if (education== "") {
			document.getElementById("educationError").innerText = "Please select Education";
			return false;
		}
		if (part== "") {
			document.getElementById("partError").innerText = "Select photo";
			return false;
		}
		 function isValidPhone(phone){
	        	var phoneRegex=/[0]{1}[1,2,9]{1}[0-9]{9}/;
	        		return phoneRegex.test(phone);
	        }
		// Validate attend
		if (attend.length === 0) {
			document.getElementById("attendError").innerText = "Select at least one";
			return false;
		}

		document.getElementById("attendError").innerText = "";
		return true;
	}
    
    
</script>
    
<%@ include file="footer.jsp"%>
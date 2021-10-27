<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="duplicateValidation.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<!--  	<form class="needs-validation" name="registration-form" action="${pageContext.request.contextPath}/UserDetails" method="post"  novalidate>	-->

             
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="First Name *" value="" name="firstName" required/>
                                        	<div class="invalid-feedback">Please enter a valid FirstName.</div>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Middle Name " value="" name="middleName" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Last Name *" value="" name="lastName" required/>
                                            <div class="invalid-feedback">Please enter a valid LastName.</div>
                                        </div>
                                        <div class="form-group">
                                            <div class="maxl">
                                                <label class="radio inline" > 
                                                    <input type="radio" name="gender" value="male" required>
                                                    <span> Male </span> 
                                                </label>
                                                <label class="radio inline"> 
                                                    <input type="radio" name="gender" value="female">
                                                    <span>Female </span> 
                                                    <div class="invalid-feedback">Please enter a valid Gender.</div>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="date" class="form-control" placeholder="Your Date Of Birth *" value="" name="dob" required/>
                                            <div class="invalid-feedback">Please enter a valid Date Of Birth.</div>
                                        </div>
                                        <div class="form-group">
                                        
                                            <input type="email" class="form-control" placeholder="Your Email *" value="" name="email" required onchange="emailValidation()"/>
                                            <div class="invalid-feedback">Please enter a valid Email.</div>
                                        </div>
                                       
                                        		
                                        
                                        <div class="form-group">
                                            <input type="text"  name="phoneNo" class="form-control" placeholder="Your Phone *" value="" required onchange="PhoneNoValidation()"/>
                                            <div class="invalid-feedback">Please enter a valid PhoneNumber.</div>
                                        </div>
                                       
                                         <div class="form-group">
                                            <input type="text" name="address" class="form-control" placeholder="Your Address *" value="" name="address" required/>
                                            <div class="invalid-feedback">Please enter a valid Address.</div>
                                        </div>
                                        <input type="submit" class="btnRegister"  value="Register" />
                                    </div>
                                </div>
                                
          <!--              </form>	--> 

		<!-- JavaScript for disabling form submissions if there are invalid fields -->
		
    <script>
        // Self-executing function
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
	

<script src="Validation.js"></script>	
	
</body>
</html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">

<head>
<title>Login Page</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<style type="text/css">

html {
    min-height: 100%;
	}
body {
	background-color: #FA8BFF;
	background: linear-gradient(45deg, #FA8BFF 0%, #2BD2FF 52%, #2BFF88 90%);	
	}
.row{background: rgb(206,225,251);}
.container{margin-top: 7%;}
body {margin:0;}
.button1 {width: 100%;}
</style>

<!-- Reference Bootstrap cdn-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

</head>

<body >

<section class=" form">
<div class="container shadow-lg  mb-5 bg-white rounded">

	<div class="row rounded justify-content-center">

		<%-- <div class="col-lg-5 g-0">
			<img src="${pageContext.request.contextPath}/resources/images/customer-service-2.jpg" class="img-fluid rounded" alt="Responsive image" height="auto">
			
		</div> --%>
		<div class="col-lg-12 px-5 pt-1 text-center">
			<h1 class="display-5 "><img src="${pageContext.request.contextPath}/resources/images/warehouse.png"  width="50" height="50"> Warehouse Management System </h1>
			
			
			<!-- Login Form -->
			<form action="${pageContext.request.contextPath}/authenticateTheUser"
				method="POST" >
		
				<!-- Place for messages: error, alert etc ... -->
				<div class="row pt-2 justify-content-center">
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
				<img src="${pageContext.request.contextPath}/resources/images/products.png"  width="400" height="400" class="img-responsive">
				</div>
				<div class="col-12 col-sm pr-sm-0 px-5 pt-1 ">
				<h1 class="fs-5">Sign into your account</h1>
				<!-- Check for login error -->
				<c:if test="${param.error != null}">																	
						
					<div class="alert alert-danger col-xs-offset-1 col-xs-10">Invalid username and password.</div>										
				</c:if>
				<!-- Check for logout -->
				<c:if test="${param.logout != null}">
				<div class="alert alert-success col-xs-offset-1 col-xs-10">You have been logged out.</div>
				
				</c:if>
					
				<!-- User name -->
				
					<input type="text" name="username" placeholder="username" class="form-control btn1 py-2 my-2">
				
				<!-- Password -->
				
					<input type="password" name="password" placeholder="password" class="form-control btn1 py-2 my-2">
				
				<!-- I'm manually adding tokens ... Bro! -->

					<input type="hidden"
						   name="${_csrf.parameterName}"
						   value="${_csrf.token}" />
				<!-- Login/Submit Button -->
				
				<button type="submit" class="btn btn-success text-center button1  my-2"  >Login</button>
				
				
				<!-- show registration link-->
				
					<p>Not a member? <a href="${pageContext.request.contextPath}/register/showRegistrationForm">Register here</a></p>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	
</div>
</section>

	





	




	<!-- form division  -->
	




	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

</body>
</html>
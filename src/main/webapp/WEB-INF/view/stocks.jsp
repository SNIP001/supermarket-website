<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>
<style>

html { min-height: 100%;}
body {
	background-color: #FA8BFF;
	background: linear-gradient(45deg, #FA8BFF 0%, #2BD2FF 52%, #2BFF88 90%);	
}
.xyz{width: 150px;}
/* table, th, td {
  border: 3px solid black;
  border-color: red;
} */
.bor{background-color: rgb(206,225,251);}
.hh{height:40px;}
.mrg{margin-top: 1%;}
td {vertical-align:middle;}	
	
</style>
<script type="text/javascript">

</script>


<head>
	<title>List Products</title>
	<!-- Reference Bootstrap cdn-->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>

<div class="b">
	<div class="container mrg">

	<div class="row p-3 mb-2 bg-dark bg-gradient text-white rounded-pill ">
	<div class="d-flex justify-content-start">
	<div class="col-9 text-start">
			<h2><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="#C9FFE5" class="bi bi-stack" viewBox="0 0 16 16">
  <path d="m14.12 10.163 1.715.858c.22.11.22.424 0 .534L8.267 15.34a.598.598 0 0 1-.534 0L.165 11.555a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.66zM7.733.063a.598.598 0 0 1 .534 0l7.568 3.784a.3.3 0 0 1 0 .535L8.267 8.165a.598.598 0 0 1-.534 0L.165 4.382a.299.299 0 0 1 0-.535L7.733.063z"/>
  <path d="m14.12 6.576 1.715.858c.22.11.22.424 0 .534l-7.568 3.784a.598.598 0 0 1-.534 0L.165 7.968a.299.299 0 0 1 0-.534l1.716-.858 5.317 2.659c.505.252 1.1.252 1.604 0l5.317-2.659z"/>
</svg>  Warehouse Management System</h2>
	</div>
	</div>
	</div>
	<!-- <div class="row"> -->
	<div class="d-flex justify-content-end px-0">
	<!-- <div class="col-2 text-end"> -->
			<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
		<input type="submit" value="Logout" class="btn btn-primary xyz" />
	</form:form>
	</div>
	<!-- </div>
	</div> -->
			<p class="fs-4">
				User: <security:authentication property="principal.username" />
					 <security:authorize access="hasAnyRole('MANAGER')">
					 , Role: Stock Manager  <img src="${pageContext.request.contextPath}/resources/images/shop.svg"  width="20" height="20">
					 </security:authorize>
					 <security:authorize access="hasAnyRole('ADMIN')">
					 , Role: Warehouse Manager <img src="${pageContext.request.contextPath}/resources/images/man.svg"  width="20" height="20">
					 </security:authorize>
			</p>
			<div class="py-3">
			<security:authorize access="hasAnyRole('ADMIN')">
			<!-- put new button: Add Customer -->
				<input type="button" value="Add Products" onclick="window.location.href='showFormForAdd'; return false;" class="btn btn-success xyz"/>
			</security:authorize>
			
		<div class="d-flex justify-content-end px-0">
			<input class="form-control  my-3" id="myInput" type="text" placeholder="Search.." style="width: 150px">
			</div>
			<div class="table-responsive">
			<!--  add our html table here -->
			<table class="table table-hover table-bordered border-dark text-center py-1 bor ">
				<thead>
					<tr>
						<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
						<th>Shop No</th>
						</security:authorize>
						<th>Product Name</th>
						<th>Product Image</th>
						<th>Stock</th>
						<th>Price</th>
			<%-- Only show "Action" column for managers or admin --%>
						<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
							<th>Action</th>
						</security:authorize>
					</tr>
				</thead>
			<!-- loop over and print our customers -->
				<c:forEach var="tempProducts" items="${products}">
			<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/product/showFormForUpdate">
						<c:param name="customerId" value="${tempProducts.id}" />
					</c:url>					
			<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/product/delete">
						<c:param name="customerId" value="${tempProducts.id}" />
					</c:url>
				<tbody id="myTable">						
					<tr style="height:150px">
						<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
						<td class="td"> ${tempProducts.shopId} </td>
						</security:authorize>
						<td><p class="h4 font-weight-bold">${tempProducts.name}</p></td>
						
						<td style="width:150px"><c:choose>
						  <c:when test="${tempProducts.name == 'Rice'}">
						   <img src="${pageContext.request.contextPath}/resources/images/rice.jpg"  width="100" height="100">
						  </c:when>
						  <c:when test="${tempProducts.name == 'Wheat'}">
						    <img src="${pageContext.request.contextPath}/resources/images/Wheat.jpg"  width="100" height="100">
						  </c:when>
						  <c:when test="${tempProducts.name == 'Oil'}">
						    NA
						  </c:when>
						  <c:when test="${tempProducts.name == 'Sugar'}">
						  <img src="${pageContext.request.contextPath}/resources/images/SUGAR.jpg"  width="100" height="100">
						  </c:when>
						  <c:otherwise>
						   NA
						  </c:otherwise>
						</c:choose></td>
						
						
						<td> ${tempProducts.stock} kg </td>
						<td>Rs.${tempProducts.price} </td>
						<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
							<td>
								<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
			<!-- display the update link -->
			
									<a class="text-light btn btn-success font-weight-bold hh" href="${updateLink}">Update</a>
								</security:authorize>
								<security:authorize access="hasAnyRole('ADMIN')">
									 | <a class="text-light btn btn-danger font-weight-bold hh" href="${deleteLink}"
									   onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
								</security:authorize>
							</td>
						</security:authorize>
					</tr>
					 </tbody>
				</c:forEach>
			</table>
			
			</div>
		</div>
	</div>
	
<!-- </div>
</div> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
</body>

</html>










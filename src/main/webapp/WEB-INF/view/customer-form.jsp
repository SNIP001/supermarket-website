<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>

<head>
	<title>Save Customer</title>

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css">

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/add-customer-style.css">
		  
</head>

<body>


<br>
<br>
	
	<div id="wrapper">
		<div id="header">
			<h2>Warehouse Management System</h2>
		</div>
	</div>

	<div id="container">
		<h3>Save Products</h3>
						
		<form:form action="saveCustomer" modelAttribute="customer" method="POST">

			<!-- need to associate this data with customer id -->
			<form:hidden path="id" />
					
			<table>
				<tbody>
					<tr>
						<td><label>Shop Id:</label></td>
						<td><form:input path="shopId" /></td>
					</tr>
				
					<tr>
						<td><label>Product Name:</label></td>
						<td><form:input path="name" /></td>
					</tr>

					<tr>
						
						<td><label>Stock - kg:</label></td>
						<td><form:input id="txtresult" path="stock" /></td>
						
					</tr>
					
					<tr>
						<td><label>Price:</label></td>
						<td><form:input  path="price" /></td>
					</tr>
					
					<tr>
						<td><label>Stock-in:</label></td>
						<td><form:input id="Text1" path="stockin" /></td>
					</tr>
					
					<tr>
						<td><label>Stock-out:</label></td>
						<td><form:input id="Text2" path="stockout" /></td>
					</tr>


					<tr>
						<td><label></label></td>
						<td><input type="submit" onclick="add_number()" value="Save" class="save" /></td>
					</tr>

				
				</tbody>
			</table>
		
		
		</form:form>
	
		<div style="clear; both;"></div>
		
		<p>
			<a href="${pageContext.request.contextPath}/product/list">Back to List</a>
		</p>
	
	</div>
<script type="text/javascript">
var text1 = document.getElementById("Text1");
var text2 = document.getElementById("Text2");
var text3 = document.getElementById("txtresult");

function add_number() {
   var first_number = parseFloat(text1.value);
   if (isNaN(first_number)) first_number = 0;
   var second_number = parseFloat(text2.value);
   if (isNaN(second_number)) second_number = 0;
   var third_number = parseFloat(text3.value);
   if (isNaN(third_number)) third_number = 0;
   var result =  first_number - second_number + third_number;
   document.getElementById("txtresult").value = result;
}
</script>
</body>

</html>











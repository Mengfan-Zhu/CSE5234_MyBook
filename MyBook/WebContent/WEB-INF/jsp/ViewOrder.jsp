<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Order</title>
<style>
td{
  border: 1px solid black;
  border-collapse: collapse;
  padding: 0 10px;
}
table{
 	border-collapse: collapse;
}
.hidden{
 	border: 0;
}
input{
	margin: 5px 0;
}
</style>
</head>
<body>
	<h3>Order List</h3>
	<table>
			<c:forEach items="${sessionScope.order.items}" var="item" varStatus="loop">
				<c:if test="${item.quantity.length()>0}">
				<tr>
				<td><c:out value="${item.name}"></c:out></td>
				<td><c:out value="${item.price}"></c:out></td>
				<td><c:out value="${item.quantity}"></c:out></td>
				</tr>
				</c:if>				
			</c:forEach>
	</table>
	<h3>Payment Information</h3>
	<table>
		<tr>
    		<td>Credit Card Number: </td>
    		<td><c:out value="${sessionScope.payment.creditCardNumber}" /></td>
    	</tr>
    	<tr>
    		<td>Expiration Date: </td>
    		<td><c:out value="${sessionScope.payment.expirationDate}" /></td>
    	</tr>
    	<tr>
    		<td>CVV code: </td>
    		<td><c:out value="${sessionScope.payment.cvvCode}" /></td>
    	</tr>
    	<tr>
    		<td>Card Holder Name: </td>
    		<td><c:out value="${sessionScope.payment.cardHolderName}" /></td>
    	</tr>
	</table>
	<h3>Shipping Details</h3>
	<table>
			<tr>
				<td><c:out value="Name: "></c:out></td>
				<td><c:out value="${sessionScope.shipping.name}"></c:out></td>
			</tr>
			<tr>
				<td><c:out value="Address Line1: "></c:out></td>
				<td><c:out value="${sessionScope.shipping.addressLine1}"></c:out></td>
			</tr>
			<tr>
				<td><c:out value="Address Line2: "></c:out></td>
				<td><c:out value="${sessionScope.shipping.addressLine2}"></c:out></td>
			</tr>
			<tr>
				<td><c:out value="City: "></c:out></td> 
				<td><c:out value="${sessionScope.shipping.city}"></c:out></td>
			</tr>
			<tr>
				<td><c:out value="State: "></c:out></td>
			 	<td><c:out value="${sessionScope.shipping.state}"></c:out></td>
			</tr>
			<tr>
				<td><c:out value="Zip: "></c:out></td>
			 	<td><c:out value = "${sessionScope.shipping.zip}"></c:out></td>
			</tr>
	</table>
	<form:form method="post" action="confirmOrder">	
		<input type="submit" value="Confirm">
	</form:form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Entry Form</title>
<style>
td{
  border: 1px solid black;
  border-collapse: collapse;
}
table{
 	border-collapse: collapse;
}
.hidden{
 	border: 0;
}
</style>
</head>
<body>
<form:form modelAttribute="payment" method="post" action="submitPayment">
    <table>
    <thead>
    	<tr>
    		<td>Credit Card Number: </td>
    		<td><form:input path="creditCardNumber" /></td>
    	</tr>
    	<tr>
    		<td>Expiration Date: </td>
    		<td><form:input path="expirationDate" /></td>
    	</tr>
    	<tr>
    		<td>CVV code: </td>
    		<td><form:input path="cvvCode" /></td>
    	</tr>
    	<tr>
    		<td>Card Holder Name: </td>
    		<td><form:input path="cardHolderName" /></td>
    	</tr>
    </thead>
    </table>
    <tr>
		<td colspan="2"  class = "hidden"><input type="submit" value="Pay"></td>
	 </tr>
</form:form>
</body>
</html>
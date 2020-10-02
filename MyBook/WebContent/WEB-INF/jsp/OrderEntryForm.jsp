<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Entry Form</title>
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
<form:form modelAttribute="order" method="post" action="purchase/submitItems">
    <table>
    <thead>
    	<tr>
    		<td>Name</td>
    		<td>Price</td>
    		<td>Quantity</td>
    	</tr>
    </thead>
	<c:forEach items="${order.items}" var="item" varStatus="loop">
		<tr>
			<td><c:out value="${item.name}"></c:out></td>
			<td><c:out value="$${item.price}" ></c:out></td>
			<td><form:input path="items[${loop.index}].quantity" /></td>
			<td class = "hidden"><form:hidden path="items[${loop.index}].name" value="${item.name}"/></td>
			<td class = "hidden"><form:hidden path="items[${loop.index}].price" value="${item.price}"/></td>
		</tr>
	</c:forEach>
	  <tr>
		<td colspan="2"  class = "hidden"><input type="submit" value="Purchase"></td>
	  </tr>
    </table>
</form:form>

</body>
</html>
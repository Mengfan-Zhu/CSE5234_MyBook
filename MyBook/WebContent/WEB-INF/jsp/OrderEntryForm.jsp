<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>
<form:form modelAttribute="order" method="post" action="purchase/submitItems">
    <table class = "inputs">
   	<tr>
   		<th>Name</th>
   		<th>Price</th>
   		<th>Quantity</th>
   	</tr>
	<c:forEach items="${order.items}" var="item" varStatus="loop">
		<tr>
			<td><c:out value="${item.name}"></c:out></td>
			<td><c:out value="$${item.price}" ></c:out></td>
			<td><form:input path="items[${loop.index}].quantity" /></td>
			<td class = "hidden"><form:hidden path="items[${loop.index}].name" value="${item.name}"/></td>
			<td class = "hidden"><form:hidden path="items[${loop.index}].price" value="${item.price}"/></td>
		</tr>
	</c:forEach>
    </table>
	<input type="submit" value="Purchase">
</form:form>
<jsp:include page="footer.jsp"/>
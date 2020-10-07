<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>
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
<jsp:include page="footer.jsp"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>
<div class = 'confirm'>
<h3>Thanks for completing your order!</h3>
<h3>Your confirm code is: ${sessionScope.confirmNum}</h3>
</div>
<h3>Order List</h3>
	<table>
   	<tr>
   		<th>Name</th>
   		<th>Price</th>
   		<th>Quantity</th>
   	</tr>
			<c:forEach items="${sessionScope.order.lineItems}" var="item" varStatus="loop">
				<c:if test="${item.quantity>0}">
				<tr>
				<td><c:out value="${item.itemName}"></c:out></td>
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
<jsp:include page="footer.jsp"/>
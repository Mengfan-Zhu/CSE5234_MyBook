
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>
<form:form modelAttribute="payment" method="post" action="submitPayment">
    <table>
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
    </table>
    <tr>
		<td colspan="2"  class = "hidden"><input type="submit" value="Pay"></td>
	 </tr>
</form:form>
<jsp:include page="footer.jsp"/>
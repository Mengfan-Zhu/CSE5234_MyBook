<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>
<form:form modelAttribute="shipping" method="post" action="submitShipping">
    <table>
    	<tr>
    		<td>Name: </td>
    		<td><form:input path="name" /></td>
    	</tr>
    	<tr>
    		<td>Address Line 1: </td>
    		<td><form:input path="addressLine1" /></td>
    	</tr>
    	<tr>
    		<td>Address Line 2: </td>
    		<td><form:input path="addressLine2" /></td>
    	</tr>
    	<tr>
    		<td>City: </td>
    		<td><form:input path="city" /></td>
    	</tr>
    	<tr>
    		<td>State: </td>
    		<td><form:input path="state" /></td>
    	</tr>
    	<tr>
    		<td>Zip: </td>
    		<td><form:input path="zip" /></td>
    	</tr>
    </table>
    <tr>
		<td colspan="2"  class = "hidden"><input type="submit" value="Confirm"></td>
	 </tr>
</form:form>
<jsp:include page="footer.jsp"/>
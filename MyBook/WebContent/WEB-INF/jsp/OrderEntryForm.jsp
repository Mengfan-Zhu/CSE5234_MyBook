<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>

<form:form modelAttribute="order" method="post" action="purchase/submitItems" onsubmit="return validateForm()">
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
			<td><form:input path="items[${loop.index}].quantity"/></td>
			<td class = "hidden"><form:hidden path="items[${loop.index}].name" value="${item.name}"/></td>
			<td class = "hidden"><form:hidden path="items[${loop.index}].price" value="${item.price}"/></td>
		</tr>
	</c:forEach>
    </table>
	<input type="submit" value="Purchase">
</form:form>
<script>
function validateForm()
{
	var list = document.getElementsByTagName("input");
	var nonzero = false;
	for(var i=0;i<list.length;i++)
    {
           if(list[i].type=="text")  
           {
           	var quantity = list[i].value;
               if(quantity.length!=0 && !/^((0)|([1-9][0-9]{0,2}))$/.test(quantity)){
             		alert("Please input valid quantity");
           	    	return false;
               }else{
	               	if(/^[1-9][0-9]{0,2}$/.test(quantity)){
	               		nonzero = true;
	               	}
               }
           }
    } 
	if(!nonzero){
		alert("You don't order any book!");
	    return false;
	}
}
</script>
<jsp:include page="footer.jsp"/>
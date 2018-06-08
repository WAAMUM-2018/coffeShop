<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Order</title>
</head>
<body>
	<form:form modelAttribute="orderline" action="createOrder"
		method="post">
		<table>
			<form:input type="number" path="id" hidden="true"/>
			<form:input type="number" path="order.id" hidden="true"/>
			<tr>
				<td>Product:</td>
				<td><form:select path="product.id">
						<c:forEach items="${products}" var="product">
							<option value="${product.id}">${product.productName}</option>
						</c:forEach>
					</form:select></td>
			</tr>
			<tr>
				<td>Quantity:</td>
				<td><form:input type="number" path="quantity" /></td>
			</tr>
		</table>
		<input type="submit" />
	</form:form>
</body>
</html>
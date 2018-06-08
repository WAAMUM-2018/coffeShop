<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Book</title>
</head>
<body>
	<form:form modelAttribute="product" action="createOrEdit" method="post" >
		<table>
			<tr>
				<td>Product Name:</td>
				<td><form:input type="text" path="productName" /></td>
			</tr>
			<tr>
				<td>Description: </td>
				<td><form:input type="text" path="description" /></td>
			</tr>
			<tr>
				<td>Price:</td>
				<td><form:input type="text" path="price" /></td>
			</tr>
			<tr>
				<td>Product Type:</td>
				<td><form:select path="productType" items="${productTypes}"/></td>
			</tr>
		</table>
		<input type="submit" />
	</form:form>
</body>
</html>
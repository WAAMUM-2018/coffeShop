<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a New Person</title>
</head>
<body>
	<form:form modelAttribute="person" action="create" method="post">
		<table>

			<form:input type="number" path="id" hidden="true" />
			<tr>
				<td>First Name:</td>
				<td><form:input type="text" path="firstName" /></td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><form:input type="text" path="lastName" /></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><form:input type="email" path="email" /></td>
			</tr>
			<tr><td>Address:</td></tr>
			<tr>
				<td>City:</td>
				<td><form:input type="text" path="address.city" /></td>
				<td>State:</td>
				<td><form:input type="text" path="address.state" /></td>
				<td>Country:</td>
				<td><form:input type="text" path="address.country" /></td>
				<td>Zipcode:</td>
				<td><form:input type="text" path="address.zipcode" /></td>
			</tr>
			<tr>
				<td>Phone:</td>
				<td><form:input type="text" path="phone" /></td>
			</tr>
		</table>
		<input type="submit" />
	</form:form>
</body>
</html>
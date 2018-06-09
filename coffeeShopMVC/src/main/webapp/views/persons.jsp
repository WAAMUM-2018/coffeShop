<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Persons List</title>
</head>
<body>
	<h1>Persons</h1>
	<table>
	<c:forEach var="person" items="${persons}">
	<tr>
		<td>${person.firstName}</td>
		<td>${person.lastName}</td>
		<td>${person.email}</td>
		<td>${person.phone}</td>
		<td><a href="<spring:url value= "/person/edit?personId=${person.id}"/>">edit</a></td>
	</tr>
	</c:forEach>
	</table>
	
	<a href="<spring:url value="/person/create" />"
							class="btn btn-default pull-right">Add Person</a>
</body>
</html>
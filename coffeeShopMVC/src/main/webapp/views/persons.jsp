<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Persons List</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<%@include file="authheader.jsp"%>
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">Our Products</span>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Phone</th>
					</tr>
				</thead>
				<c:forEach var="person" items="${persons}">
					<tr>
						<td>${person.firstName}</td>
						<td>${person.lastName}</td>
						<td>${person.email}</td>
						<td>${person.phone}</td>
						<td><a
							href="<spring:url value= "/person/edit?personId=${person.id}"/>"
							class="btn btn-success custom-width">edit</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<a href="<spring:url value="/person/create" />"
		class="btn btn-primary btn-smt">Add Person</a>
		
	</div>
	</body>
</html>
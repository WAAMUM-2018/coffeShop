<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Products List</title>
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
						<th>Product Name</th>
						<th>Description</th>
						<th>Price/$</th>
						<th>Product Type</th>
					</tr>
				</thead>
				<c:forEach var="product" items="${products}">
					<tr>
						<td>${product.productName}</td>
						<td>${product.description}</td>
						<td>${product.price}</td>
						<td>${product.productType}</td>
						<sec:authorize access="hasAuthority('ADMIN')">
							<td><a
								href="<spring:url value= "/product/edit/${product.id}"/>"
								class="btn btn-success custom-width">Edit</a></td>
							<td><a
								href="<spring:url value= "/product/remove/${product.id}"/>"
								class="btn btn-danger custom-width">Delete</a></td>
						</sec:authorize>
					</tr>
				</c:forEach>
			</table>
		</div>
		<sec:authorize access="hasAuthority('ADMIN')">
				<a href="<spring:url value="/product/create" />"
					class="btn btn-primary btn-smt">Add Product</a>
			</sec:authorize>
		
	</div>
</body>
</html>
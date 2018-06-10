<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order Details</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
</head>
<body>
	<div class="generic-container">
		<%@include file="authheader.jsp"%>
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">Order - Order Id: ${order.id }   Order Date:
					${order.orderDate }</span>
			</div>
			<table class="table table-hover">
			<thead>
                    <tr>
                        <th>Order Line Id</th>
                        <th>Product Name</th>
                        <th>Description</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
				<c:forEach var="orderline" items="${order.orderLines}">
					<tr>
						<td>${orderline.id}</td>
						<td>${orderLines.product.productName}</td>
						<td>${orderLines.product.description}</td>
						<td>${orderLines.product.price}</td>
						<td>${orderline.quantity}</td>
						<td><a
							href="<spring:url value= "/orderline/edit/${product.id}"/>" class="btn btn-success custom-width">edit</a></td>
						<td><a
							href="<spring:url value= "/orderline/remove/${product.id}"/>" class="btn btn-danger custom-width">delete</a></td>
					</tr>
				</c:forEach>
			</table>

			<a
				href="<spring:url value="/orderline/create?orderId=${order.id}" />"
				class="btn btn-primary btn-smt">Add Order Line</a>
		</div>
	</div>
</body>
</html>
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
</head>
<body>
	<h1>Order</h1>
	<p>Order Id: ${order.id }</p>
	<p>Order Date: ${order.orderDate }</p>
	<table>
		<c:forEach var="orderline" items="${order.orderLines}">
			<tr>
				<td>${orderline.id}</td>
				<td>${orderLines.product.productName}</td>
				<td>${orderline.quantity}</td>
				<td><a
					href="<spring:url value= "/orderline/edit/${product.id}"/>">edit</a></td>
				<td><a
					href="<spring:url value= "/orderline/remove/${product.id}"/>">delete</a></td>
			</tr>
		</c:forEach>
	</table>

	<a href="<spring:url value="/orderline/create?orderId=${order.id}" />"
		class="btn btn-default pull-right">Add Order Line</a>
</body>
</html>
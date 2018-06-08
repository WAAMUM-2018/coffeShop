<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Orders List</title>
</head>
<body>
	<h1>Orders</h1>
	<table>
	<c:forEach var="order" items="${orders}">
	<tr>
		<td>${order.id}</td>
		<td>${order.orderDate}</td>
		<td><a href="<spring:url value= "/order/orderdetails?orderId=${order.id}"/>">View Details</a></td>
	</tr>
	</c:forEach>
	</table>
	
	<a href="<spring:url value="/orderline/create?orderId=-1" />"
							class="btn btn-default pull-right">Create Order</a>
</body>
</html>
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
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<%@include file="authheader.jsp"%>
		<form:form modelAttribute="orderline" action="createOrder"
			method="post" class="form-horizontal">
			<div class="row">
				<form:input type="number" path="id" hidden="true" />
				<form:input type="number" path="order.id" hidden="true" />
				<div class="row">
					<div class="form-group col-md-12 col-lg-12">
						<label class="col-md-3  col-lg-3 control-lable" for="product">Product</label>
						<div class="col-md-7 col-lg-7">
							<form:select path="product.id" class="form-control input-sm">
								<c:forEach items="${products}" var="product">
									<option value="${product.id}">${product.productName}</option>
								</c:forEach>
							</form:select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12 col-lg-12">
						<label class="col-md-3  col-lg-3 control-lable" for="firstName">Quantity</label>
						<div class="col-md-7 col-lg-7">
							<form:input type="number" path="quantity"
								class="form-control input-sm" />
						</div>
					</div>
				</div>

				<input type="submit" class="btn btn-primary btn-sm" value="Create Order"/>
			</div>

		</form:form>
	</div>
</body>
</html>
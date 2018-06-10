<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product</title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
</head>
<body>

	<div class="container">
		<%@include file="authheader.jsp"%>
		<form:form modelAttribute="product" action="createOrEdit"
			method="post" class="form-horizontal">
			<form:input type="number" path="id" hidden="true" />
			<div class="row">
				<div class="row">
					<div class="form-group col-md-12 col-lg-12">
						<label class="col-md-3  col-lg-3 control-lable" for="productName">Product
							Name</label>
						<div class="col-md-7 col-lg-7">
							<form:input type="text" path="productName"
								class="form-control input-sm" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12 col-lg-12">
						<label class="col-md-3  col-lg-3 control-lable" for="description">Description</label>
						<div class="col-md-7 col-lg-7">
							<form:input type="text" path="description"
								class="form-control input-sm" />
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12 col-lg-12">
						<label class="col-md-3  col-lg-3 control-lable" for="price">Price</label>
						<div class="col-md-7 col-lg-7">
							<form:input type="number" path="price"
								class="form-control input-sm" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12 col-lg-12">
						<label class="col-md-3  col-lg-3 control-lable" for="productType">Product
							Type</label>
						<div class="col-md-7 col-lg-7">
							<form:select path="productType" items="${productTypes}"
								class="form-control input-sm" />
						</div>
					</div>
				</div>
				<input type="submit" class="btn btn-primary btn-sm" value = "Create"/>
			</div>
		</form:form>
	</div>
</body>
</html>
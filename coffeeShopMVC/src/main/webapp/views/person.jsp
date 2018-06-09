<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<c:choose>
	<c:when test="${edit}">
		<title>Personal Information</title>
	</c:when>
	<c:otherwise>
		<title>User Registration Form</title>
	</c:otherwise>
</c:choose>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
</head>

<body>
	<div class="container">
		<%@include file="authheader.jsp"%>

		<c:choose>
			<c:when test="${edit}">
				<div class="well lead">Personal Information</div>
			</c:when>
			<c:otherwise>
				<div class="well lead">User Registration Form</div>
			</c:otherwise>
		</c:choose>
		<form:form method="POST" modelAttribute="person" action="create"
			class="form-horizontal">
			<form:input type="hidden" path="id" id="id" />
			<div class="row">
				<div class="row">
					<div class="form-group col-md-12 col-lg-12">
						<label class="col-md-3  col-lg-3 control-lable" for="firstName">First
							Name</label>
						<div class="col-md-7 col-lg-7">
							<form:input type="text" path="firstName" id="firstName"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="firstName" class="help-inline" />
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="form-group col-md-12 col-lg-12">
						<label class="col-md-3 col-lg-3 control-lable" for="lastName">Last
							Name</label>
						<div class="col-md-7 col-lg-7">
							<form:input type="text" path="lastName" id="lastName"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="lastName" class="help-inline" />
							</div>
						</div>
					</div>
				</div>
				<c:choose>
					<c:when test="${not edit }">
					<div class= "row">
						<div class="form-group col-md-12 col-lg-12">
							<label class="col-md-3 col-lg-3 control-lable" for="userName">User Name</label>
							<div class="col-md-7 col-lg-7">
								<form:input type="text" path="user.username" id="userName"
									class="form-control input-sm" />
								<div class="has-error">
									<form:errors path="user.username" class="help-inline" />
								</div>
							</div>
						</div>
						</div>
						<div class="row">
							<div class="form-group col-md-12 col-lg-12">
								<label class="col-md-3 col-lg-3 control-lable" for="password">Password</label>
								<div class="col-md-7 col-lg-7">
									<form:input type="password" path="user.password" id="password"
										class="form-control input-sm" />
									<div class="has-error">
										<form:errors path="user.password" class="help-inline" />
									</div>
								</div>
							</div>
						</div>
					</c:when>
				</c:choose>
				<div class="row">
					<div class="form-group col-md-12 col-lg-12">
						<label class="col-md-3 col-lg-3 control-lable" for="email">Email</label>
						<div class="col-md-7 col-lg-7">
							<form:input type="text" path="email" id="email"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="email" class="help-inline" />
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12 col-lg-12">
						<label class="col-md-3 col-lg-3 control-lable" for="phone">Address</label>
						<div class="col-md-7 col-lg-7">
							<form:input type="text" path="address.city" id="city"
								class="form-control input-sm" placeholder="City" />
							<form:input type="text" path="address.state" id="state"
								class="form-control input-sm" placeholder="State" />
							<form:input type="text" path="address.country" id="country"
								class="form-control input-sm" placeholder="Country" />
							<form:input type="text" path="address.zipcode" id="zipcode"
								class="form-control input-sm" placeholder="ZipCode" />
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-group col-md-12 col-lg-12">
						<label class="col-md-3 col-lg-3 control-lable" for="phone">Phone
							Number</label>
						<div class="col-md-7 col-lg-7">
							<form:input type="text" path="phone" id="phone"
								class="form-control input-sm" />
							<div class="has-error">
								<form:errors path="phone" class="help-inline" />
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="form-actions float-right">
						<c:choose>
							<c:when test="${edit}">
								<input type="submit" value="Update"
									class="btn btn-primary btn-sm" /> or <a
									href="<c:url value='/list' />">Cancel</a>
							</c:when>
							<c:otherwise>
								<input type="submit" value="Register"
									class="btn btn-primary btn-sm" /> or <a
									href="<c:url value='/list' />">Cancel</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>
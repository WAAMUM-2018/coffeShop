<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml11.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<c:choose>
				<c:when test="${edit}">
					<div class="panel-heading">
						<span class="lead">Personal Information</span>
					</div>
				</c:when>
				<c:otherwise>
					<div class="panel-heading">
						<span class="lead">User Registration Form</span>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="panel-body">
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
								<div class="row">
									<div class="form-group col-md-12 col-lg-12">
										<label class="col-md-3 col-lg-3 control-lable" for="userName">User
											Name</label>
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
											<form:input type="password" path="user.password"
												id="password" class="form-control input-sm" />
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
								<label class="col-md-3 col-lg-3 control-lable" for="email">Address</label>
								<div class="col-md-7 col-lg-7">
									<form:input type="text" path="address.city" id="city"
										class="form-control input-sm" placeholder="City" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-12 col-lg-12">
								<label class="col-md-3 col-lg-3 control-lable" for="email"></label>
								<div class="col-md-7 col-lg-7">
									<form:input type="text" path="address.state" id="state"
										class="form-control input-sm" placeholder="State" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-12 col-lg-12">
								<label class="col-md-3 col-lg-3 control-lable" for="country"></label>
								<div class="col-md-7 col-lg-7">
									<form:input type="text" path="address.country" id="country"
										class="form-control input-sm" placeholder="Country" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group col-md-12 col-lg-12">
								<label class="col-md-3 col-lg-3 control-lable" for="zipcode"></label>
								<div class="col-md-7 col-lg-7">
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
							<c:choose>
								<c:when test="${edit}">
									<input type="submit" value="Update"
										class="btn btn-primary btn-sm" />
								</c:when>
								<c:otherwise>
									<input type="submit" value="Register"
										class="btn btn-primary btn-sm" />
								</c:otherwise>
							</c:choose>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>
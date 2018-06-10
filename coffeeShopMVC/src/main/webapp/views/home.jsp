<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
	<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Welcome Jeewan's Coffee Shop!</h1>
			</div>

			<div class="container">
				<c:choose>
					<c:when test="${pageContext.request.userPrincipal == null}">
						<a href="<spring:url value='/login' />"
							class="btn btn-default pull-right"> Login</a>
						<a href="<spring:url value='/person/create' />"
							class="btn btn-default pull-right"> Register</a>
					</c:when>
					<c:otherwise>
						<a href="<spring:url value='/logout' />"
							class="btn btn-default pull-right"> Logout</a>
						<sec:authorize
							access="hasAuthority('ADMIN') or hasAuthority('USER')">
							<a href="<spring:url value="/orderline/create?orderId=-1" />"
								class="btn btn-default pull-right">Place an Order</a>
						</sec:authorize>
						<sec:authorize access="hasAuthority('ADMIN')">
							<a href="<spring:url value="/person/list" />"
								class="btn btn-default pull-right">Persons</a>
							<a href="<spring:url value="/order/list" />"
								class="btn btn-default pull-right">Orders List</a>
						</sec:authorize>
						<sec:authorize access="hasAuthority('USER')">
							<a href="<spring:url value="/person/edit?personId=-1" />"
								class="btn btn-default pull-right">My profile</a>
						</sec:authorize>
					</c:otherwise>
				</c:choose>
				<a href="<spring:url value="/product/list" />"
					class="btn btn-default pull-right">See Products</a>
			</div>
		</div>
		<img
			src="https://images.unsplash.com/photo-1449198063792-7d754d6f3c80?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=eb09a1b793f7cb1dca37311f2af4d91d&w=1000&q=80"
			alt="Coffee shop"
			style="width: 1250px; height: 340px; margin-top: -20px; margin-left: 20px" />
	</section>

</body>
</html>

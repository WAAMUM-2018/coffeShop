<div class="container">
<c:choose>
	<c:when test="${pageContext.request.userPrincipal != null}">
    <a href="<c:url value="/logout" />" class="navbar-brand pull-right">Logout</a>
</c:when>
</c:choose>
<a href="<spring:url value="/" />"
								class="navbar-brand pull-right">Home</a>

</div>
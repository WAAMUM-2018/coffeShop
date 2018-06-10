<div class="authbar">
<c:choose>
	<c:when test="${pageContext.request.userPrincipal != null}">
    <span>Dear <strong>${loggedinuser}</strong>, Welcome to CrazyUsers.</span> <span class="float-right"><a href="<c:url value="/logout" />">Logout</a></span>
</c:when>
</c:choose>
</div>
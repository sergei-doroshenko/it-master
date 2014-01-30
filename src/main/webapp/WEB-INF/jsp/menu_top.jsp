<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- i18n -->
<fmt:requestEncoding value="UTF-8" />
<c:choose>
	<c:when test="${!empty param.lang}">
		<c:set var="language" value="${param.lang}" scope="session"/>
		<fmt:setLocale value="${param.lang}"/>
	</c:when>
	<c:otherwise>
		<c:if test="${!empty sessionScope.language}">
			<fmt:setLocale value="${sessionScope.language}"/>
		</c:if>
	</c:otherwise>
</c:choose>
		
<fmt:setBundle basename="i18n.main" var="lang"/>
<!-- End of i18n --> 

<ul class="menu-obj">
	<li class="menu-obj-item"><a href="${constants.URL_MAIN}"><fmt:message key="main" bundle="${lang}"/></a></li>
	<c:choose>
		<c:when test="${(user.role.name eq constants.ROLE_USER) or (user.role.name eq constants.ROLE_ADMIN)}">
			<li class="menu-obj-item"><a href="${constants.URL_DETAILS}"><fmt:message key="submitissue" bundle="${lang}"/></a></li>
			<c:if test="${user.role.name eq constants.ROLE_ADMIN}">
				<li class="menu-obj-item"><a href="${constants.URL_DETAILS}"><fmt:message key="admin.users" bundle="${lang}"/></a></li>
				<li class="menu-obj-item"><a href="${constants.URL_DETAILS}"><fmt:message key="admin.roles" bundle="${lang}"/></a></li>
				<li class="menu-obj-item"><a href="${constants.URL_DETAILS}"><fmt:message key="admin.projects" bundle="${lang}"/></a></li>
				<li class="menu-obj-item"><a href="${constants.URL_DETAILS}"><fmt:message key="admin.statuses" bundle="${lang}"/></a></li>
				<li class="menu-obj-item"><a href="${constants.URL_DETAILS}"><fmt:message key="admin.resolutions" bundle="${lang}"/></a></li>
				<li class="menu-obj-item"><a href="${constants.URL_DETAILS}"><fmt:message key="admin.priorities" bundle="${lang}"/></a></li>
				<li class="menu-obj-item"><a href="${constants.URL_DETAILS}"><fmt:message key="admin.types" bundle="${lang}"/></a></li>
			</c:if>
		</c:when>
	</c:choose>
	<li class="menu-obj-item"><a href="${constants.URL_SEARCH}"><fmt:message key="search" bundle="${lang}"/></a></li>
</ul>
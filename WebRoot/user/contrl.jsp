<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
	String name = (String) session.getAttribute("${users.userName}");
	if (null == name) {
		response.sendRedirect("loginusers.jsp");
	}
%>
 --%>
<c:if test="${empty users.userName}">
	<%
		response.sendRedirect("loginusers.jsp");
	%>


</c:if>
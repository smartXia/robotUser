<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  		String name = (String)session.getAttribute("users.userName");
  		if(null==name){
  			response.sendRedirect("loginusers.jsp");
  		}
 %>


<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'selectNews.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<style type="text/css">
#error {
	position: absolute;
	left: 20%;
	top: 25%;

}

.p1 {
	width: 300px;
	height: 50px;
	line-height: 25px;
	overflow: hidden
}
</style>
</head>

<script type="text/javascript">
	$(document).ready(
			function() {
				var key_name = $("#anyword").val();
				console.log(key_name);
				/* var key_name = "灯"; */
				if (key_name != "") {
					var newRegExp = new RegExp(key_name, 'gm');
					$(".productText").each(
							function() {
								var html1 = $(this).html();
								html1 = html1.replace(newRegExp,
										'<span style="color:red">' + key_name
												+ '</span>');
								$(this).html(html1);
							});
				}
			});
</script>


<body>
	<br>
	<br>
	<div class="container">
		<h3>
			搜索结果：<font color="#009a61" size="5">${anyword}</font>
		</h3>
		<input type="hidden" value="${anyword}" id="anyword">
	<font color="#999" size="2">机器人之家为您找到相关结果约${selectList.size()}个</font>
		<div class="productText">
			<c:if test="${ not empty selectList}">
				<c:forEach items="${selectList}" var="selectList" varStatus="ss">

				
					<h3>
						<a
							href="news/showNewsduixiang.action?newsId=${selectList.newsId}+
									&newsRead=${selectList.newsRead}"
							class="title">${selectList.newsTitle}</a>
					</h3>
					<div class="p1">
						<font color="#000" size="3">${selectList.newsContext}</font>
					</div>

				</c:forEach>
			</c:if>

			<div id="error">		
				<c:if test="${empty selectList}">
					<img src="images/t011dd4e406cb56ee8b.jpg" width="650" height="400"></img>
				</c:if>
			</div>
		</div>
	</div>
	<br>
</body>
</html>

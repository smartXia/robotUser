<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'topic.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function thisname() {
		$.ajax({
			url : "showAllTopic.action",
			type : "Post",
			dataType : "json",//往后台传数据的时候需要data格式
			/* data : {
				topicList : topicList,
			}, */
			success : function(data) {
				$.each(data, function(key, val) {
					$("#demo").append(
							"++++<a>" + val.topicId + "</a>" + "/"
									+ val.topicTitle + "/"
									+ val.topicContext);

				});

			},
			error : function(err) {
				alert("system error");
			}
		});
	}
</script>

</head>

<body>
	<p id="demo"></p>
	<button onclick="thisname()">惦记我</button>
</body>
</html>

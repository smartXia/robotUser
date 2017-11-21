<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<link rel="shortcut icon" href="images/bitbug_favicon.ico" />
<head>
<base href="<%=basePath%>">

<title>My JSP 'about.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/zixu.css" />
<style type="text/css">
.bord {
	color: #656565;
}
</style>
</head>


<body>
	<jsp:include page="respect.jsp"></jsp:include>

	<div class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand"></a>
			</div>

			<ul class="nav navbar-nav">
				<li class="active"><a href="news/showNewsListBytype.action">首页</a>
				</li>
				<li class=""><a href="news/showNewsList01.action">资讯</a>
				</li>
				<li><a href="RobotInfoListAll.action">商城</a>
				</li>
				<li><a href="showAllTopic.action">话题</a>
				</li>
				<li><a href="feedbacklist.action"
					style="font-size: 20px; font-weight: bold;">官方解答</a>
				</li>
				<li><a href="user/gerenzhongxin.jsp">个人中心</a></li>
				</li>

			</ul>

			<ul class="nav navbar-nav navbar-right">
				<div class="btn-group">
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">功能</a>
						</li>
						<li><a href="#">另一个功能</a>
						</li>
						<li><a href="#">其他</a>
						</li>
						<li class="divider"></li>
						<li><a href="#">分离的链接</a>
						</li>
					</ul>
				</div>
				<div class="btn-group">
					<c:if test="${ not empty users.userName}">
						<button type="button" class="btn btn-primary dropdown-toggle"
							id="la" data-toggle="dropdown">
							<img src="${users.userImage}" />&nbsp;${users.userName}<span
								class="caret"></span>

						</button>
					</c:if>

					<c:if test="${empty users.userName}">
						<button type="button" class="btn btn-primary dropdown-toggle"
							onclick="window.open('loginusers.jsp')">请登录</button>
					</c:if>


					<ul class="dropdown-menu laa" role="menu">
						<li><a href="user/gerenzhongxin.jsp">个人中心</a>
						</li>

						<li><a href="news/loginout.action">登出</a>
						</li>
						<li><a href="#">其他</a>
						</li>
						<li class="divider"></li>
						<li><a href="#">无链接</a>
						</li>
					</ul>
				</div>
			</ul>
		</div>
	</div>



	<div class="container">

		<div class="row clearfix">

			<c:forEach items="${feedBackList}" var="feedBackList">

				<div class="col-md-4 column">
					<h2>${feedBackList.question}</h2>
					<p class="bord">${feedBackList.answer}</p>
					<p>
						<a>Q & A » </a>
					</p>
				</div>

			</c:forEach>

		</div>
	</div>





	<%-- ${feedBackList.question}${feedBackList.answer} --%>
	<%-- 	<ul class="pagination">
		<c:choose>
			<c:when test="${pageNo>1}">
				<li><a href="#">&laquo;</a>
				</li>
				<li><a href="feedbacklist.action">首页</a>
				</li>
				<li><a href="feedbacklist.action?pageNo=${pageNo-1}">上一页</a>
				</li>
			</c:when>
		</c:choose>

		<c:choose>
			<c:when test="${pageNo!=pageNums}">
				<li><a href="feedbacklist.action?pageNo=${pageNo+1}">下一页</a></li>
				<li><a href="feedbacklist.action?pageNo=${pageNums}">末页</a></li>
			</c:when>
		</c:choose>
	</ul>
	当前页数:[${pageNo}/${pageNums}] --%>

	<div class="footer">6789网址导航 联系我们 意见反馈 收录申请 主页篡改举报 苏ICP备16021905号
		苏公网安备 32082902000122号 淮安市沙磊网络科技有限公司</div>
</body>

</html>
</body>
</html>

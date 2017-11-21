<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="shortcut icon" href="images/bitbug_favicon.ico" />
<title>My JSP 'zixunDeatil.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--<link rel="stylesheet" type="text/css" href="styles.css">-->
<link rel="stylesheet" href="css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="css/zixu.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
h4 {
	margin-top: 30px;
	background-color: ;
	text-indent: 120px;
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
				<li class=""><a href="news/showNewsList01.action"
					style="font-size: 20px; font-weight: bold;">资讯</a>
				</li>
				<li><a href="RobotInfoListAll.action">商城</a>
				</li>
				<li><a href="showAllTopic.action">话题</a>
				</li>
				<li><a href="about.jsp">联系我们</a>
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
		<div class="panel panel-success">
			<div class="panel-heading ">
				<h3 class="panel-title ">
					机器人新闻站内网 < <a> 站内信息</a>
				</h3>
			</div>
			<div class="panel-body ">机器人新闻站内网机器人新闻站内网机器人新闻站内网机器人新闻站内网</div>
		</div>
		<div class="col-md-9">
			<h1 class="news-title">${newsInfo.newsTitle}</h1>
			<div class="news-status">

				阅读量：${newsInfo.newsRead}&nbsp;&nbsp;&nbsp;发布时间：
				<fmt:formatDate value="${newsInfo.newsDate}"
					pattern="yyyy-MM-dd HH:mm:ss" />
				<div class="label label-default">类型</div>
				<div class="label label-default">类型</div>
				<div class="label label-default">类型</div>
				<div class="label label-default">类型</div>
			</div>
			<div class="news-content">
				<blockquote>
					<p>${newsInfo.newsId}</p>
				</blockquote>
				<img src="${newsInfo.newsImages}" height="200" width="200" />
				<h4>${newsInfo.newsContext}</h4>
			</div>
		</div>
		<div class="col-md-3">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">欢迎来到机器人之家</h3>
				</div>
				<div class="panel-body">在这里您将体验前所未有的惊喜与经历</div>
			</div>
			<div class="side-bar-card">

				<div class="card-title">24小时热文</div>
				<div class="card-body">

					<div class="list">

						<c:forEach items="${ showNewsListBytype24}"
							var="showNewsListBytype24">
							<div class="item">
								<div class="title">
									<a
										href="news/showNewsduixiang.action?newsId=${showNewsListBytype24.newsId}+
									&newsRead=${showNewsListBytype24.newsRead}">${showNewsListBytype24.newsTitle}</a>
								</div>
								<%-- <div class="desc">${showNewsListBytype24.newsContext}</div> --%>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="side-bar-card">
				<div class="card-title">相关推荐</div>
				<div class="card-body">
					<div class="list">
						<div class="item clearfix">
							<div class="col-xs-5 on-padding-h">
								<img src="images/fff.png" alt="" />
							</div>
							<div class="col-xs-7">
								<div class="title">15k评论</div>
								<div class="desc">15阅读</div>
							</div>
						</div>
						<div class="item clearfix">
							<div class="col-xs-5 on-padding-h">
								<img src="images/fff.png" alt="" />
							</div>
							<div class="col-xs-7">
								<div class="title">15k评论</div>
								<div class="desc">15阅读</div>
							</div>
						</div>
						<div class="item clearfix">
							<div class="col-xs-5 on-padding-h">
								<img src="images/fff.png" alt="" />
							</div>
							<div class="col-xs-7">
								<div class="title">15k评论</div>
								<div class="desc">15阅读</div>
							</div>
						</div>
						<div class="item clearfix">
							<div class="col-xs-5 on-padding-h">
								<img src="images/fff.png" alt="" />
							</div>
							<div class="col-xs-7">
								<div class="title">15k评论</div>
								<div class="desc">15阅读</div>
							</div>
						</div>

						<div class="item clearfix">
							<div class="col-xs-5 on-padding-h">
								<img src="images/fff.png" alt="" />
							</div>
							<div class="col-xs-7">
								<div class="title">15k评论</div>
								<div class="desc">15阅读</div>
							</div>
						</div>

					</div>

				</div>
			</div>

		</div>
	</div>

	<div class="footer">6789网址导航 联系我们 意见反馈 收录申请 主页篡改举报 苏ICP备16021905号
		苏公网安备 32082902000122号 淮安市沙磊网络科技有限公司</div>
</body>
</html>

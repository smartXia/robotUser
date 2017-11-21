<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="shortcut icon" href="images/bitbug_favicon.ico" />
<base href="<%=basePath%>">
<title>My JSP 'zixun.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/zixu.css" />


<style type="text/css">
.p1 {
	width: 300px;
	height: 50px;
	line-height: 25px;
	overflow: hidden
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
					style="font-size: 20px; font-weight: bold;">资讯</a></li>
				<li><a href="RobotInfoListAll.action">商城</a></li>
				<li><a href="showAllTopic.action">话题</a></li>
				<li><a href="feedbacklist.action">官方解答</a></li>
				<li><a href="user/gerenzhongxin.jsp">个人中心</a></li>

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
	<hr />
	<div class="container">

		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="carousel slide" id="carousel-456141">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-456141"></li>
						<li data-slide-to="1" data-target="#carousel-456141"></li>
						<li data-slide-to="2" data-target="#carousel-456141"
							class="active"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item">
							<!-- <img src="images/default.jpg"></img> -->
							<img src="images/default.png"></img>
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<h5>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</h5>
							</div>
						</div>
						<div class="item">
							<img src="default.jpg"></img>

							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<h5>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</h5>
							</div>
						</div>
						<div class="item active">
							<img src="images/default02.jpg"></img>

							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<h5>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</h5>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-456141"
						data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span> </a> <a
						class="right carousel-control" href="#carousel-456141"
						data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span> </a>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>

	<br>
	<div class="container">
		<div class="row">
			<div class="col-sm-9">
				<div class="panel panel-success">
					<div class="panel-heading ">
						<h3 class="panel-title ">机器人新闻站内网</h3>
					</div>
					<div class="panel-body ">机器人新闻站内网机器人新闻站内网机器人新闻站内网机器人新闻站内网</div>
				</div>
				<c:forEach items="${showNewsListBytype01 }"
					var="showNewsListBytype01">
					<div class="news-list">
						<div class="news-list-item clearfix">
							<div class="col-xs-4">
								<img src="${showNewsListBytype01.newsImages}" alt="新闻图片" />
							</div>
							<div class="clo-xs-7">
								<a
									href="news/showNewsduixiang.action?newsId=${showNewsListBytype01.newsId}+
									&newsRead=${showNewsListBytype01.newsRead}"
									class="title">${showNewsListBytype01.newsTitle}</a>
								<div class="p1">
									<a
										href="news/showNewsduixiang.action?newsId=${showNewsListBytype01.newsId}+
									&newsRead=${showNewsListBytype01.newsRead}">${showNewsListBytype01.newsContext}</a>
								</div>
								<div class="info">
									<span><span class="avatar"></span> <%-- ${showNewsListBytype01.newsAuthor
										} --%> </span> <span>类型</span> <span>浏览量：<font color="#ffcc00"
										size="3">${showNewsListBytype01.newsRead}</font>&nbsp;发布日期： <font
										color="#5C055C" size="3"><span> <fmt:formatDate
													value="${showNewsListBytype01.newsDate}"
													pattern="yyyy-MM-dd HH:mm:ss" /> </span> </font> </span>
								</div>
							</div>

						</div>
					</div>
				</c:forEach>
			</div>

			<div class="col-sm-3">
				<div class="search-bar">
					<form action="selectnews.action" method="post">
						<input class="form-control" type="search" autocomplete="off"
							placeholder="请输入关键词" class="input-kw">
					</form>

				</div>
				<jsp:include page="ciyun2.jsp"></jsp:include>
				<div class="side-bar-card flag clearfix ">
					<div class="col-xs-5">
						<img src="images/templatemo_image_02.jpg" alt="搜索图" />
					</div>
					<div class="col-xs-7">
						<div class="text-lg">有害信息举报</div>
						<div>举报电话：110</div>
					</div>
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
									<%-- 	<div class="desc">${showNewsListBytype24.newsContext}</div> --%>
								</div>
							</c:forEach>
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

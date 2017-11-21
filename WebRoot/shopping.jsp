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
<%-- <base href="<%=basePath%>"> --%>
<link rel="shortcut icon" href="images/bitbug_favicon.ico" />
<title>My JSP '商城.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/zixu.css" />

<link rel="stylesheet" href="css/goods.css" />
<link rel="stylesheet" href="css/css.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
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
				<li><a href="RobotInfoListAll.action"
					style="font-size: 20px; font-weight: bold;">商城</a>
				</li>
				<li><a href="showAllTopic.action">话题</a>
				</li>
				<li><a href="feedbacklist.action">官方解答</a></li>
				<li><a href="user/personDetail.jsp">个人中心</a></li>
				</li>

			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.html">login</a></li>
				<li><a href="register.html">regiseter</a></li>
			</ul>
		</div>
	</div>
	<div class="container">
		<section class="daohang"> 首页 > 全部商品 </section>
		<section class="selector">
		<div class="sl-category"></div>
		<div class="sl-prop">

			<div class="sl-line-wrap">

				<div class="mod-key">

					<span>品牌：</span>
				</div>
				<div class="mod-value">

					<div class="mod-value-list">
						<ul>
							<li class="vm-all active">全部</li>
							<c:forEach items="${robotTypesList}" var="type" varStatus="ss">
								<li><a href="">${type.typeName}${ss.count}</a></li>
							</c:forEach>
						</ul>
					</div>

				</div>
			</div>

			<div class="sl-line-wrap">

				<div class="mod-key">

					<span>厂商：</span>
				</div>
				<div class="mod-value">
					<div class="mod-value-list">
						<ul>
							<li class="vm-all active">全部</li>
							<c:forEach items="${robotComList}" var="robotComList"
								varStatus="cc">
								<li><a>${robotComList.companyName}${cc.count}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>

		</div>
		</section>
		<hr>
		筛选：
		<hr>
		<c:forEach items="${RobotInfoListAll}" var="RobotInfoListAll">
			<div class="col-sm-3 goodlist">
				<div class="goodimg">
					<a href="eachRobotInfo.action?robotId=${RobotInfoListAll.robotId}"><img
						src="${RobotInfoListAll.robotImage}" alt="商品图片" /> </a>
					<div class="goodname">
						<span>商品名：${RobotInfoListAll.robotName}</span>
						<div class="goodprice">
							<span>价格：${RobotInfoListAll.robotPrice}万</span>
							<div class="goodinfo">
								<span>余货:${RobotInfoListAll.robotCount}件</span>
							</div>
						</div>
					</div>
				</div>

			</div>
		</c:forEach>
	</div>
	<div class="footer">6789网址导航 联系我们 意见反馈 收录申请 主页篡改举报 苏ICP备16021905号
		苏公网安备 32082902000122号 淮安市沙磊网络科技有限公司</div>
</body>
</html>

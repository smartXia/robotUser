<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
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

<title>My JSP 'eachRobotInfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/zixu.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/详情.css" />



<link rel="stylesheet" href="css/css.css" />
<script type="text/javascript">
	/* 	function gouwuche() {
	 var robotId = $("#robotid").val();
	 var userId = $("#userid").val();
	 alert(robotId);
	
	 } */
	$(document)
			.ready(
					function() {
						var robotId = $("#robotid").val();
						var userId = $("#userid").val();
						$("#b1")
								.click(
										function() {
										/* 	alert("值为: " + userId);
											alert("值为: " + robotId); */
											if (userId.length == 0) {
												alert("请先登录后再购买");
												return false;
											} else {
												location.href = "order/orderRobot.action?robotId="
														+ robotId
														+ "&userId="
														+ userId;
												alert("加入购物车成功！请到个人中心查看");
											}

										});
					});
</script>
<style type="text/css">
#b1 {
	margin-top: 400px;
}
</style>
</head>

<body>

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
				<li><a href="about.jsp">联系我们</a>
				</li>
				<li><a href="user/gerenzhongxin.jsp">个人中心</a></li>
				</li>

			</ul>

			<ul class="nav navbar-nav navbar-right">
				<div class="btn-group">
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">功能</a></li>
						<li><a href="#">另一个功能</a></li>
						<li><a href="#">其他</a></li>
						<li class="divider"></li>
						<li><a href="#">分离的链接</a></li>
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
						<li><a href="user/gerenzhongxin.jsp">个人中心</a></li>

						<li><a href="news/loginout.action">登出</a></li>
						<li><a href="#">其他</a></li>
						<li class="divider"></li>
						<li><a href="#">无链接</a></li>
					</ul>
				</div>
			</ul>
		</div>
	</div>
	
	<hr />
	<div></div>
	<div class="left">

		<div class="col-md-1"></div>
		<div class="col-md-8">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">欢迎来到机器人之家</h3>
				</div>
				<div class="panel-body">在这里在这里您将体验前所未有的惊喜与经历您将体验前所未有的惊喜与经历在这里您将体验前所未有的惊喜与经历在这里您将体验前所未有的惊喜与经历在这里您将体验前所未有的惊喜与经历在这里您将体验前所未有的惊喜与经历</div>
			</div>

			<div id="ifocus">
				<div id="ifocus_pic">
					<div id="ifocus_piclist" style="left:0; top:0;">
						<ul>
							<li><a href="#"><img src="images/robot (1).jpg" alt="" />
							</a></li>
							<li><a href="#"><img src="images/robot (2).jpg" alt="" />

							</a></li>
							<li><a href="#"><img src="images/robot (3).jpg" alt="" />
							</a></li>
							<li><a href="#"><img src="images/robot (4).jpg" alt="" />
							</a></li>
						</ul>
					</div>
					<div id="ifocus_opdiv"></div>
					<div id="ifocus_tx">
						<ul>
							<li class="current">忧伤在我心中沉静下来，宛如降临在寂静山林中的夜色</li>
							<li class="normal">我就像一只停泊在海滩上的小船，聆听着晚潮奏</li>
							<li class="normal">生命是上天赋予的，我们惟有献出生命，才能真正得到它</li>
							<li class="normal">今天大地在阳光下向我细语，用一种已被遗忘的语言</li>
						</ul>
					</div>
				</div>
				<div id="ifocus_btn">
					<ul>
						<li class="current"><img src="images/robot (1).jpg" alt="" />
						</li>
						<li class="normal"><img src="images/robot (2).jpg" alt="" />
						</li>
						<li class="normal"><img src="images/robot (3).jpg" alt="" />
						</li>
						<li class="normal"><img src="images/robot (4).jpg" alt="" />
						</li>
					</ul>
				</div>
			</div>
			<br>
			<div class="col-md-8">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">娱乐机器人属性</h3>
					</div>
					<div class="panel-body">来自日本最优秀的设计师设计</div>
					<table class="table" id="">
						<th>属性</th>
						<th>描述</th>
						<tr>
							<td>产品名</td>

							<td>${robotInfo.robotName}</td>
						</tr>
						<tr>
							<td>缩略图</td>
							<td><img src="${robotInfo.robotImage}" alt="缩略图"
								style="width:60px;" /></td>
						</tr>
						<tr>
							<td>价格</td>
							<td>${robotInfo.robotPrice }万</td>
						</tr>
						<tr>
							<td>生产商</td>
							<td>${robotInfo.robotCompany}</td>
						</tr>
						<tr>
							<td>评论点数</td>
							<td>${robotInfo.robotCommit }</td>
						</tr>
						<tr>
							<td>库存</td>
							<td>${robotInfo.robotCount }</td>
						</tr>
						<tr>
							<td>购买指数</td>
							<td>100%</td>
						</tr>
					</table>
				</div>
				<input type="text" value="${users.userId}" id="userid">
				<input type="hidden" name="" id="robotid"
					value="${robotInfo.robotId }">

				<!-- 	<button onclick="lijigoumai()" id="b2">加入购物车</button> -->
				<!-- <input type="button" class="" id="goumai" value="立即购买"> <input
						type="button" class="" id="gouwuche" value="加入购物车"> -->


			</div>
			<!-- <div class="buy">
				<div class="buy">
					<button type="button" class="" id="goumai">立即购买</button>
					<button type="button" class="" id="gouwuche">加入购物车</button>
				</div> -->
			<!-- <div class="gooddetail">
				<img src="images/Cgbj0Vmsux6AbOEJAAIIr358pmg988.jpg" alt="" />
			</div> -->

			<button class="btn btn-danger" onclick="gouwuche()" id="b1">加入购物车</button>

		</div>
	</div>
	<div class="col-md-1"></div>
	<div class="col-md-3">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">欢迎来到机器人之家</h3>
			</div>
			<div class="panel-body">在这里您将体验前所未有的惊喜与经历</div>
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

	<div class="footer">
		<img src="images/templatemo_content_wrapper_outrer.jpg" /> 6789网址导航
		联系我们 意见反馈 收录申请 主页篡改举报 苏ICP备16021905号 苏公网安备 32082902000122号
		淮安市沙磊网络科技有限公司
	</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>

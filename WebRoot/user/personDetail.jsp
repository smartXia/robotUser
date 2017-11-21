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
<head>
<base href="<%=basePath%>">
<link rel="shortcut icon" href="images/bitbug_favicon.ico" />
<title>My JSP 'personDeatil.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/gerenshezhi.css" />
<link rel="stylesheet" href="css/bootstrap.min.css" />

<script type="text/javascript">
	$(document).ready(function() {
		$("#base").click(function() {
			var userid = $("#userid").val();
			$(".section-base").toggle(500);
			$(".section-money").hide(500);
			$(".section-shop").hide(500);
			var userid = $("#userid").val();
			location.href = "user/userInfoDetail.action?userId=" + userid;
		});
	});
	$(document).ready(function() {
		$("#money").click(function() {
			$(".section-money").toggle(500);
			$(".section-base").hide(500);
			$(".section-shop").hide(500);

		});
	});
	$(document).ready(function() {

		$("#shop").click(function() {

			var userid = $("#userid").val();

			$(".section-shop").toggle(500);
			$(".section-money").hide(500);
			$(".section-base").hide(500);
			/* location.href = "user/userInfoDetail.action?userId=" + userid; */
		});
	});
</script>
</head>

<body>
	<input type="hidden" value="${userId}" id="userid">
	<div class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand"></a>
			</div>

			<ul class="nav navbar-nav">
				<li class="active"><a href="news/showNewsListBytype.action">首页</a>
				</li>
				<li class=""><a href="news/showNewsList01.action">资讯</a></li>
				<li><a href="RobotInfoListAll.action"
					>商城</a></li>
				<li><a href="showAllTopic.action">话题</a></li>
				<li><a href="about.jsp">联系我们</a></li>
				<li><a href="user/personDetail.jsp" style="font-size: 20px; font-weight: bold;">个人中心</a>
				</li>
				</li>

			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.html">login</a></li>
				<li><a href="register.html">regiseter</a></li>
			</ul>
		</div>
	</div>
	<div class="person">
		<div class="title" style="text-align: center;">
			<p>
			<h3>个人信息极速一览</h3>
			</p>
		</div>
		<hr>
		</br>
		<div class="btn-toolbar" role="toolbar">
			<div class="btn-group">
				<div class="col-sm-3">
					<button type="button" class="btn btn-default " id="shop">购物车
					</button>
				</div>
				<div class="col-sm-3">
					<button type="button" class="btn btn-default" id="base">信息填写</button>
				</div>
				<div class="col-sm-3">
					<button type="button" class="btn btn-default " id="money">账户信息
					</button>
				</div>

				<div class="col-sm-3">
					<button type="button" class="btn btn-default " id="send">物流状态</button>
				</div>
			</div>

		</div>
		<div class="section-base">
			<div class="col-md-1"></div>
			<div class="col-md-5">
				<table class="table table-bordered">
					<caption>边框表格布局</caption>
					<tr>
						<td>昵称</td>
						<td><input type="text" name="" value="${users.userName}" />
						</td>
					</tr>
					<tr>
						<td>头像</td>
						<td><img alt="" src="${users.userImage}" width="25"
							height="30">
						</td>
					</tr>
					<tr>
						<td>替换头像</td>
						<td><input type="file" name="userImage" value="" />
						</td>
					</tr>

					<tr>
						<td>密码</td>
						<td><input type="password" name="" value="${users.userPwd}" />
						</td>
					</tr>
					<tr>
						<td>手机号</td>
						<td><input type="text" name="" value="${users.userPhone}" />
						</td>
					</tr>
				</table>
			</div>
			<div class="col-md-5">
				<table class="table table-bordered">
					<caption>边框表格布局</caption>
					<tr>
						<td>邮箱</td>
						<td><input type="text" name="" value="${users.userEmail}" />
						</td>
					</tr>
					<tr>
						<td>地址</td>
						<td><input type="text" name="" value="${users.userAddress}" />
						</td>
					</tr>
					<tr>
						<td>昵称</td>
						<td><input type="text" name="" value="" />
						</td>
					</tr>
					<tr>
						<td>昵称</td>
						<td><input type="text" name="" value="" />
						</td>
					</tr>
					<tr>
						<td>昵称</td>
						<td><input type="text" name="" value="" />
						</td>
					</tr>
				</table>
			</div>
			<div class="col-md-1"></div>
			<input type="submit" id="" value="修改" />
		</div>

		<div class="section-money">
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<p class="form-control-static">email@example.com</p>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">账户余额</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputPassword"
							value="${users.userMoney}" placeholder="请输入密码" disabled>
					</div>
				</div>

			</form>
		</div>
		<div class="section-shop">

			<div class="col-md-4">
				<c:forEach items="${orderList}" var="orderList">
					<span>${orderList.orderId}</span>
					<span>&nbsp;${orderList.userId}&nbsp;</span>
						<span>&nbsp;${orderList.robotId}&nbsp;</span>
					<span>${orderList.number}&nbsp;</span>
					<span>${orderList.note}&nbsp; </span>
					<span>${orderList.orderState}&nbsp;</span>
			
					<fmt:formatDate value="${orderList.createTime}"
							pattern="yyyy-MM-dd HH:mm:ss" />
						
					<br>
				</c:forEach>
			</div>
			<input type="submit" id="" value="结算" />
		</div>
	</div>


	<div class="baseinfo"></div>


	<hr />

	<div class="footer">6789网址导航 联系我们 意见反馈 收录申请 主页篡改举报 苏ICP备16021905号
		苏公网安备 32082902000122号 淮安市沙磊网络科技有限公司</div>

</body>
</html>

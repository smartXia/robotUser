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
<title>My JSP 'gerenzhongxin.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/myCart.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/zixu.css" />
<link href="css/myCart.css" type="text/css" rel="stylesheet" />

<link rel="stylesheet" href="css/gerenshezhi.css" type="text/css"></link>
<style type="text/css">
h5 {
	color: #269ABC;
	text-indent: 22px;
}

#shopping {
	margin: 0 auto;
	width: 60%;
	border: 2px solid #aaa;
	border-collapse: collapse;
}

#shopping2 {
	margin: 0 auto;
	width: 60%;
	border: 2px solid #aaa;
	border-collapse: collapse;
}

h3 {
	text-align: center;
}

#shopping th,#shopping td {
	border: 2px solid #aaa;
	padding: 5px;
}

#shopping2 th,#shopping2 td {
	border: 2px solid #aaa;
	padding: 5px;
}

th {
	background-color: #eee;
}

.cart_td {
	background-color: #e2f2ff;
	border-bottom: solid 1px #d1ecff;
	border-top: solid 1px #d1ecff;
	text-align: center;
	padding: 5px;
	border-right: solid 1px #FFF;
}

input {
	border: solid 1px #666;
	width: 25px;
	height: 15px;
	text-align: center;
}

#total {
	border: 1px solid lightgrey;
	margin-top: 50px;
	margin-left: 700px;
}

#jiesuan {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}
</style>
<script>
	function changeNum(numId, flag, orderid) { /*numId表示对应商品数量的文本框ID，flag表示是增加还是减少商品数量*/

		var numId = document.getElementById(numId);

		if (flag == "minus") { /*减少商品数量*/
			if (numId.value <= 1) {
				alert("宝贝数量必须是大于0");
				return false;
			} else {
				numId.value = parseInt(numId.value) - 1;
				//触发后台数库增加或删除所有的值都放在session中

				productCount();
			}
		} else { /*flag为add，增加商品数量*/
			numId.value = parseInt(numId.value) + 1;

			productCount();
		}

		var number = numId.value;
		/* alert(number);
		alert(orderid); */
		var userName = document.getElementById("userName").value;
		var userId = document.getElementById("userId").value;
		location.href = "order/updatenumber.action?&orderId=" + orderid
				+ "&number=" + number + "&userName=" + userName + "&userId="
				+ userId;
	}
	/*自动计算商品的总金额、总共节省的金额和积分*/
	function productCount() {
		var total = 0; //商品金额总计
		var price; //每一行商品的单价
		var number; //每一行商品的数量
		var subtotal; //每一行商品的小计
		/*访问ID为shopping表格中所有的行数*/
		var myTableTr = document.getElementById("shopping")
				.getElementsByTagName("tr");
		if (myTableTr.length > 0) {
			for ( var i = 1; i < myTableTr.length; i++) { /*从1开始，第一行的标题不计算*/
				if (myTableTr[i].getElementsByTagName("td").length > 1) { //最后一行不计算							
					price = myTableTr[i].getElementsByTagName("td")[3].innerHTML;
					number = myTableTr[i].getElementsByTagName("td")[4]
							.getElementsByTagName("input")[0].value;
					total += price * number;
					myTableTr[i].getElementsByTagName("td")[5].innerHTML = price
							* number;
				}
			}
			document.getElementById("total").innerHTML = total;
		}
	}
	function jiesuan() {
		var userId = document.getElementById("userId").value;

		var userName = document.getElementById("userName").value;
		location.href = "order/jiesuan.action?&userName=" + userName
				+ "&userId=" + userId;
	}
	window.onload = productCount;
</script>
</head>

<body>

	<%@include file="contrl.jsp"%>
	<div class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand"></a>
			</div>

			<ul class="nav navbar-nav">
				<li class="active"><a href="news/showNewsListBytype.action">首页</a>
				</li>
				<li class=""><a href="news/showNewsList01.action">资讯</a></li>
				<li><a href="RobotInfoListAll.action">商城</a></li>
				<li><a href="showAllTopic.action">话题</a></li>
				<li><a href="feedbacklist.action">官方解答</a></li>
				<li class="active"><a href="user/gerenzhongxin.jsp"
					style="font-size: 20px; font-weight: bold;">个人中心</a></li>
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
						<li><a href="user/personupdate.jsp">个人中心</a></li>

						<li><a href="news/loginout.action">登出</a></li>
						<li><a href="#">其他</a></li>
						<li class="divider"></li>
						<li><a href="#">无链接</a></li>
					</ul>
				</div>
			</ul>
		</div>
	</div>
	<div class="container">

		<div class="main3">
			<div class="col-md-1"></div>
			<div class="col-md-3">
				<img src="${users.userImage}" width="180px" height="180px" />
			</div>
			<div class="col-md-6">
				<span><h4>
						<strong>${users.userName} <input type="text"
							value="${users.userName}" id="userName"> </strong>
					</h4> </span>
				<hr>
				<table height=12
					style=border-color:lightgrey;border-left-style:solid;border-width:1px>
					<tr>
						<td valign=top><span><h5>手机号：${users.userPhone}</h5> </span>
							<span><h5>邮箱：${users.userEmail}</h5> </span> <span><h5>地址:${users.userAddress}</h5>
						</span> <span><h5>生日：${users.userBirth}</h5> </span> <span><h5>余额：${users.userMoney}</h5>
						</span>
							<hr />
				</table>

			</div>

			<div class="col-md-2">
				<button class="btn-info">
					<a href="user/personupdate.jsp">编辑个人信息</a>
				</button>
			</div>

			<br>
		</div>

		<br>
	</div>

	<h3>
		<a
			href="order/gouwuche.action?&userName=${users.userName}&userId=${users.userId}">${users.userName}查看购物车</a>
	</h3>
	<input type="hidden" value="${users.userId}" id="userId">
	<table id="shopping">
		<tr>
			<th>商品</th>
			<th>产品图</th>
			<th>生产商</th>
			<th>单价（元）</th>
			<th>数量</th>
			<th>金额</th>
			<th>操作</th>
		</tr>

		<c:forEach items="${orderList}" var="orderList" varStatus="tt">

			<input type="hidden" value="${orderList.orderId}">

			<tr>
				<td>${orderList.orderId}${orderList.robotName}</td>
				<td><img src="${orderList.robotImage}" width="50px"
					height="50px"></img></td>
				<td>${orderList.robotCom}</td>
				<td>${orderList.robotPrice}</td>
				<td class="cart_td"><img src="images/taobao_minus.jpg"
					alt="minus"
					onclick="changeNum('num_${tt.count}','minus','${orderList.orderId}')"
					class="hand" /> <input id="num_${tt.count}" type="text"
					value="${orderList.number}" class="num_input" readonly="readonly" />
					<img src="images/taobao_adding.jpg" alt="add"
					onclick="changeNum('num_${tt.count}','add','${orderList.orderId}')"
					class="hand" /></td>
				<td></td>
				<td><a
					href="order/deleteorder.action?&orderId=${orderList.orderId}&userId=${users.userId}">删除</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<c:if test="${empty orderList}">
				<td colspan="7"><a href="RobotInfoListAll.action">购物车空空如也，亲，还不去购物</a>
				</td>
			</c:if>
		</tr>
	</table>

	<label id="total" class="yellow"></label> 元
	<button id="jiesuan" onclick="jiesuan()">付款</button>
	<br />



	<h3>
		<a
			href="order/dingdan.action?&userName=${users.userName}&userId=${users.userId}">${users.userName}查看本人订单</a>
	</h3>
	<div class="col-md-4"></div>
	${users.userName} ${users.userId} 联系电话：${users.userPhone}

	<c:if test="${empty users.userAddress}">
		<button type="button" class="btn btn-primary dropdown-toggle"
			onclick="window.open('user/gerenzhongxin.jsp')">完善收货地址</button>
	</c:if>
	收获地址：${users.userAddress}
	<table id="shopping">
		<tr>
			<th>商品</th>
			<th>产品图</th>
			<th>生产商</th>
			<th>单价（元）</th>
			<th>数量</th>
			<th>状态</th>
			<th>订单号</th>

		</tr>

		<c:forEach items="${orderList2}" var="orderList2" varStatus="tt">
			<input type="hidden" value="${orderList2.orderId}">

			<tr>
				<td>${orderList2.robotName}</td>
				<td><img src="${orderList2.robotImage}" width="50px"
					height="50px"></img></td>
				<td>${orderList2.robotCom}</td>
				<td>${orderList2.robotPrice}</td>
				<td class="cart_td">${orderList2.number}</td>
				<td class="cart_td">${orderList2.orderState}</td>
				<td class="cart_td" id="water">${orderList2.water}</td>
			</tr>
		</c:forEach>
	</table>
	<div style="text-align:center;"></div>

	<div class="footer">
		<img src="images/templatemo_content_wrapper_outrer.jpg" /> 6789网址导航
		联系我们 意见反馈 收录申请 主页篡改举报 苏ICP备16021905号 苏公网安备 32082902000122号
		淮安市沙磊网络科技有限公司
	</div>

</body>
</html>

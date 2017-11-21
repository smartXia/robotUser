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
<link rel="shortcut icon" href="images/bitbug_favicon.ico" />
<base href="<%=basePath%>">

<title>My JSP 'jiesuan.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
<
style type           ="text /css">h5 {
	color: #269ABC;
	text-indent: 22px;
}

#shopping {
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

</head>

<body>

	<div class="section-shop">
		<input type="hidden" id="userId" value=" ${users.userId}"><input
			type="hidden" id="userName" value="	${users.userName}">
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

			<c:forEach items="${orderList}" var="orderList" varStatus="tt">
				<input type="hidden" value="${orderList.orderId}">

				<tr>
					<td>${orderList.robotName}</td>
					<td><img src="${orderList.robotImage}" width="50px"
						height="50px"></img>
					</td>
					<td>${orderList.robotCom}</td>
					<td>${orderList.robotPrice}</td>
					<td class="cart_td">${orderList.number}</td>
					<td class="cart_td">${orderList.orderState}</td>
					<td class="cart_td" id="water">${orderList.water}</td>
				</tr>
			</c:forEach>
		</table>
		<script type="text/javascript">
			function fukuan() {
				var userId = document.getElementById("userId").value;
				var userName = document.getElementById("userName").value;
				alert(userName);
				location.href = "order/fukuan.action";
			}
		</script>
		<button id="jiesuan" onclick="fukuan()">付款</button>
	</div>
</body>
</html>

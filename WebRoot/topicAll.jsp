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

<title>My JSP 'topicall.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/zixu.css" />
<script type="text/javascript">
	$(".btn btn-success btn-sm").click(function() {
		$("#demo").hide("fast");/* <!--点击show2出现login2的界面    */
	});
	function reply(topic, tid, usrId) {//回复的主题
		alert(uesrId);
		var context = document.getElementById("commitContext").value;
		var useId = document.getElementById("userid").value;
		alert(context);
		location.href = "replytopic.action?topicId=" + tid + "&commitContext"
				+ context + "&userId" + userId;
		alert("回复成功");
	};

	function look(topic, tid) {
		/*  var a=document.getElementById("topicId").value;  
		 alert(a); */
		/* <!--点击show1出现login的界面    */
		$.ajax({
			url : "showeveryCommit.action",
			type : "POST",
			data : {
				topicId : tid
			},
			success : function(data) {
				if (data == '') {//这个传数组专用那个传对象专用
					$("#demo" + topic).empty();
					$("#demo" + topic).append("<h5>暂无评论！</h5>");
				} else {
					$("#demo" + topic).empty(); //先清空字符串
					$.each(data, function(key, val) {
						$("#demo" + topic).append(
								"<div>" + val.commitUser + "：<a>"
										+ val.commitContext + "</a>" + "<hr>"
										+ val.commitTime + "</div>");
					});
				}
			},
			error : function(err) {

				alert("<h5>系统错误</h5>");
			}

		});

	}
	/* $("#btn2").click(function() {
		$("ol").prepend("<li>在开头添加列表项</li>");
	});
	 */
</script>
<style type="text/css">
.time {
	float: right;
	margin-top: 10px;
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
				<li><a href="showAllTopic.action"
					style="font-size: 20px; font-weight: bold;">话题</a>
				</li>
				<li><a href="about.jsp">联系我们</a>
				</li>
				<li><a href="user/personDetail.jsp">个人中心</a></li>
				</li>

			</ul>

			<ul class="nav navbar-nav navbar-right ">
				<li><a href="login.html ">login</a></li>
				<li><a href="register.html ">regiseter</a></li>
			</ul>
		</div>
	</div>
	<div class="container ">

		<div class="col-md-8">
			<c:forEach items="${topicList}" var="topicList" varStatus="tt">
				
				${topicList.topicId}
				
				<div class="panel panel-primary ">
					<div class="panel-heading ">
						<h3 class="panel-title ">${topicList.topicTitle}</h3>
					</div>
					<div class="panel-body ">${topicList.topicContext}</div>
					<!-- 模态框（Modal） -->
					<form action="replytopic" method="post">
						<input type="hidden" value="${topicLis.topicId}"
							name="${topicList.topicId}" id=""> <input type="hidden"
							value="${userId}" id="userid" name="userid">
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="myModalLabel">请输入回复内容${topicLis.topicId}</h4>
									</div>
									<div class="modal-body">
										<input type="text" value="" name="commitContext"
											id="commitContext">
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
										<button type="submit" class="btn btn-primary">回复</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal -->
						</div>
					</form>
					<div class="time">
						<button class="btn btn-success btn-sm"
							onclick="look(${tt.count},	${topicList.topicId})">查看评论
							${topicList.topicLove}+</button>

						<%-- <a href="showeveryCommit.action?&topicId=${topicList.topicId}">查看评论(${topicList.topicLove}+)</a> --%>
						<button class="btn btn-success btn-sm" data-toggle="modal"
							data-target="#myModal" id="btn3">点击回复</button>
						0 &nbsp; &nbsp; &nbsp;
						<%-- <a
							href="replytopic.action?&topicId=${topicList.topicId}">点击回复</a> --%>

						<fmt:formatDate value="${topicList.topicTime}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>
				</div>
				<div>
					<%-- <c:forEach items="${showeveryCommit}" var="showeveryCommit" >				
					${showeveryCommit.commitUser}${showeveryCommit.commitTime}${showeveryCommit.commitContext}
					${showeveryCommit.commitLove}
					</c:forEach> --%>
				</div>
				<span id="demo${tt.count}"></span>
			</c:forEach>
		</div>


	</div>
	<div class="footer">6789网址导航 联系我们 意见反馈 收录申请 主页篡改举报 苏ICP备16021905号
		苏公网安备 32082902000122号 淮安市沙磊网络科技有限公司</div>
</body>

</html>
</body>
</html>

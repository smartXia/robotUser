
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
<title>My JSP 'topictest.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css" href="css/zixu.css" />

<link rel="stylesheet" href="css/huati.css" />
<link rel="stylesheet" href="css/font-awesome.css" type="text/css"></link>
<script type="text/javascript">
 /* 	$(document).ready(function() {	
 		$("#reply-context #close").click(function(){
			$(".reply-context").hide();
		});	
 		
	}); */ 
	/* function reply(topic, tid) {
	document.getElementById("#reply-context").innerHTML("<h5>暂无评论！</h5>");
	}
	 */
function closecommit(){
	$(".reply-context").toggle();
}


	function look(topic,tid) {
		$.ajax({
			url : "showeveryCommit.action",
			type : "post",
			data : {
				topicId : tid
			},
			success : function(data) {
			
				if (data == '[]') {//这个传数组专用那个传对象专用				
					$("#reply-context" + topic).empty(); 
					$("#reply-context" + topic).append("<h5>暂无评论！</h5>");
				} else {			
					$("#reply-context" + topic).empty(); //先清空字符串
					$.each($.parseJSON(data), function(key, val) {
						console.log(val.commitTime);							
						$("#reply-context"+topic).append(
								"<a>&nbsp;&nbsp;&nbsp;" + val.commitUser +":"+"	</a>");
						$("#reply-context"+topic).append("&nbsp;&nbsp;&nbsp;&nbsp;"+val.commitContext +"<a id='timec'>"+new Date(parseInt(val.commitTime.time)).toLocaleString().substr(0, 22)+"</a>"
						+ "<hr>");	
				
					}); 
				 	/* $("#but"+topic).append("<button id='close' class='fa fa-angle-double-up' onclick='closecommit()'>收起</button>");	 */
				}
			},
			error : function(err) {

				alert("<h5>系统错误</h5>");
			}

		});

	}	
	
	function replytopic(topic,tid){	
	
	var userName= $("#userName").val();
				/* alert(userName);//回复的人
				alert(topic);//回复的话题id
				alert(tid); *///回复的id */
			
				if(userName.length==0){
				alert("请登录");
				return false;
				}else{
				
				
				$("#reply-context"+topic).append("<input type='text' value='请输入回复内容 ' name='commitContext' id='shuru'>");
					$("#reply-context"+topic).append("<input type='submit' value='提交' >");
				}
					
						
			}


	
</script>
<style type="text/css">
.close {
	background: red;
}

#timec {
	margin-top: 100px;
	border: 1px solid lightgrey;
	float: ;
	margin-right: 10px;
}
</style>
</head>

<body><jsp:include page="contrl.jsp"></jsp:include>
	<jsp:include page="respect.jsp"></jsp:include>
	<%-- 
	<input type="hidden" value="${userId}" id="userId">
	<input type="hidden" value="${userName}" id="userName"> --%>
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
				<li><a href="feedbacklist.action">官方解答</a>
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
		<div class="col-md-1"></div>

		<div class="col-md-10">
			<div class="well well-lg">
				尊敬的会员<strong>"${users.userName}"</strong>您好，欢迎来到我们官方的互动！，在这里您将畅所欲谈，与其他小伙伴们参与讨论！
			</div>
			<c:forEach items="${topicList}" var="topicList" varStatus="tt">
				<div class="topiclist">
					<div class="panel panel-info">
						<div class="panel-heading">
							<strong>#${topicList.topicTitle}#</strong>
						</div>
						<div class="panel-body">
							<p>${topicList.topicContext}</p>
							<div class="time">
								<fmt:formatDate value="${topicList.topicTime}"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</div>
						</div>

					</div>
					<div class="reply">
						<div id="butt">
							<button type="button" class="btn btn-success btn-sm"
								onclick="look(${tt.count},	${topicList.topicId})">
								查看评论 <span class="badge">${topicList.topicLove}</span>
							</button>
							<!-- 回复编号:回复id:回复人 -->

							<button type="button" class="btn btn-success btn-sm"
								onclick="replytopic(${tt.count},${topicList.topicId})"
								data-toggle="modal" data-target="#myModal">点击回复</button>

						</div>
						<div id="reply-topic${tt.count}" class="reply-context"></div>


						<form action="replytopic.action" method="post">
							<input type="hidden" value="${users.userId}" id="userId"
								name="userId"> <input type="hidden"
								value="${users.userName}" id="userName" name="userName">
							<input type="hidden" value="${topicList.topicId}" id="topicId"
								name="topicId">
							<div id="reply-context${tt.count}" class="reply-context"
								style="background-color:GhostWhite"></div>
						</form>
						<div id="but${tt.count}"></div>



						<hr>

					</div>
				</div>

			</c:forEach>

			<div class="col-md-1"></div>
		</div>
	</div>
	<div class="footer">
		<img src="images/templatemo_content_wrapper_outrer.jpg" /> 6789网址导航
		联系我们 意见反馈 收录申请 主页篡改举报 苏ICP备16021905号 苏公网安备 32082902000122号
		淮安市沙磊网络科技有限公司
	</div>
</body>
</html>

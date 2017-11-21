<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>用我炙热的感情感动你好吗？</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/tanchu.js"></script>
<link rel="stylesheet" href="css/mian.css" type="text/css"></link>
</head>
<script type="text/javascript">
	$(function() {
		$("#b4").click(function() {
			var name = $("#userName").val();
			var pwd = $("#userPwd").val();
			if (name.length == 0 && pwd.length == 0) {
				alert("用户名和密码需要输入");

			} else if (name.length == 0) {
				alert("用户名需要输入");

			} else if (pwd.length == 0) {
				alert("密码需要输入");
				alert(name);

			} else {
				$.ajax({
					url : "user/uesrLogin.action",
					type : "POST",
					datatype : "json",//传个单值到后台
					data : { //穿多个值到前台是contentType : 'application/json;charset=utf-8',
						userName : name,//传到前台选哦用json的格式
						userPwd : pwd
					},
					success : function(sss) {//接收回调函数的返回结果
						alert(sss);
						if (sss == '') {//为空的时候用‘’号传过来
							alert("账户名或密码不正常，请重新输入");
							location.href = "loginusers.jsp";
						} else {
							alert("欢迎" + sss.userName + "登录" + sss.userId);
							/* 	location.href = "user/userInfoDetail.action?userId="
										+ sss.userId;//定位到需要的servlet，也可以是页面s */
							location.href = "news/showNewsListBytype.action";
						}

					}
				});
			}
		});

		$("#Bregister").click(function() {
			var uname = $("#rname").val();
			//	var uphone = $("#rphone").val();
			var upwd = $("#rrpwd").val();
			var uphone = document.getElementById('rphone').value;
			/* 	alert(uname);
				alert(upwd);
				alert(uphone); */
			if (uname.length == 0 || uphone.length == 0 || upwd.length == 0) {
				alert("太懒了就三个信息还不输入完？");
				return false;

			}
			if (!(/^1[34578]\d{9}$/.test(uphone))) {
				alert("手机号码有误，请重填");
				return false;

			}
			if (upwd.length < 6) {
				alert("密码需要输入大于6位");

			} else {
				$.ajax({
					url : "user/uesrRegister.action",
					type : "POST",
					datatype : "json",//传个单值到后台
					//contentType : 'application/json;charset=utf-8',
					data : { //穿多个值到前台是contentType : 'application/json;charset=utf-8',
						"userName" : uname,//传到前台选哦用json的格式
						"userPwd" : upwd,
						"userPhone" : uphone
					},

					success : function(data) {//接收回调函数的返回结果
						/* 	alert(data); */
						if (data == "") {//为空的时候用‘’号传过来
							alert("用户名被占用,请重新填写！！！！");

							/* $.each(data, function(index, user) {///未实现
								alert(user.userName);//function (index, value)中index是当前元素的位置，value是值。b
							}); */
							location.href = "loginusers.jsp";//定位到需要的servlet，也可以是页面s
						} else {
							alert(data.userName + "注册成功请登录；请记住密码方便下次登录");
							/* location.href = "loginusers.jsp"; */
							//alert("欢迎" + sss.userName + "登录" + sss.userId);
							/* 	location.href = "user/userInfoDetail.action?userId="
										+ sss.userId;//定位到需要的servlet，也可以是页面s */
							location.href = "news/showNewsListBytype.action";

						}

					}
				});
			}
		});
	});
</script>




<body>
	<a href="news/showNewsListBytype.action"><img src="images/zhihu.png" id="zhihu" alt="我是图片哦!"></img></a>
	<p id="word">Change Life By Technical</p>
	<!--1:3比例-->
	<div id="lr">
		<span id="show1" class="show1">注册</span> &nbsp;&nbsp;&nbsp; <span
			id="show2">登录</span>
	</div>
	<div id="register">
		<input type="text" class="icon icon1" name="userName" id="rname"
			placeholder="   用户名作为登录的唯一凭证" /><br> <input type="text"
			class="icon icon2" name="userPhone" id="rphone"
			placeholder="   手机号/仅支持中国大陆/用于找回密码" /><br> <input
			type="password" class="icon icon3" name="userPwd"
			placeholder=" 密码(请输入至少6位)" id="rrpwd" /><br> <br> <input
			type="button" class="button button1" id="Bregister" value="注册Robot"><br>
		<br> <a style=" font-size: 14px;color:#808080; font-family:"TimesNewRoman">点击「Robot」按钮，即代表你同意
			<a href="https://www.zhihu.com/terms/"
			style=" text-decoration:none; color:#55abed;font-size: 14px;">
				《Robot协议》</a> </a><br> <br> <br> <input type="button"
			class="button button2 " id="b2" value="下载Robotapp">
		<div class="ui-dialog" id="show4">
			<div class="ui-dialog-content">
				<img src="images/yamzhengma.jpg">
			</div>
		</div>
	</div>

	<div id="login">
		<div>
			<input type="text" class="icon" id="userName" name="userName"
				placeholder="用户名" /><br> <input type="text" class="icon"
				id="userPwd" name="userPwd" placeholder="密码                    " /><br>
			<br>
			<!--第一个界面需要显示的表格-->
			<input type="button" id="b4" class="button button3" onclick=""
				value="登录">
		</div>
		<br> <br> <a
			style="text-decoration:none;color:#2a78dc;font-size: 14px;">手机验证码登录</a>
		&nbsp; &nbsp; &nbsp; &nbsp; <a href="http://www.baidu.com"
			style=" text-decoration:none; font-size: 14px;color:#808080; font-family:"TimesNewRoman" >无法登录</a>
		<br> <br>
		<div id="qq" style=" font-size: 14px;color:#808080; font-family:"TimesNewRoman" >社交账户登录</div>
		<div id="show3">
			&nbsp; &nbsp; <a href="http://connect.qq.com/"
				style="text-decoration:none;"><img border="0"
				src="images/qq.png" id="image"> </a> &nbsp; &nbsp; &nbsp; <a
				href="http://connect.qq.com/" style="text-decoration:none;"><img
				border="0" src="images/weixin.png" id="image"> </a> &nbsp; &nbsp;
			&nbsp; <a href="http://connect.qq.com/" style="text-decoration:none;"><img
				border="0" src="images/xinlang.png" id="image"> </a>
		</div>
		<br> <br>
		<div>
			<input type="button" class="button button2 " id="b3"
				value="下载Robotapp">
			<div class="ui-dialog" id="show5">
				<div class="ui-dialog-content">
					<img src="images/yamzhengma.jpg">
				</div>
			</div>
		</div>
	</div>


	<div>
		<a id="bottom">© 2017 Robot · Robot圆桌 · 发现 · 移动应用 · 使用机构帐号登录 ·
			联系我们 · 来Robot工作 <br> 京 ICP 证 110745 号 · 京公网安备 11010802010035 号 ·
			出版物经营许可证</a>
	</div>
	<canvas id="myCanvas"></canvas>
	<script type="text/javascript" src="js/bg.js" charset="utf-8"></script>
</body>

</html>

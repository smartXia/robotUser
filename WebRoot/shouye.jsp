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
<base href="<%=basePath%>">
<link rel="shortcut icon" href="images/bitbug_favicon.ico" />
<title>My JSP 'shouye.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/mianindex.css" />
<link rel="stylesheet" href="css/css.css" />
<link rel="stylesheet" href="css/gerenshezhi.css" />
<script type="text/javascript" src="js/detail.js"></script>
<style type="text/css">
body {
	background-color: #F8F8FF;
}
</style>
</head>

<SCRIPT language=javascript>
		if(typeof(pgvMain) == 'function')
			pgvMain();
	</SCRIPT>
<SCRIPT>
		var gtopTab = "one";

		function $id(id) {
			return document.getElementById(id);
		}

		function changesTab(tab_id) {
			if(tab_id == gtopTab) {
				return;
			} else {
				$id(gtopTab).className = "unselect";
				$id(tab_id).className = "select";
				$id("tab_" + gtopTab).style.display = "none";
				$id("tab_" + tab_id).style.display = "block";
				gtopTab = tab_id;
			}
		}
	</SCRIPT>
<SCRIPT type=text/javascript>
		var $ = function(id) {
			return "string" == typeof id ? document.getElementById(id) : id;
		};
		var Extend = function(destination, source) {
			for(var property in source) {
				destination[property] = source[property];
			}
			return destination;
		}
		var CurrentStyle = function(element) {
			return element.currentStyle || document.defaultView.getComputedStyle(element, null);
		}
		var Bind = function(object, fun) {
			var args = Array.prototype.slice.call(arguments).slice(2);
			return function() {
				return fun.apply(object, args.concat(Array.prototype.slice.call(arguments)));
			}
		}
		var Tween = {
			Quart: {
				easeOut: function(t, b, c, d) {
					return -c * ((t = t / d - 1) * t * t * t - 1) + b;
				}
			},
			Back: {
				easeOut: function(t, b, c, d, s) {
					if(s == undefined) s = 1.70158;
					return c * ((t = t / d - 1) * t * ((s + 1) * t + s) + 1) + b;
				}
			},
			Bounce: {
				easeOut: function(t, b, c, d) {
					if((t /= d) < (1 / 2.75)) {
						return c * (7.5625 * t * t) + b;
					} else if(t < (2 / 2.75)) {
						return c * (7.5625 * (t -= (1.5 / 2.75)) * t + .75) + b;
					} else if(t < (2.5 / 2.75)) {
						return c * (7.5625 * (t -= (2.25 / 2.75)) * t + .9375) + b;
					} else {
						return c * (7.5625 * (t -= (2.625 / 2.75)) * t + .984375) + b;
					}
				}
			}
		}
		//容器对象,滑动对象,切换数量
		var SlideTrans = function(container, slider, count, options) {
			this._slider = $(slider);
			this._container = $(container); //容器对象
			this._timer = null; //定时器
			this._count = Math.abs(count); //切换数量
			this._target = 0; //目标值
			this._t = this._b = this._c = 0; //tween参数

			this.Index = 0; //当前索引

			this.SetOptions(options);

			this.Auto = !!this.options.Auto;
			this.Duration = Math.abs(this.options.Duration);
			this.Time = Math.abs(this.options.Time);
			this.Pause = Math.abs(this.options.Pause);
			this.Tween = this.options.Tween;
			this.onStart = this.options.onStart;
			this.onFinish = this.options.onFinish;

			var bVertical = !!this.options.Vertical;
			this._css = bVertical ? "top" : "left"; //方向

			//样式设置
			var p = CurrentStyle(this._container).position;
			p == "relative" || p == "absolute" || (this._container.style.position = "relative");
			this._container.style.overflow = "hidden";
			this._slider.style.position = "absolute";

			this.Change = this.options.Change ? this.options.Change :
				this._slider[bVertical ? "offsetHeight" : "offsetWidth"] / this._count;
		};
		SlideTrans.prototype = {
			//设置默认属性
			SetOptions: function(options) {
				this.options = { //默认值
					Vertical: true, //是否垂直方向（方向不能改）
					Auto: true, //是否自动
					Change: 0, //改变量
					Duration: 50, //滑动持续时间
					Time: 10, //滑动延时
					Pause: 4000, //停顿时间(Auto为true时有效)
					onStart: function() {}, //开始转换时执行
					onFinish: function() {}, //完成转换时执行
					Tween: Tween.Quart.easeOut //tween算子
				};
				Extend(this.options, options || {});
			},
			//开始切换
			Run: function(index) {
				//修正index
				index == undefined && (index = this.Index);
				index < 0 && (index = this._count - 1) || index >= this._count && (index = 0);
				//设置参数
				this._target = -Math.abs(this.Change) * (this.Index = index);
				this._t = 0;
				this._b = parseInt(CurrentStyle(this._slider)[this.options.Vertical ? "top" : "left"]);
				this._c = this._target - this._b;

				this.onStart();
				this.Move();
			},
			//移动
			Move: function() {
				clearTimeout(this._timer);
				//未到达目标继续移动否则进行下一次滑动
				if(this._c && this._t < this.Duration) {
					this.MoveTo(Math.round(this.Tween(this._t++, this._b, this._c, this.Duration)));
					this._timer = setTimeout(Bind(this, this.Move), this.Time);
				} else {
					this.MoveTo(this._target);
					this.Auto && (this._timer = setTimeout(Bind(this, this.Next), this.Pause));
				}
			},
			//移动到
			MoveTo: function(i) {
				this._slider.style[this._css] = i + "px";
			},
			//下一个
			Next: function() {
				this.Run(++this.Index);
			},
			//上一个
			Previous: function() {
				this.Run(--this.Index);
			},
			//停止
			Stop: function() {
				clearTimeout(this._timer);
				this.MoveTo(this._target);
			}
		};
	</SCRIPT>
</head>

<body>

	<div class="navbar navbar-default">
		<div class="container-2">
			<div class="navbar-header">
				<a class="navbar-brand"></a>
			</div>

			<ul class="nav navbar-nav">
				<li class="active"><a href="news/showNewsListBytype.action"
					style="font-size: 20px; font-weight: bold;">首页</a></li>
				<li class=""><a href="news/showNewsList01.action">资讯</a></li>
				<li><a href="RobotInfoListAll.action">商城</a></li>
				<li><a href="showAllTopic.action">话题</a></li>
				<li><a href="feedbacklist.action">官方解答</a>
				</li>
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

	<div class="col-md-9">
		<table bgcolor="#EFEFEF">
			<tr>
				<td width="1" valign="top">
					<div id="ad"
						style="position:absolute; width:488px; height:60px;font-size: 18px;color:#ffffff;font-weight: bolder;filter: Glow(Color=#6b8ec6, Strength=6) Shadow(Color=#6633ff, Direction=90) Blur(Add=#00CCFF Direction=270, Strength=10);">
						<marquee direction="down" behavior="alternate" scrollamount=1
							height="60">
							<marquee direction="right" scrollamount=4 behavior="alternate"
								width="468">
								<font color="#F3CBEB" size="4">t</font> <font color="#8BFB7A"
									size="4">e</font> <font color="#5C055C" size="4">c</font> <font
									color="#F75788" size="4">h</font> <font color="#403EA1"
									size="5">n</font> <font color="#D3AAB0" size="5">o</font> <font
									color="#77F761" size="7">l</font> <font color="#A4F430"
									size="1">o</font> <font color="#A38E3C" size="3">g</font> <font
									color="#3121A1" size="5">y</font> <font color="#4CC93A"
									size="5">c</font> <font color="#F36674" size="5">h</font> <font
									color="#499D64" size="3">a</font> <font color="#6DA6CD"
									size="3">n</font> <font color="#95B2CC" size="4">g</font> <font
									color="#E1B4AA" size="2">e</font> <font color="#3DF2B1"
									size="4">l</font> <font color="#5C31FC" size="6">i</font> <font
									color="#E98856" size="2">f</font> <font color="#86D117"
									size="2">e</font>
							</marquee>
						</marquee>
					</div></td>
				<td width="488"
					style="font-size: 16px;font-weight: bolder;filter: Glow(Color=blue, Strength=2) Alpha(Opacity=50, FinishOpacity=50, Style=1, StartX=1, StartY=1, FinishX=20, FinishY=20)">
					<marquee direction="up" behavior="alternate" scrollamount=1
						height="60">
						<marquee direction="left" scrollamount=4 behavior="alternate"
							width="488">www.myrobot.com</marquee>
					</marquee></td>
			</tr>
		</table>

		<DIV id=idContainer2 class=container>
			<TABLE id=idSlider2 border=0 cellSpacing=0 cellPadding=0>
				<TBODY>
					<TR>
						<TD class=td_f><A
							onclick="pgvSendClick({hottag:'ISD.SHOW.BANNER.SOFTMGR'});"
							href="RobotInfoListAll.action"> <img src="images/news1.jpg" />
								<div class="center-text">中居中居中居中居中居中</div> </A></TD>
						<TD class=td_f><A
							onclick="pgvSendClick({hottag:'ISD.SHOW.BANNER.PY'});"
							href="RobotInfoListAll.action"> <img src="images/news2.jpg" />
						</A></TD>
						<TD class=td_f><A
							onclick="pgvSendClick({hottag:'ISD.SHOW.BANNER.PLAYER'});"
							href="RobotInfoListAll.action"> <img src="images/news3.jpg" />
						</A></TD>
						<TD class=td_f><A
							onclick="pgvSendClick({hottag:'ISD.SHOW.BANNER.XF'});"
							href="RobotInfoListAll.action"> <img src="images/news4.jpg" />
						</A></TD>
						<TD class=td_f><A
							onclick="pgvSendClick({hottag:'ISD.SHOW.BANNER.TT'});"
							href="RobotInfoListAll.action"> <img src="images/news5.jpg" />
						</A></TD>
					</TR>
				</TBODY>
			</TABLE>
			<UL id=idNum class=num></UL>
		</DIV>
		<!--<table bgcolor="#EFEFEF">
					<tr>

						<td width="488" style="font-size: 16px;font-weight: bolder;filter: Glow(Color=blue, Strength=2) Alpha(Opacity=50, FinishOpacity=50, Style=1, StartX=1, StartY=1, FinishX=20, FinishY=20)">
							<marquee direction="up" behavior="alternate" scrollamount=1 height="160">
								<marquee direction="left" scrollamount=4 behavior="alternate" width="488"><img src="images/robot-(1).gif" /></marquee>
							</marquee>
						</td>
					</tr>
				</table>-->

		</br> </br> </br>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-5 yellow-bg padded "
				style="background-color: lightyellow; padding: 10px,10px,10px,10px;">
				<div class="row">
					<div class="col-sm-12">
						<img src="images/james-love.jpg" alt="James Love" height="114px">
					</div>
					<div class="col-sm-12">
						<h3>约瑟夫·恩格尔伯格</h3>
						<h5>
							<a href="mailto:jl@jllip.com"><i class="fa fa-envelope-o"></i>
								jl@jllip.com</a>
						</h5>
						<p>美国机器人工业协会会长杰夫·伯恩斯坦对恩格尔伯格所做的贡献赞不绝口，他表示正因为恩格尔伯格，机器人成为了全球性产业。几十年前他就能从昆虫、鸟类等生命身上联想到机器人，他走在了时代前列。
							他那句“你认为机器人能做到吗”激励了无数人员，也让无数优秀的机器人诞生。
							由于恩格尔伯格对机器人领域的巨大贡献，他被评为美国工程院院士。还被伦敦《星期日泰晤士报》评为“20世纪最伟大的1000名创造者”之一</p>
						<br>
					</div>
				</div>
			</div>
			<div class="col-md-5 white-bg padded"
				style="background-color: light;">
				<div class="row">
					<div class="col-sm-12">
						<img src="images/lindsey-wrenn.jpg" alt="Lindsey Wrenn"
							height="114px">
					</div>
					<div class="col-sm-12">
						<h3>AlphaGo</h3>
						<h5>
							<a href="mailto:lw@jllip.com"><i class="fa fa-envelope-o"></i>
								lw@jllip.com</a>
						</h5>
						<p>阿尔法围棋（AlphaGo）是通过两个不同神经网络“大脑”合作来改进下棋。这些“大脑”是多层神经网络，跟那些Google图片搜索引擎识别图片在结构上是相似的。它们从多层启发式二维过滤器开始，去处理围棋棋盘的定位，就像图片分类器网络处理图片一样。经过过滤，13个完全连接的神经网络层产生对它们看到的局面判断。这些层能够做分类和逻辑推理。充分的展示了，人工智能的强大和人类所面临的挑战
							对于我们来说。既是挑战又是机遇。所以留给我们的机会，一定要抓住.</p>
					</div>
				</div>
			</div>

		</div>

		</br> </br> </br>

		<!-- <div class="mov">
			<div class="col-sm-10">
				<img src="images/timg.jpg" alt="" />
			</div>
			<div class="col-sm-2">
				<img src="images/robot (7).jpg" /> <img src="images/robot (2).jpg" />
				<img src="images/robot (4).jpg" />
			</div>

		</div>
 -->

	</div>
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
					<c:forEach items="${showNewsListBytype20}"
						var="showNewsListBytype20">
						<div class="item clearfix">
							<div class="col-xs-5 on-padding-h">
								<img src="${showNewsListBytype20.newsImages}" alt="" />
							</div>
							<div class="col-xs-7">
								<div class="title"><a href="news/showNewsduixiang.action?newsId=${showNewsListBytype20.newsId}+
									&newsRead=${showNewsListBytype20.newsRead}">${showNewsListBytype20.newsTitle}</a></div>
								<div class="desc">阅读量${showNewsListBytype20.newsRead}</div>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</div>
		<div class="side-bar-card">

			<div class="card-title">24小时热文</div>
			<div class="card-body">

				<div class="list">

					<c:forEach items="${showNewsListBytype24}"
						var="showNewsListBytype24">
						<div class="item">

							<div class="title"><a href="news/showNewsduixiang.action?newsId=${showNewsListBytype24.newsId}+
									&newsRead=${showNewsListBytype24.newsRead}">${showNewsListBytype24.newsTitle}</a></div>
						<%-- 	<div class="desc">${showNewsListBytype24.newsContext}</div> --%>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="mov">
		<jsp:include page="ciyun.jsp"></jsp:include>
	</div>
	<SCRIPT>
			//new SlideTrans("idContainer", "idSlider", 3).Run();
			///////////////////////////////////////////////////////////
			var forEach = function(array, callback, thisObject) {
				if(array.forEach) {
					array.forEach(callback, thisObject);
				} else {
					for(var i = 0, len = array.length; i < len; i++) {
						callback.call(thisObject, array[i], i, array);
					}
				}
			}
			var st = new SlideTrans("idContainer2", "idSlider2", 5, {
				Vertical: false
			});
			var nums = [];
			//插入数字
			for(var i = 0, n = st._count - 1; i <= n;) {
				(nums[i] = $("idNum").appendChild(document.createElement("li"))).innerHTML = ++i;
			}
			forEach(nums, function(o, i) {
				o.onmouseover = function() {
					o.className = "on";
					st.Auto = false;
					st.Run(i);
				}
				o.onmouseout = function() {
					o.className = "";
					st.Auto = true;
					st.Run();
				}
			})
			//设置按钮样式
			st.onStart = function() {
				forEach(nums, function(o, i) {
					o.className = st.Index == i ? "on" : "";
				})
			}
			st.Run();
		</SCRIPT>
	<br />

	<div class="footer">
		<img src="images/templatemo_content_wrapper_outrer.jpg" />
		合作网站:www.robot.com
		 6789网址导航
		联系我们 意见反馈 收录申请 主页篡改举报 苏ICP备16021905号 苏公网安备 32082902000122号
		淮安市沙磊网络科技有限公司
	</div>

</body>

</HTML>
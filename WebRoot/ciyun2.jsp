<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ciyun2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/miaov_style.css" type="text/css"></link>
<script type="text/javascript" src="js/miaov.js"></script>
</head>
  <body>
  <div id="div1">
	<a href="news/selectNews.action?anyword=十大">十大</a>
	<a href="news/selectNews.action?anyword=亮相" class="red">亮相</a>
	<a href="news/selectNews.action?anyword=产业">产业</a>
	<a href="news/selectNews.action?anyword=人工智能"  class="green">人工智能</a>
	<a href="news/selectNews.action?anyword=排名" class="blue">排名</a>
	<a href="news/selectNews.action?anyword=研发">研发</a>
	<a href="news/selectNews.action?anyword=扫地" class="red">扫地</a>
	<a href="news/selectNews.action?anyword=亮相" class="yellow">亮相</a>
	<a href="news/selectNews.action?anyword=早报">早报</a>
	<a href="news/selectNews.action?anyword=看点" class="red">看点</a>
	<a href="news/selectNews.action?anyword=人造">人造</a>
	<a href="news/selectNews.action?anyword=工业" class="blue">工业</a>
	<a href="news/selectNews.action?anyword=逼真">逼真</a>
	<a href="news/selectNews.action?anyword=智能" class="red">智能</a>
	<a href="news/selectNews.action?anyword=物流" class="blue">物流</a>
	<a href="news/selectNews.action?anyword=时代">时代</a>
	<a href="news/selectNews.action?anyword=医生" class="blue">医生</a>
	<a href="news/selectNews.action?anyword=国产机" class="green">国产机</a>
	<a href="news/selectNews.action?anyword=智慧">智慧</a>
	<a href="news/selectNews.action?anyword=机器人" class="yellow">机器人</a>
	<a href="news/selectNews.action?anyword=大数据" class="green">大数据</a>
</div>
  </body>
</html>

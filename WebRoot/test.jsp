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
<base href="<%=basePath%>">

<title>My JSP 'test.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>


<script type="text/javascript" src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/bootstrap.min.css" />
</head>

<body>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="carousel slide" id="carousel-456141">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-456141"></li>
					<li data-slide-to="1" data-target="#carousel-456141"></li>
					<li data-slide-to="2" data-target="#carousel-456141" class="active">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="item">
						<img src="images/01.jpg"></img>
						<div class="carousel-caption">
							<h4>First Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>
					</div>
					<div class="item">
						<img src="images/02.jpg"></img>
						<div class="carousel-caption">
							<h4>Second Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>
					</div>
					<div class="item active">
						<img src="images/03.jpg"></img>
						<div class="carousel-caption">
							<h4>Third Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>
					</div>
				</div>
				<a class="left carousel-control" href="#carousel-456141"
					data-slide="prev"><span
					class="glyphicon glyphicon-chevron-left"></span> </a> <a
					class="right carousel-control" href="#carousel-456141"
					data-slide="next"><span
					class="glyphicon glyphicon-chevron-right"></span> </a>
			</div>
		</div>
	</div>
</body>
</html>

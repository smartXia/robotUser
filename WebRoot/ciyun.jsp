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

<title>My JSP 'ciyun.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- <link rel="stylesheet" href="css/bootstrap.min.css" /> -->
<style type="text/css">
#po {
	margin-left: -80px;
}
</style>
</head>
<body>
	<div class="col-md-7">
		<img src="images/ciyun.PNG"></img>
	</div>

	<div class="col-md-5 " id="po">
		<div class="panel panel-default">
			<div class="panel-heading">
				<strong>机器人行业统计数据分析</strong>
			</div>
			<div class="panel-body">
				<p style="color:#8e959a">2017年我国的机器人产业形势还是比较复杂，随着我国的“稳增长”政策效果的进一步显现，工业经济转型升级步伐加快，经济发展内生动力逐渐增强，多地亟需进行产业结构调整和改善生态环境，我国工业机器人新安装量有望继续保持较快速度增长。相关机器人行业统计数据显示：2016年12月中国工业机器人产量为7891套，同比增长48%。
					目前我国工业机器人渗透率低，普及工业机器人是中国制造2025 的基石。2015 年，全球工业机器人销售总量为 24.8 万台，同比增长
					8.30%。目前，中国已成为世界上最大的工业机器人市场，2015 年市场销售量为 6.7 万台，占全球市场份额的 27%，同比增长
					17.34%，2009-2015 年复合增长率为
					51.69%。已经连续三年为全球最大的工业机器人销售市场。然而，我国机器人密度仍然低于世界平均水平，未来有巨大的市场空间。2014
					年，中国制造业每万名员工平均拥有 36 台工业机器人，而世界平均水平为 66 台。相比之下，韩国、日本的机器人密度分别为
					478、314 台/万人。相比较韩国与日本，我们认为中国工业机器人产业未来的市场增长空间非常可观，市场规模可达到千亿量级。

					据工信部初步统计，我国涉及生产机器人的企业超过了800多家，其中超过200家是机器人本体制造企业，大部分以组装和代加工为主，处于产业链的低端，产业集中度很低，总体规模小。据IFR估计，从2016-2018年，工业机器人安装量年复合增长率至少达15%，2018年全球工业机器人总销量将达到约40万台。2018年，中国工业机器人市场销量有望超越15万台将继续成为全球市场增长的最强劲驱动力。

					世界机器人产业发展情况与未来机器人行业统计数据预期

					日益老龄化的人口结构、不断上涨的人工成本和全球化竞争是拉动机器人市场快速成长的重要因素。2015 年世界智能型机器人市场约为 269
					亿美元，今后 10 年间，CAGR（年平均成长率）将达到 9%，至 2025 年世界机器人市场将高达 669
					亿美元。统计数字显示，中国是全球增长最快的工业机器人市场，从2010 年到2016 年，中国工业机器人的总供给量年均增长速度约为
					40%。</p>
			</div>
		
		</div>
	</div>

</body>
</html>

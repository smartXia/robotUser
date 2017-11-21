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
<title>My JSP 'personupdate.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/zixu.css" />


<script language=javascript>
	cities = new Object();
	cities['台湾'] = new Array('台北', '台南', '其他');
	cities['马来西亚'] = new Array('Malaysia');
	cities['北京'] = new Array('北京');
	cities['上海'] = new Array('上海');
	cities['天津'] = new Array('天津');
	cities['重庆'] = new Array('重庆');
	cities['河北省'] = new Array('石家庄', '张家口', '承德', '秦皇岛', '唐山', '廊坊', '保定',
			'沧州', '衡水', '邢台', '邯郸');
	cities['山西省'] = new Array('太原', '大同', '朔州', '阳泉', '长治', '晋城', '忻州', '吕梁',
			'晋中', '临汾', '运城');
	cities['辽宁省'] = new Array('沈阳', '朝阳', '阜新', '铁岭', '抚顺', '本溪', '辽阳', '鞍山',
			'丹东', '大连', '营口', '盘锦', '锦州', '葫芦岛');
	cities['吉林省'] = new Array('长春', '白城', '松原', '吉林', '四平', '辽源', '通化', '白山',
			'延边');
	cities['黑龙江省'] = new Array('哈尔滨', '齐齐哈尔', '黑河', '大庆', '伊春', '鹤岗', '佳木斯',
			'双鸭山', '七台河', '鸡西', '牡丹江', '绥化', '大兴安');
	cities['江苏省'] = new Array('南京', '徐州', '连云港', '宿迁', '淮阴', '盐城', '扬州', '泰州',
			'南通', '镇江', '常州', '无锡', '苏州');

	cities['浙江省'] = new Array('杭州', '湖州', '嘉兴', '舟山', '宁波', '绍兴', '金华', '台州',
			'温州', '丽水');

	cities['安徽省'] = new Array('合肥', '宿州', '淮北', '阜阳', '蚌埠', '淮南', '滁州', '马鞍山',
			'芜湖', '铜陵', '安庆', '黄山', '六安', '巢湖', '池州', '宣城');

	cities['福建省'] = new Array('福州', '南平', '三明', '莆田', '泉州', '厦门', '漳州', '龙岩',
			'宁德');

	cities['江西省'] = new Array('南昌', '九江', '景德镇', '鹰潭', '新余', '萍乡', '赣州', '上饶',
			'抚州', '宜春', '吉安');

	cities['山东省'] = new Array('济南', '聊城', '德州', '东营', '淄博', '潍坊', '烟台', '威海',
			'青岛', '日照', '临沂', '枣庄', '济宁', '泰安', '莱芜', '滨州', '菏泽');

	cities['河南省'] = new Array('郑州', '三门峡', '洛阳', '焦作', '新乡', '鹤壁', '安阳', '濮阳',
			'开封', '商丘', '许昌', '漯河', '平顶山', '南阳', '信阳', '周口', '驻马店');

	cities['湖北省'] = new Array('武汉', '十堰', '襄攀', '荆门', '孝感', '黄冈', '鄂州', '黄石',
			'咸宁', '荆州', '宜昌', '恩施', '襄樊');

	cities['湖南省'] = new Array('长沙', '张家界', '常德', '益阳', '岳阳', '株洲', '湘潭', '衡阳',
			'郴州', '永州', '邵阳', '怀化', '娄底', '湘西');

	cities['广东省'] = new Array('广州', '清远', '韶关', '河源', '梅州', '潮州', '汕头', '揭阳',
			'汕尾', '惠州', '东莞', '深圳', '珠海', '江门', '佛山', '肇庆', '云浮', '阳江', '茂名',
			'湛江');

	cities['海南省'] = new Array('海口', '三亚');

	cities['四川省'] = new Array('成都', '广元', '绵阳', '德阳', '南充', '广安', '遂宁', '内江',
			'乐山', '自贡', '泸州', '宜宾', '攀枝花', '巴中', '达川', '资阳', '眉山', '雅安', '阿坝',
			'甘孜', '凉山');

	cities['贵州省'] = new Array('贵阳', '六盘水', '遵义', '毕节', '铜仁', '安顺', '黔东南', '黔南',
			'黔西南');

	cities['云南省'] = new Array('昆明', '曲靖', '玉溪', '丽江', '昭通', '思茅', '临沧', '保山',
			'德宏', '怒江', '迪庆', '大理', '楚雄', '红河', '文山', '西双版纳');

	cities['陕西省'] = new Array('西安', '延安', '铜川', '渭南', '咸阳', '宝鸡', '汉中', '榆林',
			'商洛', '安康');

	cities['甘肃省'] = new Array('兰州', '嘉峪关', '金昌', '白银', '天水', '酒泉', '张掖', '武威',
			'庆阳', '平凉', '定西', '陇南', '临夏', '甘南');

	cities['青海省'] = new Array('西宁', '海东', '西宁', '海北', '海南', '黄南', '果洛', '玉树',
			'海西');

	cities['内蒙古'] = new Array('呼和浩特', '包头', '乌海', '赤峰', '呼伦贝尔盟', '兴安盟', '哲里木盟',
			'锡林郭勒盟', '乌兰察布盟', '鄂尔多斯', '巴彦淖尔盟', '阿拉善盟');

	cities['广西'] = new Array('南宁', '桂林', '柳州', '梧州', '贵港', '玉林', '钦州', '北海',
			'防城港', '南宁', '百色', '河池', '柳州', '贺州');

	cities['西藏'] = new Array('拉萨', '那曲', '昌都', '林芝', '山南', '日喀则', '阿里');

	cities['宁夏'] = new Array('银川', '石嘴山', '吴忠', '固原');

	cities['新疆'] = new Array('乌鲁木齐', '克拉玛依', '喀什', '阿克苏', '和田', '吐鲁番', '哈密',
			'博尔塔拉', '昌吉', '巴音郭楞', '伊犁', '塔城', '阿勒泰');

	cities['香港'] = new Array('香港');

	cities['澳门'] = new Array('澳门');

	function set_city(province, city)

	{

		var pv, cv;

		var i, ii;

		pv = province.value;

		cv = city.value;

		city.length = 1;

		if (pv == '0')
			return;

		if (typeof (cities[pv]) == 'undefined')
			return;

		for (i = 0; i < cities[pv].length; i++)

		{

			ii = i + 1;

			city.options[ii] = new Option();

			city.options[ii].text = cities[pv][i];

			city.options[ii].value = cities[pv][i];

		}

	}
</script>
<style>
h5 {
	color: #269ABC;
}

#photo {
	background-color: #5bc0de; /* Green */
	border: none;
	color: white;
	padding: 10px 30px 30px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}

h3 {
	color: black;
	background-color: #e7e7e7;
	width: 180px;
	text-indent: 22px;
	padding: 5px 5px;
	border-radius: 10px;
}

.col-md-3 img {
	padding: 10px 0 0 10px;
	border-radius: 20px;
}

.btn-info .jiesuan {
	margin-bottom: 10px;
}

input,textarea {
	padding: 18px;
	border: solid 1px #E5E5E5;
	outline: 0;
	font: normal 13px/100% Verdana, Tahoma, sans-serif;
	width: 250px;
	background: #FFFFFF;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
	-moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
	-webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 8px;
}

input:hover,textarea:hover,input:focus,textarea:focus {
	border-color: #C9C9C9;
}

.tijiao {
	margin-left: 18%;
}

.file {
	position: relative;
	display: inline-block;
	background: #E5E9F2;
	border: 1px solid #99D3F5;
	border-radius: 4px;
	padding: 10px 12px 30px 10px;
	overflow: hidden;
	color: #1E88C7;
	text-decoration: none;
	text-indent: 0;
	line-height: 20px;
}

.file input {
	position: absolute;
	font-size: 100px;
	right: 0;
	top: 0;
	opacity: 0;
}
</style>


</head>

<body>

	<div class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand"></a>
			</div>

			<ul class="nav navbar-nav">
				<li class="active"><a href="news/showNewsListBytype.action"
					style="font-size: 20px; font-weight: bold;">首页</a>
				</li>
				<li class=""><a href="news/showNewsList01.action">资讯</a>
				</li>
				<li><a href="RobotInfoListAll.action">商城</a>
				</li>
				<li><a href="showAllTopic.action">话题</a>
				</li>
				<li><a href="about.jsp">联系我们</a>
				</li>
				<li><a href="user/gerenzhongxin.jsp">个人中心</a>
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
		<div class="main3">
			<div class="col-md-1"></div>
			<div class="col-md-4">
				<h3>${users.userName}</h3>
				<form action="user/userphoto.action" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="userName" value="${users.userName}">
					<input type="hidden" name="userId" value="${users.userId}">
					<input type="hidden" name="userPwd" value="${users.userPwd}">
					<img src="${users.userImage}" width="180px" height="180px" />
					<p class="image">
					<h5>修改上传头像</h5>
					<input type="file" class="file" name="file"
						value="${users.userImage}">
					</p>
					<input type="submit" id="photo"
						onclick="if (confirm('您已经修改信息成功!')) return true; else return false;"
						value="确认修改">
				</form>

			</div>
			<div class="col-md-6">
				<form action="user/userInfoUpdate.action" method="post"
					enctype="multipart/form-data" id="formid">
					<input type="hidden" name="userName" value="${users.userName}">
					<%-- <input type="text" name="userId" value="${users.userId}">
					<input type="text" name="userName" value="${users.userName}"> --%>
					<p class="name">
						<input type="text" name="userId" id="" value="${users.userId}">
					<h5>密码</h5>
					<input type="password" name="userPwd" id="uPwd"
						value="${users.userPwd}" />
					</p>

					<p class="birth">
					<h5>生日:${users.userBirth}</h5>
					<input type="date" name="userBirth" value="${users.userBirth}" />
					</p>
					<h5>邮箱</h5>
					<p class="email">

						<input type="text" name="userEmail" id="uEmail"
							value="${users.userEmail }" />
					</p>
					<h5>手机号</h5>
					<p class="phone">

						<input type="text" name="userPhone" id="Uphone"
							value="${users.userPhone}" />
					</p>
					<h5>住址</h5>
					<p class="email">
						<SELECT name="userAddress" id="to_cn"
							onchange="set_city(this, document.getElementById('city')); WYL();"
							class=login_text_input>

							<option value=0>请选择</option>

							<option value=台湾>台湾</option>

							<option value=马来西亚>马来西亚</option>

							<option value=北京>北京</option>

							<option value=上海>上海</option>

							<option value=天津>天津</option>

							<option value=重庆>重庆</option>

							<option value=河北省>河北省</option>

							<option value=山西省>山西省</option>

							<option value=辽宁省>辽宁省</option>

							<option value=吉林省>吉林省</option>

							<option value=黑龙江省>黑龙江省</option>

							<option value=江苏省>江苏省</option>

							<option value=浙江省>浙江省</option>

							<option value=安徽省>安徽省</option>

							<option value=福建省>福建省</option>

							<option value=江西省>江西省</option>

							<option value=山东省>山东省</option>

							<option value=河南省>河南省</option>

							<option value=湖北省>湖北省</option>

							<option value=湖南省>湖南省</option>

							<option value=广东省>广东省</option>

							<option value=海南省>海南省</option>

							<option value=四川省>四川省</option>

							<option value=贵州省>贵州省</option>

							<option value=云南省>云南省</option>

							<option value=陕西省>陕西省</option>

							<option value=甘肃省>甘肃省</option>

							<option value=青海省>青海省</option>

							<option value=内蒙古>内蒙古</option>

							<option value=广西>广西</option>

							<option value=西藏>西藏</option>

							<option value=宁夏>宁夏</option>

							<option value=新疆>新疆</option>

							<option value=香港>香港</option>

							<option value=澳门>澳门</option>
						</SELECT> <select id="city" class=login_text_input name="userAddress">

							<option value=0>请选择</option>

						</select>市
					<h5>具体地址填写</h5>
					<input type="text" name="userAddress" value="${users.userAddress}" />
					</p>

					<p class="tijiao">
						<button type="button" class="btn btn-info btn-sm"
							onclick="check()">确认修改</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="reset" class="btn btn-info btn-sm">重置信息</button>
					</p>
				</form>
			</div>
			<script type="text/javascript">
				function check() {
					var uemail = $("#uEmail").val();
					var uphone = $("#Uphone").val();
					var upwd = $("#uPwd").val();
					if (upwd.length < 6) {
						alert("密码需要输入大于6位");
						return false;
					}
					if (!(/^1[34578]\d{9}$/.test(uphone))) {
						alert("手机号码有误，请重填");
						return false;

					}
					if (!(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/
							.test(uemail))) {
						alert("邮箱不符合规范");
						return false;
					} else {
						alert("您已经修改信息");
						return document.getElementById("formid").submit();
					}

				}
			</script>
			<div class="col-md-1"></div>

			<br>
		</div>

		<br>
	</div>


</body>
</html>

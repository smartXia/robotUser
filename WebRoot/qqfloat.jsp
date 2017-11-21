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

<title>My JSP 'qqfloat.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
#divStayTopleft {
	position: fixed;
	bottom: 100px;
	left: 90%;
	width: 100%;
}
img {
	border-radius:0px;
}
</style>
</HEAD>

<BODY>
	<DIV id=divStay>
		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
			<TBODY>
				<TR>
					<TD vAlign=top width="7%"></TD>
				</TR>
			</TBODY>
		</TABLE>
	</DIV>
	<SCRIPT language=javascript>
			function picsize(obj, MaxWidth) {
				img = new Image();
				img.src = obj.src;
				if(img.width > MaxWidth) {
					return MaxWidth;
				} else {
					return img.width;
				}
			}

			function CloseQQ() {
				divStayTopleft.style.display = "none";
				return true;
			}
			var online = new Array();
		</SCRIPT>
	<div></div>
	<DIV id=divStayTopleft>
		<TABLE cellSpacing=0 cellPadding=0 width=109 border=0>
			<TBODY>
				<TR>
					<TD colSpan=3><A onclick=CloseQQ() href="javascript:;"
						shape=circle coords=91,16,12> <IMG height=34
							src="index_files/qq_top.gif" width=109 useMap=#Map border=0>
					</A>
					</TD>
				</TR>
				<TR>
					<TD width=6><IMG height=100 src="index_files/qq_life.gif"
						width=6>
					</TD>
					<TD vAlign=top width=96 background="">
						<TABLE cellSpacing=0 cellPadding=0 width=90 align=center border=0>
							<TBODY>
								<TR>
									<TD height=30>
										<TABLE cellSpacing=0 cellPadding=0 width=90 border=0>
											<TBODY>
												<TR>
													<TD><IMG height=13 src="index_files/qq_ico1.gif"
														width=16> <SPAN class=font_12> <SPAN
															style="FONT-SIZE: 9pt">客户服务</SPAN> </SPAN>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
								<TR>
									<TD>
										<TABLE id=table47 cellPadding=2 width="100%" border=0>
											<TBODY>
												<TR>
													<TD vAlign=top width=15 height=23><IMG height=16
														src="index_files/qq_v01.gif" width=16 border=0>
													</TD>
													<TD vAlign=bottom><SCRIPT>
																document.write("<a target=blank href=tencent://message/?uin=1076943382&Site=机器人之家客服&Menu=yes><img border=0 SRC=http://wpa.qq.com/pa?p=1:1076943382:10 alt=[客服1]></a>");
															</SCRIPT>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
								<TR>
									<TD></TD>
								</TR>
								<TR>
									<TD>
										<TABLE id=table47 cellPadding=2 width="100%" border=0>
											<TBODY>
												<TR>
													<TD vAlign=top width=15 height=23><IMG height=16
														src="index_files/qq_n01.gif" width=16 border=0>
													</TD>
													<TD vAlign=bottom><SCRIPT>
																document.write("<a target=blank href=tencent://message/?uin=1076943382&Site=机器人之家客服&Menu=yes><img border=0 SRC=http://wpa.qq.com/pa?p=1:1076943382:10 alt=[客服2]></a>");
															</SCRIPT>
													</TD>
												</TR>
											</TBODY>
										</TABLE>
									</TD>
								</TR>
								<TR>
									<TD></TD>
								</TR>
							</TBODY>
						</TABLE>
					</TD>
					<TD width=7><IMG height=100 src="index_files/qq_right.gif"
						width=7>
					</TD>
				</TR>
				<TR>
					<TD colSpan=3><IMG height=30 src="index_files/qq_bottom1.gif"
						width=109>
					</TD>
				</TR>
				<TR>
					<TD colSpan=3><IMG height=33 src="index_files/qq_logo.gif"
						width=109>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</DIV>


</BODY>

</HTML>

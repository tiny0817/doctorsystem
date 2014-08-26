<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<script src="js/jquery-1.9.1.js"></script>

		<title>项目列表</title>
		<%
			String patientId = (String) request.getAttribute("patientId");
			if (patientId == null) {
				patientId = "";
			}
			String result = (String) request.getAttribute("result");
			if (result == null) {
				result = "";
			}
		%>

		<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}

.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}

.STYLE6 {
	color: #000000;
	font-size: 12;
}

.STYLE10 {
	color: #000000;
	font-size: 12px;
}

.STYLE19 {
	color: #344b50;
	font-size: 12px;
}

.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}

.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
</style>

		<style type="text/css">
#t {
	margin: 30px 0 0 100px;
}

.cc {
	border: 1px solid #000;
	position: absolute;
	top: 60px;
	left: 180px;
	height: 300px;
	width: 450px;
	display: none;
}

.cc h2 {
	display: block;
	width: 270px;
	font-size: 12px;
	float: left;
	text-align: center;
}

.cc span {
	display: block;
	width: 20px;
	height: 20px;
	font-size: 18px;
	float: right;
	border: 1px solid #F00;
	background: #999;
	text-align: center;
}
</style>


<script type="text/javascript">
function judgelength()
{
	if(passwordForm.password.value.length >=16)
	{
		alert("用户密码默认不能大于16位");
		passwordForm.oldPassword.value="";
		return false;
	}
	if(passwordForm.newPassword.value.length >=16)
	{
		alert("用户密码默认不能大于16位");
		passwordForm.newPassword.value="";
		return false;
	}
	if(passwordForm.newPassword1.value.length >=16)
	{
		alert("用户密码默认不能大于16位");
		passwordForm.newPassword1.value="";
		return false;
	}

}

function samepassword(form)
{
		//alert("OK");
		if(form.password.value=="")
		{
			alert("旧密码不能为空");
			form.password.focus();
			return false;
		}
		if(form.newPassword.value=="")
		{
			alert("新密碼不能为空");
			form.newPassword.focus();
			return false;
		}
		if(form.newPassword1.value=="")
		{
			alert("新密碼不能为空");
			form.newPassword1.focus();
			return false;
		}
		if(form.newPassword1.value  != form.newPassword.value)
		{
			alert("两次密码不一样");
			form.newPassword1.value="";
			form.newPassword.value="";
			form.newPassword.focus();
			return false;
		}
		return true;
}

window.onload=function(){
	//	alert("11");
		setTimeout(function(){
	//	alert("Hello world");
		document.getElementById("result").innerHTML = "";
		},3000);
	}
</script>




	</head>
	<body>
		<s:set name="orderBy" value="#request.orderBy"></s:set>
		<s:set name="ascend" value="#request.ascend"></s:set>
		<s:hidden name="orderBy" id="orderBy" value="%{#orderBy}"></s:hidden>
		<s:hidden name="ascend" id="ascend" value="%{#ascend}"></s:hidden>
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="30">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="24" bgcolor="#353c44">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="6%" height="19" valign="bottom">
														<div align="center">
															<img src="images/tb.gif" width="14" height="14" />
														</div>
													</td>
													<td width="94%" valign="bottom">
														<span class="STYLE1"> 修改密码</span>
													</td>
												</tr>
											</table>
										</td>

										<td>
											<div align="right">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</div>
										</td>

									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="600" valign="top">
					<form action="ModifyPassword.action" method="post"
						name="passwordForm">
						<table align="center" width="100%">
							
							<tr>
								<td align="right">
									当前密码*：
								</td>
								<td>
									<input type="password" name="password"
										onchange="return judgelength();" />
								</td>
							</tr>
							<tr>
								<td align="right">
									新密码*：
								</td>
								<td>
									<input type="password" name="newPassword"
										onchange="return judgelength();" />
								</td>
							</tr>
							<tr>
								<td align="right">
									新密码*：
								</td>
								<td>
									<input type="password" name="newPassword1"
										onchange="return judgelength();" />
									<br />
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" name="sure" value="确   认" class="button5"
										onclick="return samepassword(passwordForm)" />
									&nbsp;&nbsp;
									<input type="reset" name="cancel" value="重   置" class="button5" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>

							<%
								String tip = (String) request.getAttribute("result");
								if (tip != null) {
							%>
							<tr>
								<td colspan=2 align="center"><div id="result"><%=tip%></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>
							<%
								}
							%>


						</table>
					</form>


				</td>
			</tr>

			<tr>
				<td>
					<div class="cc">
						<div id="name">
							hello
						</div>
						<span>X</span>
						<div id="content" name="content">
							what
						</div>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>

<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/easy_validator.pack.js"></script>
<script type="text/javascript" src="js/jquery.bgiframe.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/validate.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/js.js"></script>
<%
	String str = (String) request.getAttribute("tip");
	if(str==null)
		str ="";
%>
<script type="text/javascript">
function tip()
{
	var s = "<%=str%>";
		if (s != "null") {
			$("#tip").show();
		} else {
			$("#tip").hidden();
		}
	}
</script>

</head>
<body onload="tip()">
	<div id="top"></div>
	<form id="login" name="login" action="LoginIn.action" method="post">
		<div id="center">
			<div id="center_left"></div>
			<div id="center_middle">
				<div class="user">
					<label>用户名<input type="text" name="username" id="user"
						reg='[^\\0]+' tip="不能为空" /> </label>
				</div>
				<div class="user">
					<label>密    码    <input type="password" name="password" id="pwd"
						reg='[^\\0]+' tip="不能为空" /> </label>
				</div>
		<!-- 
				<div class="chknumber">
					<label>验证码<input name="verificationCode" type="text"
						id="chknumber" maxlength="4" class="chknumber_input" reg='[^\\0]+'
						tip="不能为空" /> </label> <img src="verificationCodeGenerate.action"
						id="safecode" />
				</div>
				<div class="chknumber">
					<label><input name="keepLogin" type="checkbox"
						id="checkbox" maxlength="4" class="chknumber_input" /> 7天免登陆</label>
				</div>
		 		
				<div class="chknumber" id="tip">
					<label><%=str%> </label>
				</div>
			-->	
			</div>
			<div id="center_middle_right"></div>
			<div id="center_submit">
				<div class="button">
					<img src="images/dl.gif" width="57" height="20"
						onclick="form_submit()" >
				
				<!-- 	<input type="submit" name="submit" value="提交 " height="20"
						id="submit" />
				 -->
				</div>
				<div class="button">
					<img src="images/cz.gif" width="57" height="20"
						onclick="form_reset()">
				</div>
			</div>
			<div id="center_right"></div>
		</div>
	</form>
	<div id="footer"></div>
</body>
</html>

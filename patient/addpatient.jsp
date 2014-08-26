<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String path = request.getContextPath();
String basePase = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="../js/NewTime.js" charset="gb2312"></script>
<script type="text/javascript" src="../js/jeuery-1.9.1.js" ></script>

<title></title>
<script type="text/javascript">
	function isValid()
	{
	//alert("hello");
		if(patientAddForm.homeAddr.value == "" ||
			patientAddForm.idCard.value == "" ||
			patientAddForm.phoneNum.value == "" ||
			patientAddForm.name.value == "" ||
			patientAddForm.age.value == ""
			)
		{
			alert("必填项不能为空，请检查一下必填项是否已经填好");
			return false;
		}
		
	//	var age = patientAddForm.age;
	//	alert(age);
	//	if(isNaN(patientAddForm.age)
	//	{
		//	alert("患者年龄输入不正确");
		//	return false;
		//}
		
		//alert('验证通过');
		return true;
		//	var temp = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
		//	var mac = $('#termialMac').attr('value');
			
		//	if (!temp.test(mac)) 
		//	{
		//		alert("请输入正确的终端MAC地址");
    	//		return false;
		//	}
		//	return true;
	}
	
	window.onload=function(){
	//	alert("11");
		setTimeout(function(){
	//	alert("Hello world");
		document.getElementById("result").innerHTML = "";
		},3000);
	}
</script>


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
</head>
<body>
	
	<table width="100%" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="30"><table width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td height="24" bgcolor="#353c44"><table width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td colspan="2"><table width="100%" border="0" cellspacing="0"
											cellpadding="0" >
											<tr>
												<td width="6%" height="19" valign="bottom"><div
														align="center">
														<img src="../images/tb.gif" width="14" height="14" />
													</div>
												</td>
												<td width="94%" valign="bottom"><span class="STYLE1">
														患者添加</span>
												</td>
											</tr>
										</table>
									</td>
									
									<td><div align="right">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
			
		<form action="AddPatient.action" method="post"  id="patientAddForm">  		
			
			<table width="100%" border="0" cellpadding="0"
					cellspacing="1" bgcolor="#a8c7ce" height="70%">
	<tr>
		<td  align="right" >姓名：</td>
		<td ><input type="text" name="name" id="name" value="" /> *</td>

		<td  align="right">性别：</td>
		<td >
			<select name="sex">
				<option value="A" >男</option>
				<option value="A" >女</option>
			</select>
		</td>
	</tr>
	<tr>
		<td  align="right">年龄：</td>
		<td ><input type="text" name="age" id="age" value="" /> *</td>

		<td  align="right">民族：</td>
		<td ><input type="text" name="nation" value="" /></td>
	</tr>
	<tr>
		<td align="right">婚状：</td>
		<td >
			<select name="isMarried" >
				<option value="未婚" >未婚</option>
				<option value="已婚" >已婚</option>
			</select>
		</td>

		<td  align="right">职业：</td>
		<td ><input type="text" name="job" value="" /></td>
	</tr>
		<tr>
		<td align="right">出生地：</td>
		<td ><input type="text" name="birPlace" value="" /></td>

		<td align="right">出生年月：</td>
		<td >
			<input  id="birthday" value="" type="text" name="birthday" size="20" onclick="setday(this)" readonly/>
		
	</tr>
		<tr>
		<td  align="right">身份证：</td>
		<td ><input type="text" name="idCard" id="idCard" value="" /> *</td>

		<td align="right">联系方式：</td>
		<td >
			<input type="text" name="phoneNum" id="phoneNum" value="" /> *
		</td>
		
	</tr>
		<tr>
		<td  align="right">联系人：</td>
		<td ><input type="text" name="linkName" value="" /></td>

		<td align="right">联系人电话：</td>
		<td ><input type="text" name="linkPhone" value="" /></td>
	</tr>
	
	
		<tr>
		<td  align="right">单位名称：</td>
		<td>
			<input type="text" name="company" value="" />
		</td>
		
		<td align="right">发病季节</td>
		<td >
			<select name="season">
				<option value="春季" >春季</option>
				<option value="夏季" >夏季</option>
				<option value="秋季" >秋季</option>
				<option value="冬季" >冬季</option>
			</select>
		</td>
	</tr>
	
	<tr>
		<td align="right">家庭住址：</td>
		<td colspan="3">
			<input type="text" name="homeAddr" id="homeAddr" value="" size="60"/> *
		</td>
		
	</tr>
	<tr>
		<td align="left" colspan="4"></td>
		
			
		
		
	</tr>
	
	<tr>
		<td align="left" colspan="4"><br/></>注意：标注有*的为必填项。</td>
		
			
		
		
	</tr>
	
	
<tr>
<td colspan=4  ></td>
</tr>
	<tr>
		<td colspan=4 align="center" >
		
			<input type="submit" name="add" value="添    加" class="button5" onclick="return isValid();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="reset"  value=" 重   置" class="button5" >
			
		
		</td>
		</tr>
		
	<tr >
		<td colspan=4><div align="center" id="result">
				  	  ${result}
			  	  </div></td>
	</tr>
</table>
</form>

	</td>
		</tr>
		
	</table>
</body>
</html>
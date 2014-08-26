<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="../js/jquery-1.9.1.js"></script>

<title>项目列表</title>
<%
	String patientId = (String)request.getAttribute("patientId");
	if(patientId == null)
	{
		patientId = "";
	}
	String result = (String)request.getAttribute("result");
	if(result == null)
	{
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
#t{ margin:30px 0 0 100px;}
.cc {
	border:1px solid #000;
	position:absolute;
	top:60px;
	left:180px;
	height: 300px;
	width: 450px;
	display:none;
}
.cc h2{ display:block; width:270px; font-size:12px; float:left; text-align:center;}
.cc span{ display:block; width:20px; height:20px; font-size:18px; float:right; border:1px solid #F00; background:#999; text-align:center;}
</style>

<script language="javascript">
$(function(){
	var _move=false;//移动标记
	var _x,_y;//鼠标离控件左上角的相对位置
//	$('#t').click(
//		function(){
//		$('.cc').fadeIn('slow');
//			});
	$('.cc span').click(function(){
			$('.cc').hide('fast');
			})
	$('.cc').mousedown(function(e){
		_move=true;
        _x=e.pageX-parseInt($(".cc").css("left"));
        _y=e.pageY-parseInt($(".cc").css("top"));
        $(".cc").fadeTo(20, 0.5).css('cursor','move');//点击后开始拖动并透明显示
		});
	 $('.cc').mousemove(function(e){
        if(_move){
            var x=e.pageX-_x;//移动时根据鼠标位置计算控件左上角的绝对位置
            var y=e.pageY-_y;
            $(".cc").css({top:y,left:x});//控件新位置
        }
    }).mouseup(function(){
    _move=false;
    $(".cc").fadeTo("fast", 1).css('cursor','auto');//松开鼠标后停止移动并恢复成不透明
  });
	});
</script>

<script type="text/javascript">

function callbackgetentryinfo(data)
{	
	var name = data.name;
//	alert(name);
	var content = data.content;
//	alert(content);
//	var result = data.name;
//	alert(result);
	$("#name").html(name);
	$("#content").html(content);	
//	alert("end");
	$('.cc').fadeIn('slow');
}
function getentryinfo(entryrandkey)
{
//	alert("ok");
	//alert(entryrandkey);
	var url = 'GetEntryLeafInfo.action';
	var params = {
		randkey:entryrandkey,
	};
	//alert(entryrandkey);
	jQuery.post(url, params, callbackgetentryinfo, 'json');
//	alert("ok");
	//alert(entryrandkey);
}

window.onload=function()
{
	//alert("start");
	if(document.getElementById("pageStatus").value == "")
	{
		document.getElementById("dieaseType").style.display= "none"
	}else{
		document.getElementById("dieaseType").style.display= "block"
	}
}
</script>

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
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td width="6%" height="19" valign="bottom"><div
														align="center">
														<img src="../images/tb.gif" width="14" height="14" />
													</div>
												</td>
												<td width="94%" valign="bottom"><span class="STYLE1">
														胃癌手术</span>
												</td>
											</tr>
										</table>
									</td>
									
									<td><div align="right">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
			<form action="VerifyPatientWASS.action" method="post"  id="VerifyPatientForm"> 	
			<table width="100%" border="0" cellpadding="0"
					cellspacing="1" bgcolor="#a8c7ce" height="20%">
	<tr align="left">
 


		<td  align="left">患者身份证：<input type="text" name="idCard"  value="" />
		&nbsp;&nbsp;
			<input type="submit" name="Verify" value=" 验证用户是否已经注册" class="button5">
			&nbsp;&nbsp;<%=result%>
		</td>
	 	
		
		
	</tr>
	</table>
	
	</form>
	<div id="dieaseType" style="display:none">
	<table width="100%" border="0" cellpadding="0"
					cellspacing="1" bgcolor="#a8c7ce" height="70%">
	<tr>
		<td  align="left" colspan="4">病症类型：</td>	
	</tr>
		
	<tr>
		<td align="center" colspan="2">
			<div align="center">
			<input name="submit" style="border:0px"
		 	 type="image" onclick="getentryinfo('110')" src="../images/add.gif"/>
	

			<a href="GetWASSStruct.action?firstNodeNum=529&secondNodeNum=530&patientId=<%=patientId%>">术前护理</a> &nbsp;
			</div>
		</td>
		<td align="center" colspan="2">
			<div align="center">
			<input name="submit" style="border:0px"
		 	 type="image" onclick="getentryinfo('120')" src="../images/add.gif"/>
			<a href="GetWASSStruct.action?firstNodeNum=529&secondNodeNum=531&patientId=<%=patientId%>">术后护理</a> &nbsp;
			</div>
		</td>
		
	</tr>
	
	
	
	
<tr>
<td colspan=4  ></td>
</tr>
	<tr>
		<td colspan=4 align="center" >
		
			
			
		
		</td>
		</tr>
	<tr>
	</tr>
</table>
</div>
	</td>
		</tr>
		
		<tr>
		<td><div class="cc" ><div id="name">hello</div><span>X</span>
		<div id="content" name="content">what</div>
	</div></td>
		</tr>
		<tr>
			<td>
			<input type="hidden" name="pageStatus" id="pageStatus" value="<%=patientId%>"/>
			</td>
		</tr>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
String path = request.getContextPath();
String webRoot = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
if(webRoot == null)
	webRoot = "";
 %>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>项目列表</title>
		<script type="text/javascript">
	function skipTo() {
		var input = document.getElementById("textfield");
		var currentPage = input.value;
		//alert(currentPage);
		if (isNaN(currentPage)) {
			alert("请输入数字！");
			return;
		}
		currentPage = currentPage - 1;
		var orderBy = document.getElementById("orderBy");
		var ascend = document.getElementById("ascend");
		var link = "listProject.action?currentPage=" + currentPage
				+ "&orderBy=" + orderBy.value + "&ascend=" + ascend;
		//alert(link);
		window.location.href = link;
	}
	function queryClick() {
	//alert(currentPage);
		document.queryForm.action = "QueryDiseaseDesAction.action";
		document.queryForm.submit();
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
															<img src="../images/tb.gif" width="14" height="14" />
														</div>
													</td>
													<td width="94%" valign="bottom">
														<span class="STYLE1">智能判辨问诊</span>
													</td>
												</tr>
											</table>
										</td>
										<td>
											<div align="right">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
				<td>
					<table width="100%" border="0" cellpadding="0" cellspacing="1"
						bgcolor="#a8c7ce">
						
						<!--查询行 -->
						<form name="queryForm" method="post">
							<tr>
								<td width="15%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">查询条件</span>
									</div>
								</td>
								<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">症状：</span>
									
									<span class="STYLE10"><input type="text"
												name="diseaseDes"
												value='${diseaseDes}'> </span>
									</div>
								</td>
								
								
								<td width="80%" height="20" colspan="1" color="d3eaef" class="STYLE6">
									<div align="left">
										<span class="STYLE10"> <input type="button" value="查询"
												onclick="queryClick();"></span>
									</div>
								</td>
								
							
							</tr>
						</form>
						
						<tr>
							<th>一级类别</th>
							<th>二级类别</th>
							<th align="left">伴随其他症状</th>
							
						</tr>
						
						<s:iterator value="#request.pageDiseases" var="pageDisease">
						<tr align="center">
							
							<td align="center">${pageDisease.firstNode.name}</td>
							<td align="center">${pageDisease.secondNode.name}</td>
							<td align="left">
							<s:iterator value="#pageDisease.diseases" var="disease">
								${disease.name}
							</s:iterator>
							
							</td>
							
							
						</tr>
						</s:iterator>
						
					
						
						
						
						
					</table>
				</td>
			</tr>
			
		</table>
	</body>
</html>
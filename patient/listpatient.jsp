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
		<script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="../js/easy_validator.pack.js"></script>
		<script type="text/javascript" src="../js/jquery.bgiframe.min.js"></script>
		<script type="text/javascript" src="../js/NewTime.js" charset="gb2312"></script>
		<link href="../css/validate.css" rel="stylesheet" type="text/css" />
		
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
	function queryClick(currentPage) {
	
	
	
		if(queryForm.patientName.value == "" && 
			queryForm.idCard.value=="")
			{
				alert("患者姓名和患者身份证至少有一个不能为空");
				return false;
			}
		
		document.queryForm.action = "QueryPatientRecordAction.action?currentPage="+currentPage;
		document.queryForm.submit();
		return true;
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
														<span class="STYLE1">患者查询</span>
													</td>
												</tr>
											</table>
										</td>
										<td>
											<div align="right">
												<span class="STYLE1"> <img src="../images/add.gif"
														width="10" height="10" /><a href="addpatient.jsp">
														添加</a> &nbsp;</span><span class="STYLE1"> &nbsp;</span>
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
						<form name="queryForm" method="post" id="queryForm">
							<tr>
								<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="left">
										<span class="STYLE10">查询条件</span>
									</div>
								</td>
								<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">姓名：*</span>
									
									<span class="STYLE10"><input type="text"
												name="patientName" id="patientName"
												value='${patientName}'></span>
									</div>
								</td>
								
								
								<td width="25%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">身份证号：*</span>
										<span class="STYLE10"><input type="text"
												name="idCard" id="idCard"
												value='${idCard}'> </span>
									</div>
								</td>
								
								<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">住院号：</span>
										<span class="STYLE10"><input type="text"
												name="recordNum"
												value='${recordNum}'> </span>
									</div>
								</td>
								
								<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">日期：</span>
										<span class="STYLE10">
										<input  id="recordDate" value='${recordDate}' type="text" name="recordDate" size="20" onclick="setday(this)" readonly/>
										 </span>
									</div>
								</td>
								
								
								
								<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10"> <input type="button" value="查询"
												onclick="queryClick('0');"></span>
									</div>
								</td>
							</tr>
						</form>
						
						<tr>
							<td abbr="left" colspan="4">注意：患者姓名和患者身份证号至少输入一个。</td>
							
						</tr>
						
						<tr>
							<th>姓名</th>
							<th>身份证号</th>
							<th>日期</th>
							<th>住院号</th>
							<th>症状类型</th>
							<th>操作</th>
						</tr>
						
						<s:iterator value="#request.pageRecords" var="pageRecord">
						<tr align="center">
							
							<td>${pageRecord.patientName}</td>
							<td>${pageRecord.idCard}</td>
							<td>${pageRecord.recordDate}</td>
							<td>${pageRecord.recordNum}</td>
							<td>${pageRecord.recordDes}</td>
							<td><a href="<%=webRoot+"/content/"%>${pageRecord.recordUrl}">病历</a></td>
							
						</tr>
						</s:iterator>
						
						<tr align="center">
				  	<td colspan="6" >
				  		共${page.totalCount}条纪录，当前第${page.currentPage}/${page.totalPage}页，每页${page.everyPage}条纪录
				  	<s:if test="#request.page.hasPrePage">
                		<a href="javascript:queryClick('0')">首页</a> | 
                		<a href="javascript:queryClick('${page.currentPage - 1}')">上一页</a> | 
               		</s:if>
               		<s:else>
               		首页 | 上一页 | 
               		</s:else>
               		<s:if test="#request.page.hasNextPage">
                		<a href="javascript:queryClick('${page.currentPage + 1}')">下一页</a> | 
                		<a href="javascript:queryClick('${page.totalPage-1}')">尾页</a>
               		</s:if>
               		<s:else>
               		下一页 | 尾页
               		</s:else>
				  	</td>
				  </tr>	
						
						
						
						
					</table>
				</td>
			</tr>
			
		</table>
	</body>
</html>
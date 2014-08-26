<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" 
import="yl.hzc.util.*,yl.hzc.po.*,java.util.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%


	EntryStruct third_0 = null;
	
	EntryStruct third_1 = null;
	EntryStruct third_1_1 = null;
	List<EntryStruct> third_1_1_elements = null;
	
	EntryStruct third_1_2 = null;
	List<EntryStruct> third_1_2_elements = null;
	
	EntryStruct third_2 = null;
	List<EntryStruct> third_2_elements = null;
	EntryStruct third_3 = null;
	List<EntryStruct> third_3_elements = null;  
	JCYEntryStructElement jcyEntryStructs = (JCYEntryStructElement)request.getAttribute("jcyEntryStructs");
	
	String idCard = (String)request.getAttribute("idCard");
	String firstNodeNum = (String)request.getAttribute("firstNodeNum");
	String secondNodeNum = (String)request.getAttribute("secondNodeNum");
	String patientId = (String)request.getAttribute("patientId");
	System.out.println("page patientId "+patientId);
	if(jcyEntryStructs != null)
	{
	
		 third_0 = jcyEntryStructs.getThird_0();
		
		 third_1 = jcyEntryStructs.getThird_1();
		 third_1_1 = jcyEntryStructs.getThird_1_1();
		 third_1_1_elements = jcyEntryStructs.getThird_1_1_elements();
		
		 third_1_2 = jcyEntryStructs.getThird_1_2();
		 third_1_2_elements = jcyEntryStructs.getThird_1_2_elements();
		
		 third_2 = jcyEntryStructs.getThird_2();
		 third_2_elements = jcyEntryStructs.getThird_2_elements();
		 third_3 = jcyEntryStructs.getThird_3();
		 third_3_elements = jcyEntryStructs.getThird_3_elements();
	}else{
		System.out.println("数据异常");
	}
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">



<title>项目列表</title>
	<link rel="stylesheet" href="../css/jquery-ui.css" />
	<script src="../js/jquery-1.9.1.js"></script>
	<script src="../js/jquery-ui.js"></script>
<!-- 	<link rel="stylesheet" href="../css/style.css" />
	 -->
	<script>
	$(function() {
		$( "#tabs" ).tabs();
	});
	</script>

<style type="text/css">
body {
	font-family: "Trebuchet MS", "Helvetica", "Arial",  "Verdana", "sans-serif";
	font-size: 80.5%;
}
</style>

<style type="text/css">
/* 收缩展开效果 */
.text{line-height:22px;padding:0 6px;color:#666;}
.box h1{padding-left:10px;height:22px;line-height:22px;background:#f1f1f1;font-weight:bold;}
.box{position:relative;border:1px solid #e7e7e7;}
h1{font-size:16px;}
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

<script type="text/javascript">
// 收缩展开效果
$(document).ready(function(){
	$("div.text").hide();//默认隐藏div，或者在样式表中添加.text{display:none}，推荐使用后者
	$(".box h1").click(function(){
		$(this).next(".text").slideToggle("slow");
	})
});
</script>


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
	//alert(entryrandkey);
}




function callbackFunVideoType1(data)
{
	//alert("callback....");
	//alert(data);	
	var result = data.jsonResult;
	alert(result);
//	var result = $.parseJSON(data.jsonResult);
	
//	alert(result);	
	/*			
	for(var i=0 ; i<videotypes.list.length; i++)
		{
				result += "<option value="+videotypes.list[i].videoTypeID+">"+videotypes.list[i].videoTypeName+"</option>"	
			}	
			$("#videoType2").html(result);
						
		}
	*/	 

}

function chk(){   
 
 var obj = document.getElementsByName("checkboxall");  //选择所有name="'test'"的对象，返回数组    
  //取到对象数组后，我们来循环检测它是不是被选中
  var s='';    
  for(var i=0; i<obj.length; i++){    
    
    if(obj[i].checked)
    {
    	s+=obj[i].value+',';  //如果选中，将value添加到变量s中    
  	}
  }    
  //那么现在来检测s的值就知道选中的复选框的值了    
//  alert(s==''?'你还没有选择任何内容！':s); 
   if(s!='')
  {
  
  	//动态执行ajax递交表单，后端执行将信息存入数据库中，并且生成电子病历
  	var url = 'AddPatientRecord.action';
	var params = {
		patientId:"<%=patientId%>",
		firstNodeNum:"<%=firstNodeNum%>",
		checkboxAllSelected:s,
		secondNodeNum:"<%=secondNodeNum%>",
		
	};
	
	jQuery.post(url, params, callbackFunVideoType1, 'json');
  	
  }
  
     
}    

    
function jqchk(){  //jquery获取复选框值    
  var chk_value =[];    
  $('input[id="checkboxall"]:checked').each(function(){    
   chk_value.push($(this).val());    
  });    
  alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value); 
   
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
														就诊保健</span>
												</td>
											</tr>
										</table>
									</td>
									
									<td><div align="right">
											<span class="STYLE1"> <img src="../images/add.gif"
												width="10" height="10" /><a href="SaveProject.jsp">
													添加</a>> &nbsp;</span><span class="STYLE1"> &nbsp;</span>
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
			
<div id="tabs">
	<ul>
		<li><a href="#tabs-1">临证施护方案</a></li>
		<li><a href="#tabs-2">辨证施膳处方</a></li>
		<li><a href="#tabs-3">健康教育处方</a></li>
	</ul>
	<div id="tabs-1">
		<div class="box">
		
			<h1>症状评估及护理 </h1>
				<div class="text">
				<%
					for (EntryStruct node : third_1_1_elements) {
						%>
			<input type='checkbox' name='checkboxall' value='<%=node.getRandkey()%>' /> <%=node.getName()%>
						
			
		 <input name="submit" style="border:0px"
		 	 type="image" onclick="getentryinfo('<%=node.getRandkey()%>')" src="../images/add.gif"/><br/>
	
						
						
						<%
						
					}
				 %>
				       
				 </div>     
      		<h1>一般护理 </h1>
			<div class="text">
				<%
					for (EntryStruct node : third_1_2_elements) {
						%>
							<input type='checkbox' name='checkboxall' value='<%=node.getRandkey()%>' /> <%=node.getName()%>
						
		 <input name="submit" style="border:0px"
		 	 type="image" onclick="getentryinfo('<%=node.getRandkey()%>')" src="../images/add.gif"/><br/>
	
						<%
						
					}
				 %>
			   	
			</div>
		</div>
		
		<br />
	</div>
	
	<div id="tabs-2">
		<div class="box">
			<h1>辨证施膳处方 </h1>
			<div class="text">
			<%
					for (EntryStruct node : third_2_elements) {
						%>
							<input type='checkbox' name='checkboxall' value='<%=node.getRandkey()%>' /> <%=node.getName()%>
						
		 <input name="submit" style="border:0px"
		 	 type="image" onclick="getentryinfo('<%=node.getRandkey()%>')" src="../images/add.gif"/><br/>
	
						<%
						
					}
				 %>
			     
			</div>
		</div>
	</div>
	
	<div id="tabs-3">
			<div class="box">
			<h1>健康教育处方 </h1>
			<div class="text">
			<%
					for (EntryStruct node : third_3_elements) {
						%>
							<input type='checkbox' name='checkboxall' value='<%=node.getRandkey()%>' /> <%=node.getName()%>
						
		 <input name="submit" style="border:0px"
		 	 type="image" onclick="getentryinfo('<%=node.getRandkey()%>')" src="../images/add.gif"/><br/>
	
						<%
						
					}
				 %>
			  
			</div>
			</div>
	</div>
	
	<div>
		<input type="button" name="add" value="添    加" class="button5" onclick="return chk();">
	</div>
	
	<div class="cc" ><div id="name">hello</div><span>X</span>
		<div id="content" name="content">what</div>
	</div>
	
	
	
</div>
			
		
	</td>
		</tr>
	</table>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>


<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<TITLE>修改试卷信息</TITLE>
	    
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>
       
	</head>
<%
  String id="";
 
   %>
<script language="javascript">

function gows()
{
	document.location.href="shijuanxinxi_add.jsp?id=<%=id%>";
}
function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"；", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"；";
	}
}
</script>
	<body>
			<form action="updateShijuanxinxi.do" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1"  style="border-collapse:collapse" bgcolor="#F2FDFF">
						<tr bgcolor="#E7E7E7">
							<td height="20" colspan="2" background="images/table_header.gif">修改试卷信息<input type="hidden" name="id" value="${shijuanxinxi.id}" /></td>
						</tr>
						<tr ><td width="200">试卷编号：</td><td><input name='shijuanbianhao' type='text' id='shijuanbianhao' value='' onblur='hsgcheck()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelshijuanbianhao' /></td></tr>		<tr ><td width="200">课程：</td><td><select name='kecheng' id='kecheng' style=' height:19px; border:solid 1px #000000; color:#666666'><%=connDbBean.hsggetoption("kechengxinxi","kecheng")%></select>&nbsp;*<label id='clabelkecheng' /></td></tr>		<tr ><td width="200">试卷名称：</td><td><input name='shijuanmingcheng' type='text' id='shijuanmingcheng' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelshijuanmingcheng' /></td></tr>		<tr ><td width="200">单选题数：</td><td><input name='danxuantishu' type='text' id='danxuantishu' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr ><td width="200">单选题分值：</td><td><input name='danxuantifenzhi' type='text' id='danxuantifenzhi' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr ><td width="200">单选题：</td><td><input name='danxuanti' type='text' id='danxuanti' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr ><td width="200">多选题数：</td><td><input name='duoxuantishu' type='text' id='duoxuantishu' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr ><td width="200">多选题分值：</td><td><input name='duoxuantifenzhi' type='text' id='duoxuantifenzhi' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr ><td width="200">多选题：</td><td><input name='duoxuanti' type='text' id='duoxuanti' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr 0><td width="200">判断题数：</td><td><input name='panduantishu' type='text' id='panduantishu' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr 1><td width="200">判断题分值：</td><td><input name='panduantifenzhi' type='text' id='panduantifenzhi' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr 2><td width="200">判断题：</td><td><input name='panduanti' type='text' id='panduanti' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr 3><td width="200">填空题数：</td><td><input name='tiankongtishu' type='text' id='tiankongtishu' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr 4><td width="200">填空题分值：</td><td><input name='tiankongtifenzhi' type='text' id='tiankongtifenzhi' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr 5><td width="200">填空题：</td><td><input name='tiankongti' type='text' id='tiankongti' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr 6><td width="200">发布人：</td><td><input name='faburen' type='text' id='faburen' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=(String)request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>		
		
						<tr align='center'   height="22">
						    <td width="25%"  align="right">&nbsp;
						        
						    </td>
						    <td width="75%"  align="left">
						       <input type="submit" name="querenzhuce" id="querenzhuce" value="提交" onClick="return checkform();"/>
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
						<script language="javascript">document.form1.shijuanbianhao.value='${shijuanxinxi.shijuanbianhao}';</script>	<script language="javascript">document.form1.kecheng.value='${shijuanxinxi.kecheng}';</script>	<script language="javascript">document.form1.shijuanmingcheng.value='${shijuanxinxi.shijuanmingcheng}';</script>	<script language="javascript">document.form1.danxuantishu.value='${shijuanxinxi.danxuantishu}';</script>	<script language="javascript">document.form1.danxuantifenzhi.value='${shijuanxinxi.danxuantifenzhi}';</script>	<script language="javascript">document.form1.danxuanti.value='${shijuanxinxi.danxuanti}';</script>	<script language="javascript">document.form1.duoxuantishu.value='${shijuanxinxi.duoxuantishu}';</script>	<script language="javascript">document.form1.duoxuantifenzhi.value='${shijuanxinxi.duoxuantifenzhi}';</script>	<script language="javascript">document.form1.duoxuanti.value='${shijuanxinxi.duoxuanti}';</script>	<script language="javascript">document.form1.panduantishu.value='${shijuanxinxi.panduantishu}';</script>	<script language="javascript">document.form1.panduantifenzhi.value='${shijuanxinxi.panduantifenzhi}';</script>	<script language="javascript">document.form1.panduanti.value='${shijuanxinxi.panduanti}';</script>	<script language="javascript">document.form1.tiankongtishu.value='${shijuanxinxi.tiankongtishu}';</script>	<script language="javascript">document.form1.tiankongtifenzhi.value='${shijuanxinxi.tiankongtifenzhi}';</script>	<script language="javascript">document.form1.tiankongti.value='${shijuanxinxi.tiankongti}';</script>	<script language="javascript">document.form1.faburen.value='${shijuanxinxi.faburen}';</script>	
					 </table>
			</form>
   </body>
</html>






<script language=javascript >  
 
 function checkform(){  
 
	var shijuanbianhaoobj = document.getElementById("shijuanbianhao"); if(shijuanbianhaoobj.value==""){document.getElementById("clabelshijuanbianhao").innerHTML="&nbsp;&nbsp;<font color=red>请输入试卷编号</font>";return false;}else{document.getElementById("clabelshijuanbianhao").innerHTML="  "; } 	var kechengobj = document.getElementById("kecheng"); if(kechengobj.value==""){document.getElementById("clabelkecheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入课程</font>";return false;}else{document.getElementById("clabelkecheng").innerHTML="  "; } 	var shijuanmingchengobj = document.getElementById("shijuanmingcheng"); if(shijuanmingchengobj.value==""){document.getElementById("clabelshijuanmingcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入试卷名称</font>";return false;}else{document.getElementById("clabelshijuanmingcheng").innerHTML="  "; } 	


return true;   
}   
popheight=450;
</script>  

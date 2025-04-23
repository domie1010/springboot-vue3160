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
		<TITLE>修改判断题</TITLE>
	    
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
	document.location.href="panduanti_add.jsp?id=<%=id%>";
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
			<form action="updatePanduanti.do" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1"  style="border-collapse:collapse" bgcolor="#F2FDFF">
						<tr bgcolor="#E7E7E7">
							<td height="20" colspan="2" background="images/table_header.gif">修改判断题<input type="hidden" name="id" value="${panduanti.id}" /></td>
						</tr>
						<tr ><td width="200">试题编号：</td><td><input name='shitibianhao' type='text' id='shitibianhao' value='' onblur='hsgcheck()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelshitibianhao' /></td></tr>		<tr ><td width="200">课程：</td><td><select name='kecheng' id='kecheng' style=' height:19px; border:solid 1px #000000; color:#666666'><%=connDbBean.hsggetoption("kechengxinxi","kecheng")%></select>&nbsp;*<label id='clabelkecheng' /></td></tr>		<tr ><td width="200">题目：</td><td><textarea name='timu' cols='50' rows='5' id='timu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>		<tr ><td width="200">答案：</td><td><select name='daan' id='daan'><option value="对">对</option><option value="错">错</option></select></td></tr>		<tr ><td width="200">解析：</td><td><textarea name='jiexi' cols='50' rows='5' id='jiexi' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>		
		
						<tr align='center'   height="22">
						    <td width="25%"  align="right">&nbsp;
						        
						    </td>
						    <td width="75%"  align="left">
						       <input type="submit" name="querenzhuce" id="querenzhuce" value="提交" onClick="return checkform();"/>
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
						<script language="javascript">document.form1.shitibianhao.value='${panduanti.shitibianhao}';</script>	<script language="javascript">document.form1.kecheng.value='${panduanti.kecheng}';</script>	<script language="javascript">document.form1.timu.value='${panduanti.timu}';</script>	<script language="javascript">document.form1.daan.value='${panduanti.daan}';</script>	<script language="javascript">document.form1.jiexi.value='${panduanti.jiexi}';</script>	
					 </table>
			</form>
   </body>
</html>






<script language=javascript >  
 
 function checkform(){  
 
	var shitibianhaoobj = document.getElementById("shitibianhao"); if(shitibianhaoobj.value==""){document.getElementById("clabelshitibianhao").innerHTML="&nbsp;&nbsp;<font color=red>请输入试题编号</font>";return false;}else{document.getElementById("clabelshitibianhao").innerHTML="  "; } 	var kechengobj = document.getElementById("kecheng"); if(kechengobj.value==""){document.getElementById("clabelkecheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入课程</font>";return false;}else{document.getElementById("clabelkecheng").innerHTML="  "; } 	


return true;   
}   
popheight=450;
</script>  

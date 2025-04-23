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
		<TITLE>添加试卷信息</TITLE>
	    

 	<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>      
	</head>
<%
String sql="";
  String id="";
  ResultSet RS_result;
  int nts=0;
  String danxuantiid="";
  String duoxuantiid="";
  String panduantiid="";
  String tiankongtiid="";
 if(request.getParameter("f")!=null){
	int ndanxuantishu = Integer.parseInt(request.getParameter("danxuantishu"));
	int npanduantishu = Integer.parseInt(request.getParameter("panduantishu"));
	int ntiankongtishu = Integer.parseInt(request.getParameter("tiankongtishu"));
	int nduoxuantishu = Integer.parseInt(request.getParameter("duoxuantishu"));

	
String shijuanbianhao=request.getParameter("shijuanbianhao");
String shijuanmingcheng=request.getParameter("shijuanmingcheng");
String kecheng=request.getParameter("kecheng");
String danxuanti=request.getParameter("danxuantifenzhi");
String panduanti=request.getParameter("panduantifenzhi");
String tiankongti=request.getParameter("tiankongtifenzhi");
String duoxuanti=request.getParameter("duoxuantifenzhi");
String faburen=request.getParameter("faburen");

 sql="select count(id) as ss from danxuanti where kecheng='"+kecheng+"'";

 RS_result=connDbBean.executeQuery(sql);
if(RS_result.next()){
  nts=Integer.parseInt(RS_result.getString("ss"));
}
  if(nts<ndanxuantishu)
{
	out.print("<script>alert('对不起,单选题数不足!');location.href='sy.jsp';</script>");
	return;
}


 sql=  "select count(id) as ss from duoxuanti where kecheng='"+kecheng+"' ";
 RS_result=connDbBean.executeQuery(sql);
if(RS_result.next()){
  nts=Integer.parseInt(RS_result.getString("ss"));
}
  if(nts<nduoxuantishu)
{
	out.print("<script>alert('对不起,多选题数不足!');location.href='sy.jsp';</script>");
	return;
}


 sql=  "select count(id) as ss from panduanti where kecheng='"+kecheng+"' ";
 RS_result=connDbBean.executeQuery(sql);
if(RS_result.next()){
  nts=Integer.parseInt(RS_result.getString("ss"));
}
  if(nts<npanduantishu)
{
	out.print("<script>alert('对不起,判断题数不足!');location.href='sy.jsp';</script>");
	return;
}

 sql=  "select count(id) as ss from tiankongti where kecheng='"+kecheng+"' ";
 RS_result=connDbBean.executeQuery(sql);
if(RS_result.next()){
  nts=Integer.parseInt(RS_result.getString("ss"));
}
  if(nts<ntiankongtishu)
{
	out.print("<script>alert('对不起,填空题数不足!');location.href='sy.jsp';</script>");
	return;
}

sql="select  id from danxuanti where kecheng='"+kecheng+"' order by rand() limit 0," + ndanxuantishu + "";
 RS_result=connDbBean.executeQuery(sql);
 while(RS_result.next()){
danxuantiid=danxuantiid+RS_result.getString("id")+",";
}
danxuantiid=danxuantiid.substring(0,danxuantiid.length()-1);

sql="select  id from duoxuanti where kecheng='"+kecheng+"' order by rand() limit 0,"+nduoxuantishu+"";
 RS_result=connDbBean.executeQuery(sql);
 while(RS_result.next()){
duoxuantiid=duoxuantiid+RS_result.getString("id")+",";
}
duoxuantiid=duoxuantiid.substring(0,duoxuantiid.length()-1);


sql="select  id from tiankongti where kecheng='"+kecheng+"' order by rand() limit 0," + ntiankongtishu + "";
 RS_result=connDbBean.executeQuery(sql);
 while(RS_result.next()){
tiankongtiid=tiankongtiid+RS_result.getString("id")+",";
}
tiankongtiid=tiankongtiid.substring(0,tiankongtiid.length()-1);


sql="select  id from panduanti where kecheng='"+kecheng+"' order by rand() limit 0," + npanduantishu + "";
 RS_result=connDbBean.executeQuery(sql);
 while(RS_result.next()){
panduantiid=panduantiid+RS_result.getString("id")+",";
}
panduantiid=panduantiid.substring(0,panduantiid.length()-1);


sql="insert into shijuanxinxi(shijuanbianhao,kecheng,shijuanmingcheng,danxuantishu,danxuantifenzhi,duoxuantishu,duoxuantifenzhi,panduantishu,panduantifenzhi,tiankongtishu,tiankongtifenzhi,faburen,danxuanti,duoxuanti,tiankongti,panduanti) values('"+shijuanbianhao+"','"+kecheng+"','"+shijuanmingcheng+"','"+ndanxuantishu+"','"+danxuanti+"','"+nduoxuantishu+"','"+duoxuanti+"','"+npanduantishu+"','"+panduanti+"','"+ntiankongtishu+"','"+tiankongti+"','"+faburen+"','"+danxuantiid+"','"+duoxuantiid+"','"+tiankongtiid+"','"+panduantiid+"')";
connDbBean.hsgexecute(sql);
out.print("<script>alert('操作成功!');location.href='sy.jsp';</script>");
	return;

}

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
			<form action="shijuanxinxi_add.jsp?f=f" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1"  style="border-collapse:collapse" bgcolor="#F2FDFF">
						<tr bgcolor="#E7E7E7">
							<td height="20" colspan="2" background="images/table_header.gif">添加试卷信息</td>
						</tr>
						<tr ><td width="200">试卷编号：</td><td><input name='shijuanbianhao' type='text' id='shijuanbianhao' value='' onblur='hsgcheck()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelshijuanbianhao' /></td></tr>
		<tr ><td width="200">课程：</td><td><select name='kecheng' id='kecheng' style=' height:19px; border:solid 1px #000000; color:#666666'><%=connDbBean.hsggetoption("kechengxinxi","kecheng")%></select>&nbsp;*<label id='clabelkecheng' /></td></tr>
		<tr ><td width="200">试卷名称：</td><td><input name='shijuanmingcheng' type='text' id='shijuanmingcheng' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelshijuanmingcheng' /></td></tr>
		<tr ><td width="200">单选题数：</td><td><input name='danxuantishu' type='text' id='danxuantishu' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr ><td width="200">单选题分值：</td><td><input name='danxuantifenzhi' type='text' id='danxuantifenzhi' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr style="display:none"><td width="200">单选题：</td><td><input name='danxuanti' type='text' id='danxuanti' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr ><td width="200">多选题数：</td><td><input name='duoxuantishu' type='text' id='duoxuantishu' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr ><td width="200">多选题分值：</td><td><input name='duoxuantifenzhi' type='text' id='duoxuantifenzhi' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr style="display:none"><td width="200">多选题：</td><td><input name='duoxuanti' type='text' id='duoxuanti' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr ><td width="200">判断题数：</td><td><input name='panduantishu' type='text' id='panduantishu' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr ><td width="200">判断题分值：</td><td><input name='panduantifenzhi' type='text' id='panduantifenzhi' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr style="display:none"><td width="200">判断题：</td><td><input name='panduanti' type='text' id='panduanti' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr ><td width="200">填空题数：</td><td><input name='tiankongtishu' type='text' id='tiankongtishu' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr ><td width="200">填空题分值：</td><td><input name='tiankongtifenzhi' type='text' id='tiankongtifenzhi' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr style="display:none"><td width="200">填空题：</td><td><input name='tiankongti' type='text' id='tiankongti' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr 6><td width="200">发布人：</td><td><input name='faburen' type='text' id='faburen' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=(String)request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		
		
						<tr align='center'   height="22">
						    <td width="25%"  align="right">&nbsp;
						        
						    </td>
						    <td width="75%"  align="left">
						       <input type="submit" name="querenzhuce" id="querenzhuce" value="提交" onClick="return checkform();"/>
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>




<script language=javascript >  
function hsgcheck() {
		var shijuanbianhao = $("#shijuanbianhao").val();
		if(shijuanbianhao==""||(shijuanbianhao.length<6||shijuanbianhao.length>12)){
			 $("#clabelshijuanbianhao").html("<font color=red>试卷编号不能为空且长度在3～12位之间！</font>");
			 $("input[id=shijuanbianhao]").focus();
			 $("#querenzhuce").attr("disabled","disabled");
			 return false;
		} 
		else
		{
			$("#clabelshijuanbianhao").html("");
			$.ajax({
				url : "quchongShijuanxinxi.do",
				type : "post",
				data : "shijuanbianhao=" + shijuanbianhao,
				dataType : "json",
				success:function(result){
				if(result.info=="ng"){
					$("#clabelshijuanbianhao").html("<font color=red>试卷编号已存在，请更换！</font>");
					$("input[id=shijuanbianhao]").focus();
					$("#querenzhuce").attr("disabled","disabled");
					return false;
				}
				else
				{
					$("#querenzhuce").removeAttr("disabled");
				}
				},
				error:function(){
					$("#clabelshijuanbianhao").html("系统异常，请检查错误！");
					$("input[id=shijuanbianhao]").focus();
					$("#querenzhuce").attr("disabled","disabled");
					return false;
				}
			});
		}
	}
</script>


<script language=javascript >  
 
 function checkform(){  
 
	var shijuanbianhaoobj = document.getElementById("shijuanbianhao"); if(shijuanbianhaoobj.value==""){document.getElementById("clabelshijuanbianhao").innerHTML="&nbsp;&nbsp;<font color=red>请输入试卷编号</font>";return false;}else{document.getElementById("clabelshijuanbianhao").innerHTML="  "; } 
	var kechengobj = document.getElementById("kecheng"); if(kechengobj.value==""){document.getElementById("clabelkecheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入课程</font>";return false;}else{document.getElementById("clabelkecheng").innerHTML="  "; } 
	var shijuanmingchengobj = document.getElementById("shijuanmingcheng"); if(shijuanmingchengobj.value==""){document.getElementById("clabelshijuanmingcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入试卷名称</font>";return false;}else{document.getElementById("clabelshijuanmingcheng").innerHTML="  "; } 
	


return true;   
}   
popheight=450;
</script>  

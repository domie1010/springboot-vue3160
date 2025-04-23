<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>


<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<html>
  <head>
    
    
    <title>成绩查看</title>
    <LINK href="css.css" type=text/css 
rel=stylesheet>

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<%
int zts=0;
int xts=0;
String sql="select count(id) as ss from cj";
ResultSet RS_result=connDbBean.executeQuery(sql);
if(RS_result.next()){
zts=Integer.parseInt(RS_result.getString("ss"));
}

%>
<body >
  <p>成绩统计：</p>


<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="5%" bgcolor="#CCFF99">序号</td>
    <td width="9%" bgcolor='#CCFF99'>分数段</td>
    <td width="7%" bgcolor='#CCFF99'>人数</td>
    <td width="79%" bgcolor='#CCFF99'>柱状图</td>
  </tr>

  <tr>
    <td>1</td>
    <td>90-100</td>
    <td><%
	sql="select count(id) as ss from cj where cj>=90 and cj<=100";
						 RS_result=connDbBean.executeQuery(sql);
					if(RS_result.next()){
					xts=Integer.parseInt(RS_result.getString("ss"));
					}
					out.print(xts);
	%></td><td><table width="<%
						
					
				  	if (xts<=0)
					{
						out.print("1");
					}
					else
					{
						out.print(600*xts/zts);
					}
					
				   %>" height="7" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#990000">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td>2</td>
    <td>70-90</td>
    <td><%
	sql="select count(id) as ss from cj where cj>=70 and cj<90";
						 RS_result=connDbBean.executeQuery(sql);
					if(RS_result.next()){
					xts=Integer.parseInt(RS_result.getString("ss"));
					}
					out.print(xts);
	%></td><td><table width="<%
						
					
				  	if (xts<=0)
					{
						out.print("1");
					}
					else
					{
						out.print(600*xts/zts);
					}
					
				   %>" height="7" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#990000">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td>3</td>
    <td>60-70</td>
    <td><%
	sql="select count(id) as ss from cj where cj>=60 and cj<70";
						 RS_result=connDbBean.executeQuery(sql);
					if(RS_result.next()){
					xts=Integer.parseInt(RS_result.getString("ss"));
					}
					out.print(xts);
	%></td><td><table width="<%
						
					
				  	if (xts<=0)
					{
						out.print("1");
					}
					else
					{
						out.print(600*xts/zts);
					}
					
				   %>" height="7" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#990000">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td>4</td>
    <td>60以下</td>
    <td><%
	sql="select count(id) as ss from cj where  cj<60";
						 RS_result=connDbBean.executeQuery(sql);
					if(RS_result.next()){
					xts=Integer.parseInt(RS_result.getString("ss"));
					}
					out.print(xts);
	%></td><td><table width="<%
						
					
				  	if (xts<=0)
					{
						out.print("1");
					}
					else
					{
						out.print(600*xts/zts);
					}
					
				   %>" height="7" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td bgcolor="#990000">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
 
</table>
<br>
</body>
</html>


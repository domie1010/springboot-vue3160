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

<body >
  <p>成绩列表：</p>


<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="5%" bgcolor="#CCFF99">序号</td>
    <td bgcolor='#CCFF99'>用户名</td>
    <td bgcolor='#CCFF99'>试卷编号</td>
    <td bgcolor='#CCFF99'>单选题</td>
    <td bgcolor="#CCFF99">多选题</td>
    <td bgcolor="#CCFF99">填空题</td>
    <td bgcolor="#CCFF99">判断题</td>
    <td bgcolor="#CCFF99">总成绩</td>
    <td bgcolor="#CCFF99">测试时间</td>
  </tr>
  <%
ResultSet RS_result;
    String sql =  "select * from cj where  username='"+request.getSession().getAttribute("username")+"'";
RS_result=connDbBean.executeQuery(sql);
int i=0;
								while(RS_result.next()){

	i++;
	

 
%>
  <tr>
    <td><%=i %></td>
    <td><%=RS_result.getString("username") %></td><td><%=RS_result.getString("sjbh") %></td><td><%=RS_result.getString("danxuanti") %></td>
    <td><%=RS_result.getString("duoxuanti") %></td>
    <td><%=RS_result.getString("tiankongti") %></td>
    <td><%=RS_result.getString("panduanti") %></td>
    <td><%=RS_result.getString("cj") %></td>
    <td><%=RS_result.getString("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>
<br>
以上数据共<%=i %>条,<a style="cursor:pointer" onClick="javascript:window.print();">打印本页</a>
</body>
</html>


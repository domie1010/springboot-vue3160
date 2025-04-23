<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<html>
  <head>
    <title>填空题详细</title>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>

  </head>

  <body >

  填空题详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CBD8AC" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>试题编号：</td><td width='39%'>${tiankongti.shitibianhao}</td>     <td width='11%'>课程：</td><td width='39%'>${tiankongti.kecheng}</td></tr><tr>     <td width='11%'>题目：</td><td width='39%'>${tiankongti.timu}</td>     <td width='11%'>答案：</td><td width='39%'>${tiankongti.daan}</td></tr><tr>     <td width='11%'>解析：</td><td width='39%'>${tiankongti.jiexi}</td>     <td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


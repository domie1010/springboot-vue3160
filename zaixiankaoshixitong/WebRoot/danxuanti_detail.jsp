<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<html>
  <head>
    <title>单选题详细</title>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>

  </head>

  <body >

  单选题详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CBD8AC" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>试题编号：</td><td width='39%'>${danxuanti.shitibianhao}</td>     <td width='11%'>课程：</td><td width='39%'>${danxuanti.kecheng}</td></tr><tr>     <td width='11%'>题目：</td><td width='39%'>${danxuanti.timu}</td>     <td width='11%'>选项A：</td><td width='39%'>${danxuanti.xuanxiangA}</td></tr><tr>     <td width='11%'>选项B：</td><td width='39%'>${danxuanti.xuanxiangB}</td>     <td width='11%'>选项C：</td><td width='39%'>${danxuanti.xuanxiangC}</td></tr><tr>     <td width='11%'>选项D：</td><td width='39%'>${danxuanti.xuanxiangD}</td>     <td width='11%'>答案：</td><td width='39%'>${danxuanti.daan}</td></tr><tr>     <td width='11%'>解析：</td><td width='39%'>${danxuanti.jiexi}</td>     <td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


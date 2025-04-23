<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<html>
  <head>
    <title>试卷信息详细</title>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>

  </head>

  <body >

  试卷信息详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CBD8AC" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>试卷编号：</td><td width='39%'>${shijuanxinxi.shijuanbianhao}</td>     <td width='11%'>课程：</td><td width='39%'>${shijuanxinxi.kecheng}</td></tr><tr>     <td width='11%'>试卷名称：</td><td width='39%'>${shijuanxinxi.shijuanmingcheng}</td>     <td width='11%'>单选题数：</td><td width='39%'>${shijuanxinxi.danxuantishu}</td></tr><tr>     <td width='11%'>单选题分值：</td><td width='39%'>${shijuanxinxi.danxuantifenzhi}</td>     <td width='11%'>单选题：</td><td width='39%'>${shijuanxinxi.danxuanti}</td></tr><tr>     <td width='11%'>多选题数：</td><td width='39%'>${shijuanxinxi.duoxuantishu}</td>     <td width='11%'>多选题分值：</td><td width='39%'>${shijuanxinxi.duoxuantifenzhi}</td></tr><tr>     <td width='11%'>多选题：</td><td width='39%'>${shijuanxinxi.duoxuanti}</td>     <td width='11%'>判断题数：</td><td width='39%'>${shijuanxinxi.panduantishu}</td></tr><tr>     <td width='11%'>判断题分值：</td><td width='39%'>${shijuanxinxi.panduantifenzhi}</td>     <td width='11%'>判断题：</td><td width='39%'>${shijuanxinxi.panduanti}</td></tr><tr>     <td width='11%'>填空题数：</td><td width='39%'>${shijuanxinxi.tiankongtishu}</td>     <td width='11%'>填空题分值：</td><td width='39%'>${shijuanxinxi.tiankongtifenzhi}</td></tr><tr>     <td width='11%'>填空题：</td><td width='39%'>${shijuanxinxi.tiankongti}</td>     <td width='11%'>发布人：</td><td width='39%'>${shijuanxinxi.faburen}</td>     </tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


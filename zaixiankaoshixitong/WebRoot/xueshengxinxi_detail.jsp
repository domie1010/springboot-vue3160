<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<html>
  <head>
    <title>学生信息详细</title>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>

  </head>

  <body >

  学生信息详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CBD8AC" style="border-collapse:collapse">  
   <tr>
     <td width='11%' height=44>学号：</td><td width='39%'>${xueshengxinxi.xuehao}</td><td  rowspan=8 align=center><a href=${xueshengxinxi.zhaopian} target=_blank><img src=${xueshengxinxi.zhaopian} width=228 height=215 border=0></a></td></tr><tr><td width='11%' height=44>姓名：</td><td width='39%'>${xueshengxinxi.xingming}</td></tr><tr><td width='11%' height=44>密码：</td><td width='39%'>${xueshengxinxi.mima}</td></tr><tr><td width='11%' height=44>班级：</td><td width='39%'>${xueshengxinxi.banji}</td></tr><tr><td width='11%' height=44>籍贯：</td><td width='39%'>${xueshengxinxi.jiguan}</td></tr><tr><td width='11%' height=44>性别：</td><td width='39%'>${xueshengxinxi.xingbie}</td></tr><tr><td width='11%' height=44>身份证：</td><td width='39%'>${xueshengxinxi.shenfenzheng}</td></tr><tr><td width='11%' height=44>手机：</td><td width='39%'>${xueshengxinxi.shouji}</td></tr><tr><td width='11%' height=100  >备注：</td><td width='39%' colspan=2 height=100 >${xueshengxinxi.beizhu}</td></tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>


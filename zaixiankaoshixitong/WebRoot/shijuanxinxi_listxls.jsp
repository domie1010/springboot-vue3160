<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="shijuanxinxihsgb" scope="page" class="com.bean.ShijuanxinxiBean" /> 

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=shijuanxinxi.xls");
%>
<html>
  <head>
    <title>试卷信息</title>
  </head>

  <body >
 <%
			String sql="select * from shijuanxinxi  order by id desc";

			
			%>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td align='center'>试卷编号</td>    <td align='center'>课程</td>    <td align='center'>试卷名称</td>    <td align='center'>单选题数</td>    <td align='center'>单选题分值</td>    <td align='center'>单选题</td>    <td align='center'>多选题数</td>    <td align='center'>多选题分值</td>    <td align='center'>多选题</td>    <td align='center'>判断题数</td>    <td align='center'>判断题分值</td>    <td align='center'>判断题</td>    <td align='center'>填空题数</td>    <td align='center'>填空题分值</td>    <td align='center'>填空题</td>    <td align='center'>发布人</td>    
	
    <td width="120" align="center" bgcolor="CCFFFF">添加时间</td>
    
  </tr>
   <%		
				List pagelist3=shijuanxinxihsgb.getAllShijuanxinxi(18);
			if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
			%>
  <tr>
    <td  align="center"><%=i+1 %></td>
    <td>${u.shijuanbianhao}</td>    <td>${u.kecheng}</td>    <td>${u.shijuanmingcheng}</td>    <td>${u.danxuantishu}</td>    <td>${u.danxuantifenzhi}</td>    <td>${u.danxuanti}</td>    <td>${u.duoxuantishu}</td>    <td>${u.duoxuantifenzhi}</td>    <td>${u.duoxuanti}</td>    <td>${u.panduantishu}</td>    <td>${u.panduantifenzhi}</td>    <td>${u.panduanti}</td>    <td>${u.tiankongtishu}</td>    <td>${u.tiankongtifenzhi}</td>    <td>${u.tiankongti}</td>    <td>${u.faburen}</td>    
	
	
   
  </tr>
  	<%
  }}
   %>
   
</table>
<br>
  </body>
</html>


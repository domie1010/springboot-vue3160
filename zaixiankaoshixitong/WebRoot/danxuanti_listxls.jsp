<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="danxuantihsgb" scope="page" class="com.bean.DanxuantiBean" /> 

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=danxuanti.xls");
%>
<html>
  <head>
    <title>��ѡ��</title>
  </head>

  <body >
 <%
			String sql="select * from danxuanti  order by id desc";

			
			%>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td align='center'>������</td>    <td align='center'>�γ�</td>        <td align='center'>ѡ��A</td>    <td align='center'>ѡ��B</td>    <td align='center'>ѡ��C</td>    <td align='center'>ѡ��D</td>    <td align='center'>��</td>        
	
    <td width="120" align="center" bgcolor="CCFFFF">���ʱ��</td>
    
  </tr>
   <%		
				List pagelist3=danxuantihsgb.getAllDanxuanti(11);
			if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
			%>
  <tr>
    <td  align="center"><%=i+1 %></td>
    <td>${u.shitibianhao}</td>    <td>${u.kecheng}</td>        <td>${u.xuanxiangA}</td>    <td>${u.xuanxiangB}</td>    <td>${u.xuanxiangC}</td>    <td>${u.xuanxiangD}</td>    <td>${u.daan}</td>        
	
	
   
  </tr>
  	<%
  }}
   %>
   
</table>
<br>
  </body>
</html>


<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="shijuanxinxihsgb" scope="page" class="com.bean.ShijuanxinxiBean" /> 

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=shijuanxinxi.xls");
%>
<html>
  <head>
    <title>�Ծ���Ϣ</title>
  </head>

  <body >
 <%
			String sql="select * from shijuanxinxi  order by id desc";

			
			%>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td align='center'>�Ծ���</td>    <td align='center'>�γ�</td>    <td align='center'>�Ծ�����</td>    <td align='center'>��ѡ����</td>    <td align='center'>��ѡ���ֵ</td>    <td align='center'>��ѡ��</td>    <td align='center'>��ѡ����</td>    <td align='center'>��ѡ���ֵ</td>    <td align='center'>��ѡ��</td>    <td align='center'>�ж�����</td>    <td align='center'>�ж����ֵ</td>    <td align='center'>�ж���</td>    <td align='center'>�������</td>    <td align='center'>������ֵ</td>    <td align='center'>�����</td>    <td align='center'>������</td>    
	
    <td width="120" align="center" bgcolor="CCFFFF">���ʱ��</td>
    
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


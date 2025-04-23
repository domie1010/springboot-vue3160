<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>


<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
 <%

	
	if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")  //判断用户是否已经登陆，如果没有，则给出登陆框，如果有则显示当前用户信息
	{
			out.print("<script>alert('对不起,请您先登陆!');window.history.go(-1);</script>");
	}



%>
<html>
 <head>
    
    <title>试卷生成</title>
	<!--bixanjxiqxi-->
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>

  <body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
  <table id="__01" width="100%" height="193" border="0" cellpadding="0" cellspacing="0">
    
    <tr>
      <td height="162" align="center">
	  <%
	  ResultSet RS_result;
  String id=request.getParameter("id");
  String sql="",nnn="",bianhao="",bbb="",ccc="",ddd="",eee="";
      String ndanxuantishu="";
  String ndanxuantifenzhi="";
  String npanduantishu="";
  String npanduantifenzhi="";
  String ntiankongtishu="";
  String ntiankongtifenzhi="";
  String nduoxuantishu="";
  String nduoxuantifenzhi="";
											sql="select * from shijuanxinxi where id="+id+"";
											RS_result=connDbBean.executeQuery(sql);
								if(RS_result.next()){
								// while(RS_result.next()){
								 nnn=RS_result.getString("danxuanti");
								 bianhao=RS_result.getString("shijuanbianhao");
								 bbb=RS_result.getString("tiankongti");
								 ccc=RS_result.getString("panduanti");
								 eee=RS_result.getString("duoxuanti");
								 
								  ndanxuantishu=RS_result.getString("danxuantishu");
								  ndanxuantifenzhi=RS_result.getString("danxuantifenzhi");
								  npanduantishu=RS_result.getString("panduantishu");
								  npanduantifenzhi=RS_result.getString("panduantifenzhi");
								  ntiankongtishu=RS_result.getString("tiankongtishu");
								  ntiankongtifenzhi=RS_result.getString("tiankongtifenzhi");
								  nduoxuantishu=RS_result.getString("duoxuantishu");
								  nduoxuantifenzhi=RS_result.getString("duoxuantifenzhi");
								
								 }
   %>
            <p>试卷编号：<%=bianhao%></p>
            <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
              <tr>
                <td height="33" colspan="2">单选题(题数<%=ndanxuantishu%>，每题<%=ndanxuantifenzhi%>分)</td>
              </tr>
              <%
											
  sql="select * from danxuanti where id in ("+nnn+")";
  
  sql=sql+" order by id desc";
  //RS_result=connDbBean.executeQuery(sql);
  id="";
String timu="";String xuanxiangA="";String xuanxiangB="";String xuanxiangC="";String xuanxiangD="";String daan="";String kemumingcheng="";
 String addtime="";
 int i=0;
 
RS_result=connDbBean.executeQuery(sql);
								while(RS_result.next()){
 
 
 //while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
timu=RS_result.getString("timu");xuanxiangA=RS_result.getString("xuanxiangA");
xuanxiangB=RS_result.getString("xuanxiangB");xuanxiangC=RS_result.getString("xuanxiangC");xuanxiangD=RS_result.getString("xuanxiangD");
daan=RS_result.getString("daan");
//nanyichengdu=map.get("nanyichengdu");
 addtime=RS_result.getString("addtime");
 
											%>
              <tr>
                <td width="8%" height="33">试题<%=i%>：</td>
                <td>题目：<%=timu%>
                    <input name="xztshitida<%=i%>" type="hidden" id="xztshitida<%=i%>" value="<%=daan%>"></td>
              </tr>
              <tr>
                <td rowspan="4">选项</td>
                <td width="92%"><input type="radio" name="xztxxa<%=i%>" value="A">
                  选项A：<%=xuanxiangA%></td>
              </tr>
              <tr>
                <td><input type="radio" name="xztxxa<%=i%>" value="B">
选项B：<%=xuanxiangB%></td>
              </tr>
              <tr>
                <td><input type="radio" name="xztxxa<%=i%>" value="C">
选项C：<%=xuanxiangC%></td>
              </tr>
              <tr>
                <td><input type="radio" name="xztxxa<%=i%>" value="D">
选项D：<%=xuanxiangD%></td>
              </tr>
              <%
											  }
											  %>
            </table>
			
			  <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
              <tr>
                <td height="33" colspan="2">多选题(题数<%=nduoxuantishu%>，每题<%=nduoxuantifenzhi%>分)</td>
              </tr>
              <%
											
  sql="select * from duoxuanti where id in ("+eee+")";
  
  sql=sql+" order by id desc";
  //RS_result=connDbBean.executeQuery(sql);
  id="";
 i=0;
 
RS_result=connDbBean.executeQuery(sql);
								while(RS_result.next()){
 
 
 //while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
timu=RS_result.getString("timu");xuanxiangA=RS_result.getString("xuanxiangA");
xuanxiangB=RS_result.getString("xuanxiangB");xuanxiangC=RS_result.getString("xuanxiangC");xuanxiangD=RS_result.getString("xuanxiangD");
daan=RS_result.getString("daan");
//nanyichengdu=map.get("nanyichengdu");
 addtime=RS_result.getString("addtime");
 
											%>
              <tr>
                <td width="8%" height="33">试题<%=i%>：</td>
                <td>题目：<%=timu%>
                    <input name="xztshitida<%=i%>" type="hidden" id="xztshitida<%=i%>" value="<%=daan%>"></td>
              </tr>
              <tr>
                <td rowspan="4">选项</td>
                <td width="92%"><input type="checkbox" name="dxtshitida<%=i%>" value="A" id="dxtshitida<%=i%>">                
                  选项A：<%=xuanxiangA%></td></tr>
              <tr>
                <td><input type="checkbox" name="dxtshitida<%=i%>2" value="B" id="dxtshitida<%=i%>2">
选项B：<%=xuanxiangB%></td>
              </tr>
              <tr>
                <td><input type="checkbox" name="dxtshitida<%=i%>3" value="C" id="dxtshitida<%=i%>3">
选项C：<%=xuanxiangC%></td>
              </tr>
              <tr>
                <td><input type="checkbox" name="dxtshitida<%=i%>4" value="D" id="dxtshitida<%=i%>4">
选项D：<%=xuanxiangD%></td>
              </tr>
              <%
											  }
											  %>
            </table>
			
			
			  <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
              <tr>
                <td height="33" colspan="2">判断题(题数<%=npanduantishu%>，每题<%=npanduantifenzhi%>分)</td>
              </tr>
              <%
											
  sql="select * from panduanti where id in ("+ccc+")";
  
  sql=sql+" order by id desc";
  //RS_result=connDbBean.executeQuery(sql);
  id="";
 i=0;
 
RS_result=connDbBean.executeQuery(sql);
								while(RS_result.next()){
 
 
 //while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
timu=RS_result.getString("timu");
daan=RS_result.getString("daan");
//nanyichengdu=map.get("nanyichengdu");
 addtime=RS_result.getString("addtime");
 
											%>
              <tr>
                <td width="8%" height="33">试题<%=i%>：</td>
                <td>题目：<%=timu%>
                    <input name="pdtshitida<%=i%>" type="hidden" id="pdtshitida<%=i%>" value="<%=daan%>"></td>
              </tr>
              <tr>
                <td rowspan="2">选项</td>
                <td width="92%"><input type="radio" name="pdtxxa<%=i%>" value="对">                
                  对</td>
              </tr>
              <tr>
                <td><input type="radio" name="pdtxxa<%=i%>" value="错"> 
                  错
</td>
              </tr>
              
              <%
											  }
											  %>
            </table>
			
			
			<table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
              <tr>
                <td height="33" colspan="2">填空题(题数<%=npanduantishu%>，每题<%=npanduantifenzhi%>分)</td>
              </tr>
              <%
											
  sql="select * from tiankongti where id in ("+bbb+")";
  
  sql=sql+" order by id desc";
  //RS_result=connDbBean.executeQuery(sql);
  id="";
 i=0;
 
RS_result=connDbBean.executeQuery(sql);
								while(RS_result.next()){
 
 
 //while(RS_result.next()){
 i=i+1;
 id=RS_result.getString("id");
timu=RS_result.getString("timu");
daan=RS_result.getString("daan");
//nanyichengdu=map.get("nanyichengdu");
 addtime=RS_result.getString("addtime");
 
											%>
              <tr>
                <td width="8%" height="33">试题<%=i%>：</td>
                <td>题目：<%=timu%>
                    <input name="xztshitida<%=i%>" type="hidden" id="xztshitida<%=i%>" value="<%=daan%>"></td>
              </tr>
              <tr>
                <td>答案</td>
                <td width="92%"><input name="tktdaan<%=i%>" type="text" id="tktdaan<%=i%>"></td>
              </tr>
              
              
              <%
											  }
											  %>
            </table>
          
          <p>
            <input type=button name=Submit52 value=打印 onClick="javascript:window.print()" />
          </p>
      </td>
    </tr>
  </table>
  </body>
</html>


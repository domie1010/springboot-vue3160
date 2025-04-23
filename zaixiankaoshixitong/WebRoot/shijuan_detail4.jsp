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
	
String sql="";
ResultSet RS_result;
 String username=(String)request.getSession().getAttribute("username");
String timu="";String xuanxiangA="";String xuanxiangB="";String xuanxiangC="";String xuanxiangD="";String daan="";String kemumingcheng="";
 String addtime="";String jiexi="";

%>
<html>
 <head>
    
    <title>错题集</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>

  <body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
  <table id="__01" width="100%" height="193" border="0" cellpadding="0" cellspacing="0">
    
    <tr>
      <td height="162" align="center">
	 
       
            <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
              <tr>
                <td height="33" colspan="3">单选题</td>
              </tr>
               <%
  String id="";
  String ddd="",cwda="";
											sql="select * from cuotijilu where  username='"+username+"' and biao='danxuanti'";
											int i=0;
								RS_result=connDbBean.executeQuery(sql);
while(RS_result.next()){
								i=i+1;
								 ddd=RS_result.getString("timuid");
								 
								 cwda=RS_result.getString("cwda");				
  
 // HashMap bdq = new CommDAO().getmaps("id",ddd,"danxuanti");
 
  //RS_result=connDbBean.executeQuery(sql);
  id="";

 timu=connDbBean.readzd("danxuanti","timu","id",ddd);
xuanxiangA=connDbBean.readzd("danxuanti","xuanxiangA","id",ddd);
xuanxiangB=connDbBean.readzd("danxuanti","xuanxiangB","id",ddd);
xuanxiangC=connDbBean.readzd("danxuanti","xuanxiangC","id",ddd);
xuanxiangD=connDbBean.readzd("danxuanti","xuanxiangD","id",ddd);
daan=connDbBean.readzd("danxuanti","daan","id",ddd);
jiexi=connDbBean.readzd("danxuanti","jiexi","id",ddd);
//nanyichengdu=map.get("nanyichengdu");
// addtime=(String)bdq.get("addtime");
						%>
              <tr>
                <td width="8%" height="33">试题<%=i%>：</td>
                <td colspan="2">题目：<%=timu%>                  </td>
              </tr>
             
              <tr>
                <td rowspan="4">选项</td>
                <td colspan="2"><input type="radio" name="xztxxa<%=i%>" value="A">
                  选项A：<%=xuanxiangA%></td>
              </tr>
              <tr>
                <td colspan="2"><input type="radio" name="xztxxa<%=i%>" value="B">
选项B：<%=xuanxiangB%></td>
              </tr>
              <tr>
                <td colspan="2"><input type="radio" name="xztxxa<%=i%>" value="C">
选项C：<%=xuanxiangC%></td>
              </tr>
              <tr>
                <td colspan="2"><input type="radio" name="xztxxa<%=i%>" value="D">
选项D：<%=xuanxiangD%></td>
              </tr>
              <tr>
                <td>我的答案：</td>
                <td width="9%"><%=cwda%>  <input type="submit" name="button" id="button" value="查看标准答案" onClick="javascript:fsfds(<%=i%>)"> </td>
                <td width="83%"> <div id="xztshitida<%=i%>" style="display:none; color:#F00; font-weight:500"><%=daan%> 解析：<%=jiexi%></div></td>
              </tr>
             
             
              <%
											  }
											  %>
            </table>
			
			
			<table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
              <tr>
                <td height="33" colspan="3">多选题</td>
              </tr>
               <%

   ddd="";
   cwda="";
											sql="select * from cuotijilu where  username='"+username+"' and biao='duoxuanti'";
											 i=0;
								RS_result=connDbBean.executeQuery(sql);
while(RS_result.next()){
								i=i+1;
								 ddd=RS_result.getString("timuid");
								 
								 cwda=RS_result.getString("cwda");					
  

 
  //RS_result=connDbBean.executeQuery(sql);
  id="";
 timu=connDbBean.readzd("duoxuanti","timu","id",ddd);
xuanxiangA=connDbBean.readzd("duoxuanti","xuanxiangA","id",ddd);
xuanxiangB=connDbBean.readzd("duoxuanti","xuanxiangB","id",ddd);
xuanxiangC=connDbBean.readzd("duoxuanti","xuanxiangC","id",ddd);
xuanxiangD=connDbBean.readzd("duoxuanti","xuanxiangD","id",ddd);
daan=connDbBean.readzd("duoxuanti","daan","id",ddd);
jiexi=connDbBean.readzd("duoxuanti","jiexi","id",ddd);
						%>
              <tr>
                <td width="8%" height="33">试题<%=i%>：</td>
                <td colspan="2">题目：<%=timu%>                  </td>
              </tr>
             
              <tr>
                <td rowspan="4">选项</td>
                <td colspan="2"><input type="radio" name="xztxxa<%=i%>" value="A">
                  选项A：<%=xuanxiangA%></td>
              </tr>
              <tr>
                <td colspan="2"><input type="radio" name="xztxxa<%=i%>" value="B">
选项B：<%=xuanxiangB%></td>
              </tr>
              <tr>
                <td colspan="2"><input type="radio" name="xztxxa<%=i%>" value="C">
选项C：<%=xuanxiangC%></td>
              </tr>
              <tr>
                <td colspan="2"><input type="radio" name="xztxxa<%=i%>" value="D">
选项D：<%=xuanxiangD%></td>
              </tr>
              <tr>
                <td>我的答案：</td>
                <td width="9%"><%=cwda%>  <input type="submit" name="button" id="button" value="查看标准答案" onClick="javascript:dx(<%=i%>)"> </td>
                <td width="83%"> <div id="dxtshitida<%=i%>" style="display:none; color:#F00; font-weight:500"><%=daan%>; 解析：<%=jiexi%></div></td>
              </tr>
             
             
              <%
											  }
											  %>
            </table>
			
            <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
              <tr>
                <td height="33" colspan="3">填空题</td>
              </tr>
              <%
					String sql2="";						

											sql2="select * from cuotijilu where username='"+username+"' and biao='tiankongti'";
											
											int j=0;
 
RS_result=connDbBean.executeQuery(sql2);
while(RS_result.next()){

 j=j+1;

								 
								  ddd=RS_result.getString("timuid");
								 
								 cwda=RS_result.getString("cwda");					
  
 
	
 timu=connDbBean.readzd("tiankongti","timu","id",ddd);

daan=connDbBean.readzd("tiankongti","daan","id",ddd);
jiexi=connDbBean.readzd("tiankongti","jiexi","id",ddd);

 
											%>
              <tr>
                <td width="9%" height="33">试题<%=j%>：</td>
                <td colspan="2">题目：<%=timu%>
                    </td>
              </tr>
            
              <tr>
                <td>我的答案：</td>
                <td width="9%"><%=cwda%>  <input type="submit" name="button" id="button" value="查看标准答案" onClick="javascript:tk(<%=j%>)"> </td>
                <td width="83%"> <div id="tktshitida<%=j%>" style="display:none; color:#F00; font-weight:500"><%=daan%> 解析：<%=jiexi%></div></td>
              </tr>
             
             
              <%
											  }
											  %>
            </table>     
           
                   
            <table width="98%" height="103" border="1" cellpadding="1" cellspacing="0" bordercolor="#F8C878">
              <tr>
                <td height="33" colspan="3">判断题</td>
              </tr>
              <%
					String sql3="";						
 
 
											int k=0;
											sql3="select * from cuotijilu where  username='"+username+"' and biao='panduanti' ";
											
 
RS_result=connDbBean.executeQuery(sql3);
while(RS_result.next()){

 k=k+1;
  ddd=RS_result.getString("timuid");
								 
								 cwda=RS_result.getString("cwda");				
  
  //HashMap ttdt = new CommDAO().getmaps("id",pdt,"panduanti");

 timu=connDbBean.readzd("panduanti","timu","id",ddd);

daan=connDbBean.readzd("panduanti","daan","id",ddd);
jiexi=connDbBean.readzd("panduanti","jiexi","id",ddd);
 
											%>
              <tr>
                <td width="9%" height="33">试题<%=k%>：</td>
                <td colspan="2">题目：<%=timu%>
                    </td>
              </tr>
              <tr>
                <td>答案：</td>
                <td colspan="2"><input type="radio" name="pdtxxa<%=k%>" value="对"> 
                  对
                    <input type="radio" name="pdtxxa<%=k%>" value="错">
                    错</td>
              </tr>
              <tr>
                <td>我的答案：</td>
                <td width="9%"><%=cwda%>  <input type="submit" name="button" id="button" value="查看标准答案" onClick="javascript:pd(<%=k%>)"> </td>
                <td width="83%"> <div id="pdtshitida<%=k%>" style="display:none; color:#F00; font-weight:500"><%=daan%> 解析：<%=jiexi%></div></td>
              </tr>
                 <%
											  }
											  %>
            </table> 
            <script language="javascript">
            function fsfds(sss)
			{
					//alert("dd");
				document.getElementById("xztshitida"+sss).style.display="";
				}
            function dx(sss)
			{
					//alert("dd");
				document.getElementById("dxtshitida"+sss).style.display="";
				}
            function tk(sss)
			{
					//alert("dd");
				document.getElementById("tktshitida"+sss).style.display="";
				}
          
            function pd(sss)
			{
					//alert("dd");
				document.getElementById("pdtshitida"+sss).style.display="";
				}
            </script>
  </body>
</html>


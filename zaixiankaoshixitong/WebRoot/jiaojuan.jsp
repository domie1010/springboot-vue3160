<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>

<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
  
  <body>
  <%
 
String id="";
id=request.getParameter("id");
String tmp1;
String tmp2;
int i=0;
double df=0,df2=0,df3=0,df4=0,dfz=0;
String sql="";
String sql2="";
String sql8="";
String sql9="";
  ResultSet RS_result;
//sql="select * from shijuanxinxi where id="+id+"";
//HashMap mmm = new CommDAO().getmaps("id",request.getParameter("id"),"shijuanshengcheng"); 
								
								
								String ddd=connDbBean.readzd("shijuanxinxi","danxuanti","id",id);
								String dxtfz=connDbBean.readzd("shijuanxinxi","danxuantifenzhi","id",id);
								 
								 sql2="select * from danxuanti where id in ("+ddd+")";
								 sql2=sql2+" order by id desc";
								 String sql3="";
	RS_result=connDbBean.executeQuery(sql2);
								while(RS_result.next()){
	i=i+1;
	tmp1=request.getParameter("xztshitida"+String.valueOf(i));
	tmp2=request.getParameter("xztxxa"+String.valueOf(i));
	
	if(tmp2==null || tmp2=="")
	{}
	else
	{
		
		if(tmp1.equals(tmp2))
		{
		df=df+Float.valueOf(dxtfz).floatValue();
		
		}
		else{
			sql3="delete from cuotijilu where username='"+request.getSession().getAttribute("username")+"' and timuid='"+RS_result.getString("id")+"' and biao='danxuanti'";
			
			connDbBean.hsgexecute(sql3);
			sql3="insert into cuotijilu(username,biao,timuid,sjbh,cwda) values('"+request.getSession().getAttribute("username")+"','danxuanti','"+RS_result.getString("id")+"','"+request.getParameter("bianhao")+"','"+request.getParameter("xztxxa"+String.valueOf(i))+"')";
			connDbBean.hsgexecute(sql3);
			}
	}
}

i=0;
 sql="";
 sql2="";

								
								
								String ttt=connDbBean.readzd("shijuanxinxi","duoxuanti","id",id);
								String duoxuantifz=connDbBean.readzd("shijuanxinxi","duoxuantifenzhi","id",id);
								 
								 sql2="select * from duoxuanti where id in ("+ttt+")";
								 sql2=sql2+" order by id desc";
								  sql3="";
RS_result=connDbBean.executeQuery(sql2);
while(RS_result.next()){
	i=i+1;
	tmp1=request.getParameter("dxtshitida"+String.valueOf(i));
	//tmp2=request.getParameter("dxtxxa"+String.valueOf(i));
	tmp2="";
	
	String[]   values   =   request.getParameterValues("dxtxxa"+String.valueOf(i));
if(values!=null)
{
   for(int ir=0;ir<values.length;ir++)
{
	tmp2=tmp2+values[ir]+",";
	}
}
	//out.print(tmp1);
	

tmp2=tmp2.replace(",","");
	
	if(tmp2==null || tmp2=="")
	{}
	else
	{
		if(tmp1.equals(tmp2))
		{
		df2=df2+Float.valueOf(duoxuantifz).floatValue();
		}
		else{
			sql3="delete from cuotijilu where username='"+request.getSession().getAttribute("username")+"' and timuid='"+RS_result.getString("id")+"' and biao='duoxuanti'";
			connDbBean.hsgexecute(sql3);
			sql3="insert into cuotijilu(username,biao,timuid,sjbh,cwda) values('"+request.getSession().getAttribute("username")+"','duoxuanti','"+RS_result.getString("id")+"','"+request.getParameter("bianhao")+"','"+tmp2+"')";
		    connDbBean.hsgexecute(sql3);
			}
	}
}



i=0;
 sql="";
 sql2="";

								
								
								 ttt=connDbBean.readzd("shijuanxinxi","tiankongti","id",id);
								String tktfz=connDbBean.readzd("shijuanxinxi","tiankongtifenzhi","id",id);
								 
								 sql2="select * from tiankongti where id in ("+ttt+")";
								 sql2=sql2+" order by id desc";
								  sql3="";
RS_result=connDbBean.executeQuery(sql2);
while(RS_result.next()){
	i=i+1;
	tmp1=request.getParameter("tktshitida"+String.valueOf(i));
	tmp2=request.getParameter("tktdaan"+String.valueOf(i));
	if(tmp2==null || tmp2=="")
	{}
	else
	{
		if(tmp1.equals(tmp2))
		{
		df3=df3+Float.valueOf(tktfz).floatValue();
		}
		else{
			sql3="delete from cuotijilu where username='"+request.getSession().getAttribute("username")+"' and timuid='"+RS_result.getString("id")+"' and biao='tiankongti'";
			connDbBean.hsgexecute(sql3);
			sql3="insert into cuotijilu(username,biao,timuid,sjbh,cwda) values('"+request.getSession().getAttribute("username")+"','tiankongti','"+RS_result.getString("id")+"','"+request.getParameter("bianhao")+"','"+request.getParameter("tktdaan"+String.valueOf(i))+"')";
		    connDbBean.hsgexecute(sql3);
			}
	}
}

i=0;
 sql="";
 sql2="";

								
								
								String ppp=connDbBean.readzd("shijuanxinxi","panduanti","id",id);
								String pdtfz=connDbBean.readzd("shijuanxinxi","panduantifenzhi","id",id);
								 
								 sql2="select * from panduanti where id in ("+ppp+")";
								 sql2=sql2+" order by id desc";
								  sql3="";
RS_result=connDbBean.executeQuery(sql2);
while(RS_result.next()){
	i=i+1;
	tmp1=request.getParameter("pdtshitida"+String.valueOf(i));
	tmp2=request.getParameter("pdtxxa"+String.valueOf(i));
	if(tmp2==null || tmp2=="")
	{}
	else
	{
		if(tmp1.equals(tmp2))
		{
		df4=df4+Float.valueOf(pdtfz).floatValue();
		}
		else{
			sql3="delete from cuotijilu where username='"+request.getSession().getAttribute("username")+"' and timuid='"+RS_result.getString("id")+"' and biao='panduanti'";
			connDbBean.hsgexecute(sql3);
			sql3="insert into cuotijilu(username,biao,timuid,sjbh,cwda) values('"+request.getSession().getAttribute("username")+"','panduanti','"+RS_result.getString("id")+"','"+request.getParameter("bianhao")+"','"+request.getParameter("pdtxxa"+String.valueOf(i))+"')";
	 		
			connDbBean.hsgexecute(sql3);
			}
	}
}

dfz=df+df2+df3+df4;



//out.print(df);

sql="insert into cj(username,danxuanti,duoxuanti,tiankongti,panduanti,cj,sjbh) values('"+request.getSession().getAttribute("username")+"',"+df+","+df2+","+df3+","+df4+","+dfz+",'"+request.getParameter("bianhao")+"')";
 connDbBean.hsgexecute(sql);
	

  	  	out.print("<script>alert('交卷成功!!您本次成绩为"+dfz+"分！');location.href='sy.jsp';</script>");


 %>
  </body>
</html>


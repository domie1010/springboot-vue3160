package com.controller;

import java.io.File;
import java.io.IOException;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Shijuanxinxi;
import com.server.ShijuanxinxiServer;
import com.util.PageBean;
import net.sf.json.JSONObject;
import com.util.db;
import java.sql.SQLException;
import java.sql.*;
@Controller
public class ShijuanxinxiController {
	@Resource
	private ShijuanxinxiServer shijuanxinxiService;


   
	@RequestMapping("addShijuanxinxi.do")
	public String addShijuanxinxi(HttpServletRequest request,Shijuanxinxi shijuanxinxi,HttpSession session) throws SQLException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		
		shijuanxinxi.setAddtime(time.toString().substring(0, 19));
		shijuanxinxiService.add(shijuanxinxi);
		session.setAttribute("backxx", "添加成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		
		//session.setAttribute("backurl", "shijuanxinxiList.do");
		
		return "redirect:postback.jsp";
		//return "redirect:shijuanxinxiList.do";
		
		
		
	}
 
//	处理编辑
	@RequestMapping("doUpdateShijuanxinxi.do")
	public String doUpdateShijuanxinxi(int id,ModelMap map,Shijuanxinxi shijuanxinxi){
		shijuanxinxi=shijuanxinxiService.getById(id);
		map.put("shijuanxinxi", shijuanxinxi);
		return "shijuanxinxi_updt";
	}
	
	
	
	
	
//	后台详细
	@RequestMapping("shijuanxinxiDetail.do")
	public String shijuanxinxiDetail(int id,ModelMap map,Shijuanxinxi shijuanxinxi){
		shijuanxinxi=shijuanxinxiService.getById(id);
		map.put("shijuanxinxi", shijuanxinxi);
		return "shijuanxinxi_detail";
	}
//	前台详细
	@RequestMapping("sjxxDetail.do")
	public String sjxxDetail(int id,ModelMap map,Shijuanxinxi shijuanxinxi){
		shijuanxinxi=shijuanxinxiService.getById(id);
		map.put("shijuanxinxi", shijuanxinxi);
		return "shijuanxinxidetail";
	}
//	
	@RequestMapping("updateShijuanxinxi.do")
	public String updateShijuanxinxi(int id,ModelMap map,Shijuanxinxi shijuanxinxi,HttpServletRequest request,HttpSession session){
		shijuanxinxiService.update(shijuanxinxi);
		session.setAttribute("backxx", "修改成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		return "redirect:postback.jsp";
		//String url = request.getHeader("Referer");
		//return "redirect:"+url;
		//return "redirect:shijuanxinxiList.do";
	}

//	分页查询
	@RequestMapping("shijuanxinxiList.do")
	public String shijuanxinxiList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Shijuanxinxi shijuanxinxi, String shijuanbianhao, String kecheng, String shijuanmingcheng, String danxuantishu, String danxuantifenzhi, String danxuanti, String duoxuantishu, String duoxuantifenzhi, String duoxuanti, String panduantishu, String panduantifenzhi, String panduanti, String tiankongtishu, String tiankongtifenzhi, String tiankongti, String faburen){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(shijuanbianhao==null||shijuanbianhao.equals("")){pmap.put("shijuanbianhao", null);}else{pmap.put("shijuanbianhao", shijuanbianhao);}		if(kecheng==null||kecheng.equals("")){pmap.put("kecheng", null);}else{pmap.put("kecheng", kecheng);}		if(shijuanmingcheng==null||shijuanmingcheng.equals("")){pmap.put("shijuanmingcheng", null);}else{pmap.put("shijuanmingcheng", shijuanmingcheng);}		if(danxuantishu==null||danxuantishu.equals("")){pmap.put("danxuantishu", null);}else{pmap.put("danxuantishu", danxuantishu);}		if(danxuantifenzhi==null||danxuantifenzhi.equals("")){pmap.put("danxuantifenzhi", null);}else{pmap.put("danxuantifenzhi", danxuantifenzhi);}		if(danxuanti==null||danxuanti.equals("")){pmap.put("danxuanti", null);}else{pmap.put("danxuanti", danxuanti);}		if(duoxuantishu==null||duoxuantishu.equals("")){pmap.put("duoxuantishu", null);}else{pmap.put("duoxuantishu", duoxuantishu);}		if(duoxuantifenzhi==null||duoxuantifenzhi.equals("")){pmap.put("duoxuantifenzhi", null);}else{pmap.put("duoxuantifenzhi", duoxuantifenzhi);}		if(duoxuanti==null||duoxuanti.equals("")){pmap.put("duoxuanti", null);}else{pmap.put("duoxuanti", duoxuanti);}		if(panduantishu==null||panduantishu.equals("")){pmap.put("panduantishu", null);}else{pmap.put("panduantishu", panduantishu);}		if(panduantifenzhi==null||panduantifenzhi.equals("")){pmap.put("panduantifenzhi", null);}else{pmap.put("panduantifenzhi", panduantifenzhi);}		if(panduanti==null||panduanti.equals("")){pmap.put("panduanti", null);}else{pmap.put("panduanti", panduanti);}		if(tiankongtishu==null||tiankongtishu.equals("")){pmap.put("tiankongtishu", null);}else{pmap.put("tiankongtishu", tiankongtishu);}		if(tiankongtifenzhi==null||tiankongtifenzhi.equals("")){pmap.put("tiankongtifenzhi", null);}else{pmap.put("tiankongtifenzhi", tiankongtifenzhi);}		if(tiankongti==null||tiankongti.equals("")){pmap.put("tiankongti", null);}else{pmap.put("tiankongti", tiankongti);}		if(faburen==null||faburen.equals("")){pmap.put("faburen", null);}else{pmap.put("faburen", faburen);}		
		int total=shijuanxinxiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Shijuanxinxi> list=shijuanxinxiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "shijuanxinxi_list";
	}
	
	@RequestMapping("shijuanxinxiList2.do")
	public String shijuanxinxiList2(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Shijuanxinxi shijuanxinxi, String shijuanbianhao, String kecheng, String shijuanmingcheng, String danxuantishu, String danxuantifenzhi, String danxuanti, String duoxuantishu, String duoxuantifenzhi, String duoxuanti, String panduantishu, String panduantifenzhi, String panduanti, String tiankongtishu, String tiankongtifenzhi, String tiankongti, String faburen,HttpServletRequest request){
		/*if(session.getAttribute("user")==null){
			return "login";
		}*/
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		pmap.put("faburen", (String)request.getSession().getAttribute("username"));
		if(shijuanbianhao==null||shijuanbianhao.equals("")){pmap.put("shijuanbianhao", null);}else{pmap.put("shijuanbianhao", shijuanbianhao);}		if(kecheng==null||kecheng.equals("")){pmap.put("kecheng", null);}else{pmap.put("kecheng", kecheng);}		if(shijuanmingcheng==null||shijuanmingcheng.equals("")){pmap.put("shijuanmingcheng", null);}else{pmap.put("shijuanmingcheng", shijuanmingcheng);}		if(danxuantishu==null||danxuantishu.equals("")){pmap.put("danxuantishu", null);}else{pmap.put("danxuantishu", danxuantishu);}		if(danxuantifenzhi==null||danxuantifenzhi.equals("")){pmap.put("danxuantifenzhi", null);}else{pmap.put("danxuantifenzhi", danxuantifenzhi);}		if(danxuanti==null||danxuanti.equals("")){pmap.put("danxuanti", null);}else{pmap.put("danxuanti", danxuanti);}		if(duoxuantishu==null||duoxuantishu.equals("")){pmap.put("duoxuantishu", null);}else{pmap.put("duoxuantishu", duoxuantishu);}		if(duoxuantifenzhi==null||duoxuantifenzhi.equals("")){pmap.put("duoxuantifenzhi", null);}else{pmap.put("duoxuantifenzhi", duoxuantifenzhi);}		if(duoxuanti==null||duoxuanti.equals("")){pmap.put("duoxuanti", null);}else{pmap.put("duoxuanti", duoxuanti);}		if(panduantishu==null||panduantishu.equals("")){pmap.put("panduantishu", null);}else{pmap.put("panduantishu", panduantishu);}		if(panduantifenzhi==null||panduantifenzhi.equals("")){pmap.put("panduantifenzhi", null);}else{pmap.put("panduantifenzhi", panduantifenzhi);}		if(panduanti==null||panduanti.equals("")){pmap.put("panduanti", null);}else{pmap.put("panduanti", panduanti);}		if(tiankongtishu==null||tiankongtishu.equals("")){pmap.put("tiankongtishu", null);}else{pmap.put("tiankongtishu", tiankongtishu);}		if(tiankongtifenzhi==null||tiankongtifenzhi.equals("")){pmap.put("tiankongtifenzhi", null);}else{pmap.put("tiankongtifenzhi", tiankongtifenzhi);}		if(tiankongti==null||tiankongti.equals("")){pmap.put("tiankongti", null);}else{pmap.put("tiankongti", tiankongti);}		
		
		int total=shijuanxinxiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Shijuanxinxi> list=shijuanxinxiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "shijuanxinxi_list2";
	}	
	@RequestMapping("shijuanxinxiList3.do")
	public String shijuanxinxiList3(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Shijuanxinxi shijuanxinxi, String shijuanbianhao, String kecheng, String shijuanmingcheng, String danxuantishu, String danxuantifenzhi, String danxuanti, String duoxuantishu, String duoxuantifenzhi, String duoxuanti, String panduantishu, String panduantifenzhi, String panduanti, String tiankongtishu, String tiankongtifenzhi, String tiankongti, String faburen){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(shijuanbianhao==null||shijuanbianhao.equals("")){pmap.put("shijuanbianhao", null);}else{pmap.put("shijuanbianhao", shijuanbianhao);}
		if(kecheng==null||kecheng.equals("")){pmap.put("kecheng", null);}else{pmap.put("kecheng", kecheng);}
		if(shijuanmingcheng==null||shijuanmingcheng.equals("")){pmap.put("shijuanmingcheng", null);}else{pmap.put("shijuanmingcheng", shijuanmingcheng);}
		if(danxuantishu==null||danxuantishu.equals("")){pmap.put("danxuantishu", null);}else{pmap.put("danxuantishu", danxuantishu);}
		if(danxuantifenzhi==null||danxuantifenzhi.equals("")){pmap.put("danxuantifenzhi", null);}else{pmap.put("danxuantifenzhi", danxuantifenzhi);}
		if(danxuanti==null||danxuanti.equals("")){pmap.put("danxuanti", null);}else{pmap.put("danxuanti", danxuanti);}
		if(duoxuantishu==null||duoxuantishu.equals("")){pmap.put("duoxuantishu", null);}else{pmap.put("duoxuantishu", duoxuantishu);}
		if(duoxuantifenzhi==null||duoxuantifenzhi.equals("")){pmap.put("duoxuantifenzhi", null);}else{pmap.put("duoxuantifenzhi", duoxuantifenzhi);}
		if(duoxuanti==null||duoxuanti.equals("")){pmap.put("duoxuanti", null);}else{pmap.put("duoxuanti", duoxuanti);}
		if(panduantishu==null||panduantishu.equals("")){pmap.put("panduantishu", null);}else{pmap.put("panduantishu", panduantishu);}
		if(panduantifenzhi==null||panduantifenzhi.equals("")){pmap.put("panduantifenzhi", null);}else{pmap.put("panduantifenzhi", panduantifenzhi);}
		if(panduanti==null||panduanti.equals("")){pmap.put("panduanti", null);}else{pmap.put("panduanti", panduanti);}
		if(tiankongtishu==null||tiankongtishu.equals("")){pmap.put("tiankongtishu", null);}else{pmap.put("tiankongtishu", tiankongtishu);}
		if(tiankongtifenzhi==null||tiankongtifenzhi.equals("")){pmap.put("tiankongtifenzhi", null);}else{pmap.put("tiankongtifenzhi", tiankongtifenzhi);}
		if(tiankongti==null||tiankongti.equals("")){pmap.put("tiankongti", null);}else{pmap.put("tiankongti", tiankongti);}
		if(faburen==null||faburen.equals("")){pmap.put("faburen", null);}else{pmap.put("faburen", faburen);}
		
		int total=shijuanxinxiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Shijuanxinxi> list=shijuanxinxiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "shijuanxinxi_list3";
	}
	
	@RequestMapping("sjxxList.do")
	public String sjxxList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Shijuanxinxi shijuanxinxi, String shijuanbianhao, String kecheng, String shijuanmingcheng, String danxuantishu, String danxuantifenzhi, String danxuanti, String duoxuantishu, String duoxuantifenzhi, String duoxuanti, String panduantishu, String panduantifenzhi, String panduanti, String tiankongtishu, String tiankongtifenzhi, String tiankongti, String faburen){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(shijuanbianhao==null||shijuanbianhao.equals("")){pmap.put("shijuanbianhao", null);}else{pmap.put("shijuanbianhao", shijuanbianhao);}		if(kecheng==null||kecheng.equals("")){pmap.put("kecheng", null);}else{pmap.put("kecheng", kecheng);}		if(shijuanmingcheng==null||shijuanmingcheng.equals("")){pmap.put("shijuanmingcheng", null);}else{pmap.put("shijuanmingcheng", shijuanmingcheng);}		if(danxuantishu==null||danxuantishu.equals("")){pmap.put("danxuantishu", null);}else{pmap.put("danxuantishu", danxuantishu);}		if(danxuantifenzhi==null||danxuantifenzhi.equals("")){pmap.put("danxuantifenzhi", null);}else{pmap.put("danxuantifenzhi", danxuantifenzhi);}		if(danxuanti==null||danxuanti.equals("")){pmap.put("danxuanti", null);}else{pmap.put("danxuanti", danxuanti);}		if(duoxuantishu==null||duoxuantishu.equals("")){pmap.put("duoxuantishu", null);}else{pmap.put("duoxuantishu", duoxuantishu);}		if(duoxuantifenzhi==null||duoxuantifenzhi.equals("")){pmap.put("duoxuantifenzhi", null);}else{pmap.put("duoxuantifenzhi", duoxuantifenzhi);}		if(duoxuanti==null||duoxuanti.equals("")){pmap.put("duoxuanti", null);}else{pmap.put("duoxuanti", duoxuanti);}		if(panduantishu==null||panduantishu.equals("")){pmap.put("panduantishu", null);}else{pmap.put("panduantishu", panduantishu);}		if(panduantifenzhi==null||panduantifenzhi.equals("")){pmap.put("panduantifenzhi", null);}else{pmap.put("panduantifenzhi", panduantifenzhi);}		if(panduanti==null||panduanti.equals("")){pmap.put("panduanti", null);}else{pmap.put("panduanti", panduanti);}		if(tiankongtishu==null||tiankongtishu.equals("")){pmap.put("tiankongtishu", null);}else{pmap.put("tiankongtishu", tiankongtishu);}		if(tiankongtifenzhi==null||tiankongtifenzhi.equals("")){pmap.put("tiankongtifenzhi", null);}else{pmap.put("tiankongtifenzhi", tiankongtifenzhi);}		if(tiankongti==null||tiankongti.equals("")){pmap.put("tiankongti", null);}else{pmap.put("tiankongti", tiankongti);}		if(faburen==null||faburen.equals("")){pmap.put("faburen", null);}else{pmap.put("faburen", faburen);}		
		int total=shijuanxinxiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Shijuanxinxi> list=shijuanxinxiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "shijuanxinxilist";
	}
	
	@RequestMapping("deleteShijuanxinxi.do")
	public String deleteShijuanxinxi(int id,HttpServletRequest request){
		shijuanxinxiService.delete(id);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
		//return "redirect:shijuanxinxiList.do";
	}
	
	@RequestMapping("quchongShijuanxinxi.do")
	public void quchongShijuanxinxi(Shijuanxinxi shijuanxinxi,HttpServletResponse response){
		   Map<String,Object> map=new HashMap<String,Object>();
		   map.put("shijuanbianhao", shijuanxinxi.getShijuanbianhao());
		   System.out.println("shijuanbianhao==="+shijuanxinxi.getShijuanbianhao());
		   System.out.println("shijuanbianhao222==="+shijuanxinxiService.quchongShijuanxinxi(map));
		   JSONObject obj=new JSONObject();
		   if(shijuanxinxiService.quchongShijuanxinxi(map)!=null){
				 obj.put("info", "ng");
			   }else{
				   obj.put("info", "试卷编号可以用！");
				  
			   }
		   response.setContentType("text/html;charset=utf-8");
		   PrintWriter out=null;
		   try {
			out=response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			out.close();
		}
	}
}

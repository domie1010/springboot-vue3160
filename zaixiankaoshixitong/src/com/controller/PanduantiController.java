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

import com.entity.Panduanti;
import com.server.PanduantiServer;
import com.util.PageBean;
import net.sf.json.JSONObject;
import com.util.db;
import java.sql.SQLException;
import java.sql.*;
@Controller
public class PanduantiController {
	@Resource
	private PanduantiServer panduantiService;


   
	@RequestMapping("addPanduanti.do")
	public String addPanduanti(HttpServletRequest request,Panduanti panduanti,HttpSession session) throws SQLException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		
		panduanti.setAddtime(time.toString().substring(0, 19));
		panduantiService.add(panduanti);
		session.setAttribute("backxx", "添加成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		
		//session.setAttribute("backurl", "panduantiList.do");
		
		return "redirect:postback.jsp";
		//return "redirect:panduantiList.do";
		
		
		
	}
 
//	处理编辑
	@RequestMapping("doUpdatePanduanti.do")
	public String doUpdatePanduanti(int id,ModelMap map,Panduanti panduanti){
		panduanti=panduantiService.getById(id);
		map.put("panduanti", panduanti);
		return "panduanti_updt";
	}
	
	
	
	
	
//	后台详细
	@RequestMapping("panduantiDetail.do")
	public String panduantiDetail(int id,ModelMap map,Panduanti panduanti){
		panduanti=panduantiService.getById(id);
		map.put("panduanti", panduanti);
		return "panduanti_detail";
	}
//	前台详细
	@RequestMapping("pdtDetail.do")
	public String pdtDetail(int id,ModelMap map,Panduanti panduanti){
		panduanti=panduantiService.getById(id);
		map.put("panduanti", panduanti);
		return "panduantidetail";
	}
//	
	@RequestMapping("updatePanduanti.do")
	public String updatePanduanti(int id,ModelMap map,Panduanti panduanti,HttpServletRequest request,HttpSession session){
		panduantiService.update(panduanti);
		session.setAttribute("backxx", "修改成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		return "redirect:postback.jsp";
		//String url = request.getHeader("Referer");
		//return "redirect:"+url;
		//return "redirect:panduantiList.do";
	}

//	分页查询
	@RequestMapping("panduantiList.do")
	public String panduantiList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Panduanti panduanti, String shitibianhao, String kecheng, String timu, String daan, String jiexi){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(shitibianhao==null||shitibianhao.equals("")){pmap.put("shitibianhao", null);}else{pmap.put("shitibianhao", shitibianhao);}		if(kecheng==null||kecheng.equals("")){pmap.put("kecheng", null);}else{pmap.put("kecheng", kecheng);}		if(timu==null||timu.equals("")){pmap.put("timu", null);}else{pmap.put("timu", timu);}		if(daan==null||daan.equals("")){pmap.put("daan", null);}else{pmap.put("daan", daan);}		if(jiexi==null||jiexi.equals("")){pmap.put("jiexi", null);}else{pmap.put("jiexi", jiexi);}		
		int total=panduantiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Panduanti> list=panduantiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "panduanti_list";
	}
	
	
	
	@RequestMapping("pdtList.do")
	public String pdtList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Panduanti panduanti, String shitibianhao, String kecheng, String timu, String daan, String jiexi){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(shitibianhao==null||shitibianhao.equals("")){pmap.put("shitibianhao", null);}else{pmap.put("shitibianhao", shitibianhao);}		if(kecheng==null||kecheng.equals("")){pmap.put("kecheng", null);}else{pmap.put("kecheng", kecheng);}		if(timu==null||timu.equals("")){pmap.put("timu", null);}else{pmap.put("timu", timu);}		if(daan==null||daan.equals("")){pmap.put("daan", null);}else{pmap.put("daan", daan);}		if(jiexi==null||jiexi.equals("")){pmap.put("jiexi", null);}else{pmap.put("jiexi", jiexi);}		
		int total=panduantiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Panduanti> list=panduantiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "panduantilist";
	}
	
	@RequestMapping("deletePanduanti.do")
	public String deletePanduanti(int id,HttpServletRequest request){
		panduantiService.delete(id);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
		//return "redirect:panduantiList.do";
	}
	
	@RequestMapping("quchongPanduanti.do")
	public void quchongPanduanti(Panduanti panduanti,HttpServletResponse response){
		   Map<String,Object> map=new HashMap<String,Object>();
		   map.put("shitibianhao", panduanti.getShitibianhao());
		   System.out.println("shitibianhao==="+panduanti.getShitibianhao());
		   System.out.println("shitibianhao222==="+panduantiService.quchongPanduanti(map));
		   JSONObject obj=new JSONObject();
		   if(panduantiService.quchongPanduanti(map)!=null){
				 obj.put("info", "ng");
			   }else{
				   obj.put("info", "试题编号可以用！");
				  
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

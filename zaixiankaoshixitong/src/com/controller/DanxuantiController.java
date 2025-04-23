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

import com.entity.Danxuanti;
import com.server.DanxuantiServer;
import com.util.PageBean;
import net.sf.json.JSONObject;
import com.util.db;
import java.sql.SQLException;
import java.sql.*;
@Controller
public class DanxuantiController {
	@Resource
	private DanxuantiServer danxuantiService;


   
	@RequestMapping("addDanxuanti.do")
	public String addDanxuanti(HttpServletRequest request,Danxuanti danxuanti,HttpSession session) throws SQLException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		
		danxuanti.setAddtime(time.toString().substring(0, 19));
		danxuantiService.add(danxuanti);
		session.setAttribute("backxx", "添加成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		
		//session.setAttribute("backurl", "danxuantiList.do");
		
		return "redirect:postback.jsp";
		//return "redirect:danxuantiList.do";
		
		
		
	}
 
//	处理编辑
	@RequestMapping("doUpdateDanxuanti.do")
	public String doUpdateDanxuanti(int id,ModelMap map,Danxuanti danxuanti){
		danxuanti=danxuantiService.getById(id);
		map.put("danxuanti", danxuanti);
		return "danxuanti_updt";
	}
	
	
	
	
	
//	后台详细
	@RequestMapping("danxuantiDetail.do")
	public String danxuantiDetail(int id,ModelMap map,Danxuanti danxuanti){
		danxuanti=danxuantiService.getById(id);
		map.put("danxuanti", danxuanti);
		return "danxuanti_detail";
	}

//	
	@RequestMapping("updateDanxuanti.do")
	public String updateDanxuanti(int id,ModelMap map,Danxuanti danxuanti,HttpServletRequest request,HttpSession session){
		danxuantiService.update(danxuanti);
		session.setAttribute("backxx", "修改成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		return "redirect:postback.jsp";
		//String url = request.getHeader("Referer");
		//return "redirect:"+url;
		//return "redirect:danxuantiList.do";
	}

//	分页查询
	@RequestMapping("danxuantiList.do")
	public String danxuantiList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Danxuanti danxuanti, String shitibianhao, String kecheng, String timu, String xuanxiangA, String xuanxiangB, String xuanxiangC, String xuanxiangD, String daan, String jiexi){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(shitibianhao==null||shitibianhao.equals("")){pmap.put("shitibianhao", null);}else{pmap.put("shitibianhao", shitibianhao);}		if(kecheng==null||kecheng.equals("")){pmap.put("kecheng", null);}else{pmap.put("kecheng", kecheng);}		if(timu==null||timu.equals("")){pmap.put("timu", null);}else{pmap.put("timu", timu);}		if(xuanxiangA==null||xuanxiangA.equals("")){pmap.put("xuanxiangA", null);}else{pmap.put("xuanxiangA", xuanxiangA);}		if(xuanxiangB==null||xuanxiangB.equals("")){pmap.put("xuanxiangB", null);}else{pmap.put("xuanxiangB", xuanxiangB);}		if(xuanxiangC==null||xuanxiangC.equals("")){pmap.put("xuanxiangC", null);}else{pmap.put("xuanxiangC", xuanxiangC);}		if(xuanxiangD==null||xuanxiangD.equals("")){pmap.put("xuanxiangD", null);}else{pmap.put("xuanxiangD", xuanxiangD);}		if(daan==null||daan.equals("")){pmap.put("daan", null);}else{pmap.put("daan", daan);}		if(jiexi==null||jiexi.equals("")){pmap.put("jiexi", null);}else{pmap.put("jiexi", jiexi);}		
		int total=danxuantiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Danxuanti> list=danxuantiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "danxuanti_list";
	}
	
	
	
	
	@RequestMapping("deleteDanxuanti.do")
	public String deleteDanxuanti(int id,HttpServletRequest request){
		danxuantiService.delete(id);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
		//return "redirect:danxuantiList.do";
	}
	
	@RequestMapping("quchongDanxuanti.do")
	public void quchongDanxuanti(Danxuanti danxuanti,HttpServletResponse response){
		   Map<String,Object> map=new HashMap<String,Object>();
		   map.put("shitibianhao", danxuanti.getShitibianhao());
		   System.out.println("shitibianhao==="+danxuanti.getShitibianhao());
		   System.out.println("shitibianhao222==="+danxuantiService.quchongDanxuanti(map));
		   JSONObject obj=new JSONObject();
		   if(danxuantiService.quchongDanxuanti(map)!=null){
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

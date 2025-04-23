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

import com.entity.Tiankongti;
import com.server.TiankongtiServer;
import com.util.PageBean;
import net.sf.json.JSONObject;
import com.util.db;
import java.sql.SQLException;
import java.sql.*;
@Controller
public class TiankongtiController {
	@Resource
	private TiankongtiServer tiankongtiService;


   
	@RequestMapping("addTiankongti.do")
	public String addTiankongti(HttpServletRequest request,Tiankongti tiankongti,HttpSession session) throws SQLException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		
		tiankongti.setAddtime(time.toString().substring(0, 19));
		tiankongtiService.add(tiankongti);
		session.setAttribute("backxx", "添加成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		
		//session.setAttribute("backurl", "tiankongtiList.do");
		
		return "redirect:postback.jsp";
		//return "redirect:tiankongtiList.do";
		
		
		
	}
 
//	处理编辑
	@RequestMapping("doUpdateTiankongti.do")
	public String doUpdateTiankongti(int id,ModelMap map,Tiankongti tiankongti){
		tiankongti=tiankongtiService.getById(id);
		map.put("tiankongti", tiankongti);
		return "tiankongti_updt";
	}
	
	
	
	
	
//	后台详细
	@RequestMapping("tiankongtiDetail.do")
	public String tiankongtiDetail(int id,ModelMap map,Tiankongti tiankongti){
		tiankongti=tiankongtiService.getById(id);
		map.put("tiankongti", tiankongti);
		return "tiankongti_detail";
	}
//	前台详细
	@RequestMapping("tktDetail.do")
	public String tktDetail(int id,ModelMap map,Tiankongti tiankongti){
		tiankongti=tiankongtiService.getById(id);
		map.put("tiankongti", tiankongti);
		return "tiankongtidetail";
	}
//	
	@RequestMapping("updateTiankongti.do")
	public String updateTiankongti(int id,ModelMap map,Tiankongti tiankongti,HttpServletRequest request,HttpSession session){
		tiankongtiService.update(tiankongti);
		session.setAttribute("backxx", "修改成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		return "redirect:postback.jsp";
		//String url = request.getHeader("Referer");
		//return "redirect:"+url;
		//return "redirect:tiankongtiList.do";
	}

//	分页查询
	@RequestMapping("tiankongtiList.do")
	public String tiankongtiList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Tiankongti tiankongti, String shitibianhao, String kecheng, String timu, String daan, String jiexi){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(shitibianhao==null||shitibianhao.equals("")){pmap.put("shitibianhao", null);}else{pmap.put("shitibianhao", shitibianhao);}		if(kecheng==null||kecheng.equals("")){pmap.put("kecheng", null);}else{pmap.put("kecheng", kecheng);}		if(timu==null||timu.equals("")){pmap.put("timu", null);}else{pmap.put("timu", timu);}		if(daan==null||daan.equals("")){pmap.put("daan", null);}else{pmap.put("daan", daan);}		if(jiexi==null||jiexi.equals("")){pmap.put("jiexi", null);}else{pmap.put("jiexi", jiexi);}		
		int total=tiankongtiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Tiankongti> list=tiankongtiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "tiankongti_list";
	}
	
	
	
	@RequestMapping("tktList.do")
	public String tktList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Tiankongti tiankongti, String shitibianhao, String kecheng, String timu, String daan, String jiexi){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(shitibianhao==null||shitibianhao.equals("")){pmap.put("shitibianhao", null);}else{pmap.put("shitibianhao", shitibianhao);}		if(kecheng==null||kecheng.equals("")){pmap.put("kecheng", null);}else{pmap.put("kecheng", kecheng);}		if(timu==null||timu.equals("")){pmap.put("timu", null);}else{pmap.put("timu", timu);}		if(daan==null||daan.equals("")){pmap.put("daan", null);}else{pmap.put("daan", daan);}		if(jiexi==null||jiexi.equals("")){pmap.put("jiexi", null);}else{pmap.put("jiexi", jiexi);}		
		int total=tiankongtiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Tiankongti> list=tiankongtiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "tiankongtilist";
	}
	
	@RequestMapping("deleteTiankongti.do")
	public String deleteTiankongti(int id,HttpServletRequest request){
		tiankongtiService.delete(id);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
		//return "redirect:tiankongtiList.do";
	}
	
	@RequestMapping("quchongTiankongti.do")
	public void quchongTiankongti(Tiankongti tiankongti,HttpServletResponse response){
		   Map<String,Object> map=new HashMap<String,Object>();
		   map.put("shitibianhao", tiankongti.getShitibianhao());
		   System.out.println("shitibianhao==="+tiankongti.getShitibianhao());
		   System.out.println("shitibianhao222==="+tiankongtiService.quchongTiankongti(map));
		   JSONObject obj=new JSONObject();
		   if(tiankongtiService.quchongTiankongti(map)!=null){
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

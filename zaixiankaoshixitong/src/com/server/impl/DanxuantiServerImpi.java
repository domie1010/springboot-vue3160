package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.DanxuantiMapper;
import com.entity.Danxuanti;
import com.server.DanxuantiServer;
@Service
public class DanxuantiServerImpi implements DanxuantiServer {
   @Resource
   private DanxuantiMapper gdao;
	@Override
	public int add(Danxuanti po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Danxuanti po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Danxuanti> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Danxuanti> getsydanxuanti1(Map<String, Object> map) {
		return gdao.getsydanxuanti1(map);
	}
	public List<Danxuanti> getsydanxuanti2(Map<String, Object> map) {
		return gdao.getsydanxuanti2(map);
	}
	public List<Danxuanti> getsydanxuanti3(Map<String, Object> map) {
		return gdao.getsydanxuanti3(map);
	}
	
	@Override
	public Danxuanti quchongDanxuanti(Map<String, Object> account) {
		return gdao.quchongDanxuanti(account);
	}

	@Override
	public List<Danxuanti> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Danxuanti> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Danxuanti getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}


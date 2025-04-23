package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.PanduantiMapper;
import com.entity.Panduanti;
import com.server.PanduantiServer;
@Service
public class PanduantiServerImpi implements PanduantiServer {
   @Resource
   private PanduantiMapper gdao;
	@Override
	public int add(Panduanti po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Panduanti po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Panduanti> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Panduanti> getsypanduanti1(Map<String, Object> map) {
		return gdao.getsypanduanti1(map);
	}
	public List<Panduanti> getsypanduanti2(Map<String, Object> map) {
		return gdao.getsypanduanti2(map);
	}
	public List<Panduanti> getsypanduanti3(Map<String, Object> map) {
		return gdao.getsypanduanti3(map);
	}
	
	@Override
	public Panduanti quchongPanduanti(Map<String, Object> account) {
		return gdao.quchongPanduanti(account);
	}

	@Override
	public List<Panduanti> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Panduanti> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Panduanti getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}


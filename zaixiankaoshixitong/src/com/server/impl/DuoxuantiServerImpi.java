package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.DuoxuantiMapper;
import com.entity.Duoxuanti;
import com.server.DuoxuantiServer;
@Service
public class DuoxuantiServerImpi implements DuoxuantiServer {
   @Resource
   private DuoxuantiMapper gdao;
	@Override
	public int add(Duoxuanti po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Duoxuanti po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Duoxuanti> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Duoxuanti> getsyduoxuanti1(Map<String, Object> map) {
		return gdao.getsyduoxuanti1(map);
	}
	public List<Duoxuanti> getsyduoxuanti2(Map<String, Object> map) {
		return gdao.getsyduoxuanti2(map);
	}
	public List<Duoxuanti> getsyduoxuanti3(Map<String, Object> map) {
		return gdao.getsyduoxuanti3(map);
	}
	
	@Override
	public Duoxuanti quchongDuoxuanti(Map<String, Object> account) {
		return gdao.quchongDuoxuanti(account);
	}

	@Override
	public List<Duoxuanti> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Duoxuanti> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Duoxuanti getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}


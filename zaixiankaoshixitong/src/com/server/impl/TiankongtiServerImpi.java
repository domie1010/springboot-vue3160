package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.TiankongtiMapper;
import com.entity.Tiankongti;
import com.server.TiankongtiServer;
@Service
public class TiankongtiServerImpi implements TiankongtiServer {
   @Resource
   private TiankongtiMapper gdao;
	@Override
	public int add(Tiankongti po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Tiankongti po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Tiankongti> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Tiankongti> getsytiankongti1(Map<String, Object> map) {
		return gdao.getsytiankongti1(map);
	}
	public List<Tiankongti> getsytiankongti2(Map<String, Object> map) {
		return gdao.getsytiankongti2(map);
	}
	public List<Tiankongti> getsytiankongti3(Map<String, Object> map) {
		return gdao.getsytiankongti3(map);
	}
	
	@Override
	public Tiankongti quchongTiankongti(Map<String, Object> account) {
		return gdao.quchongTiankongti(account);
	}

	@Override
	public List<Tiankongti> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Tiankongti> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Tiankongti getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}


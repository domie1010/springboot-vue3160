package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.ShijuanxinxiMapper;
import com.entity.Shijuanxinxi;
import com.server.ShijuanxinxiServer;
@Service
public class ShijuanxinxiServerImpi implements ShijuanxinxiServer {
   @Resource
   private ShijuanxinxiMapper gdao;
	@Override
	public int add(Shijuanxinxi po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Shijuanxinxi po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Shijuanxinxi> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Shijuanxinxi> getsyshijuanxinxi1(Map<String, Object> map) {
		return gdao.getsyshijuanxinxi1(map);
	}
	public List<Shijuanxinxi> getsyshijuanxinxi2(Map<String, Object> map) {
		return gdao.getsyshijuanxinxi2(map);
	}
	public List<Shijuanxinxi> getsyshijuanxinxi3(Map<String, Object> map) {
		return gdao.getsyshijuanxinxi3(map);
	}
	
	@Override
	public Shijuanxinxi quchongShijuanxinxi(Map<String, Object> account) {
		return gdao.quchongShijuanxinxi(account);
	}

	@Override
	public List<Shijuanxinxi> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Shijuanxinxi> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Shijuanxinxi getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}


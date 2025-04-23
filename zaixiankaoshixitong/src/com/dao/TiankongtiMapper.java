package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Tiankongti;

public interface TiankongtiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Tiankongti record);

    int insertSelective(Tiankongti record);

    Tiankongti selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Tiankongti record);
	
    int updateByPrimaryKey(Tiankongti record);
	public Tiankongti quchongTiankongti(Map<String, Object> shitibianhao);
	public List<Tiankongti> getAll(Map<String, Object> map);
	public List<Tiankongti> getsytiankongti1(Map<String, Object> map);
	public List<Tiankongti> getsytiankongti3(Map<String, Object> map);
	public List<Tiankongti> getsytiankongti2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Tiankongti> getByPage(Map<String, Object> map);
	public List<Tiankongti> select(Map<String, Object> map);
//	所有List
}


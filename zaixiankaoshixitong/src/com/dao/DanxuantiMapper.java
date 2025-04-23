package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Danxuanti;

public interface DanxuantiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Danxuanti record);

    int insertSelective(Danxuanti record);

    Danxuanti selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Danxuanti record);
	
    int updateByPrimaryKey(Danxuanti record);
	public Danxuanti quchongDanxuanti(Map<String, Object> shitibianhao);
	public List<Danxuanti> getAll(Map<String, Object> map);
	public List<Danxuanti> getsydanxuanti1(Map<String, Object> map);
	public List<Danxuanti> getsydanxuanti3(Map<String, Object> map);
	public List<Danxuanti> getsydanxuanti2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Danxuanti> getByPage(Map<String, Object> map);
	public List<Danxuanti> select(Map<String, Object> map);
//	所有List
}


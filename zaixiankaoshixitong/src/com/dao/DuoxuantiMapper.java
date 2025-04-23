package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Duoxuanti;

public interface DuoxuantiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Duoxuanti record);

    int insertSelective(Duoxuanti record);

    Duoxuanti selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Duoxuanti record);
	
    int updateByPrimaryKey(Duoxuanti record);
	public Duoxuanti quchongDuoxuanti(Map<String, Object> shitibianhao);
	public List<Duoxuanti> getAll(Map<String, Object> map);
	public List<Duoxuanti> getsyduoxuanti1(Map<String, Object> map);
	public List<Duoxuanti> getsyduoxuanti3(Map<String, Object> map);
	public List<Duoxuanti> getsyduoxuanti2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Duoxuanti> getByPage(Map<String, Object> map);
	public List<Duoxuanti> select(Map<String, Object> map);
//	所有List
}


package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Panduanti;

public interface PanduantiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Panduanti record);

    int insertSelective(Panduanti record);

    Panduanti selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Panduanti record);
	
    int updateByPrimaryKey(Panduanti record);
	public Panduanti quchongPanduanti(Map<String, Object> shitibianhao);
	public List<Panduanti> getAll(Map<String, Object> map);
	public List<Panduanti> getsypanduanti1(Map<String, Object> map);
	public List<Panduanti> getsypanduanti3(Map<String, Object> map);
	public List<Panduanti> getsypanduanti2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Panduanti> getByPage(Map<String, Object> map);
	public List<Panduanti> select(Map<String, Object> map);
//	所有List
}


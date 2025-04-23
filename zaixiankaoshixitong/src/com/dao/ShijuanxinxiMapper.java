package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Shijuanxinxi;

public interface ShijuanxinxiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Shijuanxinxi record);

    int insertSelective(Shijuanxinxi record);

    Shijuanxinxi selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Shijuanxinxi record);
	
    int updateByPrimaryKey(Shijuanxinxi record);
	public Shijuanxinxi quchongShijuanxinxi(Map<String, Object> faburen);
	public List<Shijuanxinxi> getAll(Map<String, Object> map);
	public List<Shijuanxinxi> getsyshijuanxinxi1(Map<String, Object> map);
	public List<Shijuanxinxi> getsyshijuanxinxi3(Map<String, Object> map);
	public List<Shijuanxinxi> getsyshijuanxinxi2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Shijuanxinxi> getByPage(Map<String, Object> map);
	public List<Shijuanxinxi> select(Map<String, Object> map);
//	所有List
}


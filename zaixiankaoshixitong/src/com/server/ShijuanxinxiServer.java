package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Shijuanxinxi;

public interface ShijuanxinxiServer {

  public int add(Shijuanxinxi po);

  public int update(Shijuanxinxi po);
  
  
  
  public int delete(int id);

  public List<Shijuanxinxi> getAll(Map<String,Object> map);
  public List<Shijuanxinxi> getsyshijuanxinxi1(Map<String,Object> map);
  public List<Shijuanxinxi> getsyshijuanxinxi2(Map<String,Object> map);
  public List<Shijuanxinxi> getsyshijuanxinxi3(Map<String,Object> map);
  public Shijuanxinxi quchongShijuanxinxi(Map<String, Object> acount);

  public Shijuanxinxi getById( int id);

  public List<Shijuanxinxi> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Shijuanxinxi> select(Map<String, Object> map);
}
//	所有List

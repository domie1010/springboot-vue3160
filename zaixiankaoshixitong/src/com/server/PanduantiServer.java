package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Panduanti;

public interface PanduantiServer {

  public int add(Panduanti po);

  public int update(Panduanti po);
  
  
  
  public int delete(int id);

  public List<Panduanti> getAll(Map<String,Object> map);
  public List<Panduanti> getsypanduanti1(Map<String,Object> map);
  public List<Panduanti> getsypanduanti2(Map<String,Object> map);
  public List<Panduanti> getsypanduanti3(Map<String,Object> map);
  public Panduanti quchongPanduanti(Map<String, Object> acount);

  public Panduanti getById( int id);

  public List<Panduanti> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Panduanti> select(Map<String, Object> map);
}
//	所有List

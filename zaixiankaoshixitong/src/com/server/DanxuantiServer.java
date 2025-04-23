package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Danxuanti;

public interface DanxuantiServer {

  public int add(Danxuanti po);

  public int update(Danxuanti po);
  
  
  
  public int delete(int id);

  public List<Danxuanti> getAll(Map<String,Object> map);
  public List<Danxuanti> getsydanxuanti1(Map<String,Object> map);
  public List<Danxuanti> getsydanxuanti2(Map<String,Object> map);
  public List<Danxuanti> getsydanxuanti3(Map<String,Object> map);
  public Danxuanti quchongDanxuanti(Map<String, Object> acount);

  public Danxuanti getById( int id);

  public List<Danxuanti> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Danxuanti> select(Map<String, Object> map);
}
//	所有List

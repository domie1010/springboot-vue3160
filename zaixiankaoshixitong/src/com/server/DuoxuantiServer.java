package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Duoxuanti;

public interface DuoxuantiServer {

  public int add(Duoxuanti po);

  public int update(Duoxuanti po);
  
  
  
  public int delete(int id);

  public List<Duoxuanti> getAll(Map<String,Object> map);
  public List<Duoxuanti> getsyduoxuanti1(Map<String,Object> map);
  public List<Duoxuanti> getsyduoxuanti2(Map<String,Object> map);
  public List<Duoxuanti> getsyduoxuanti3(Map<String,Object> map);
  public Duoxuanti quchongDuoxuanti(Map<String, Object> acount);

  public Duoxuanti getById( int id);

  public List<Duoxuanti> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Duoxuanti> select(Map<String, Object> map);
}
//	所有List

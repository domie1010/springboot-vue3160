package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Tiankongti;

public interface TiankongtiServer {

  public int add(Tiankongti po);

  public int update(Tiankongti po);
  
  
  
  public int delete(int id);

  public List<Tiankongti> getAll(Map<String,Object> map);
  public List<Tiankongti> getsytiankongti1(Map<String,Object> map);
  public List<Tiankongti> getsytiankongti2(Map<String,Object> map);
  public List<Tiankongti> getsytiankongti3(Map<String,Object> map);
  public Tiankongti quchongTiankongti(Map<String, Object> acount);

  public Tiankongti getById( int id);

  public List<Tiankongti> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Tiankongti> select(Map<String, Object> map);
}
//	所有List

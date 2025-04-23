package com.entity;

public class Kechengxinxi {
    private Integer id;
	private String kecheng;	
    private String addtime;

    

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
	
	public String getKecheng() {
        return kecheng;
    }
    public void setKecheng(String kecheng) {
        this.kecheng = kecheng == null ? null : kecheng.trim();
    }	
	
	
    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? null : addtime.trim();
    }
}
//   设置字段信息

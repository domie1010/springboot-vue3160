package com.entity;

public class Panduanti {
    private Integer id;
	private String shitibianhao;	private String kecheng;	private String timu;	private String daan;	private String jiexi;	
    private String addtime;

    

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
	
	public String getShitibianhao() {
        return shitibianhao;
    }
    public void setShitibianhao(String shitibianhao) {
        this.shitibianhao = shitibianhao == null ? null : shitibianhao.trim();
    }	public String getKecheng() {
        return kecheng;
    }
    public void setKecheng(String kecheng) {
        this.kecheng = kecheng == null ? null : kecheng.trim();
    }	public String getTimu() {
        return timu;
    }
    public void setTimu(String timu) {
        this.timu = timu == null ? null : timu.trim();
    }	public String getDaan() {
        return daan;
    }
    public void setDaan(String daan) {
        this.daan = daan == null ? null : daan.trim();
    }	public String getJiexi() {
        return jiexi;
    }
    public void setJiexi(String jiexi) {
        this.jiexi = jiexi == null ? null : jiexi.trim();
    }	
	
	
    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime == null ? null : addtime.trim();
    }
}
//   设置字段信息

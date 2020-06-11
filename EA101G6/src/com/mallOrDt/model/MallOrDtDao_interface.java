package com.mallOrDt.model;


import java.util.List;

public interface MallOrDtDao_interface {

	public void add(MallOrDtVO mallOrDt);
	public void delete(String mallOrNo,String commNo);
	public void update(MallOrDtVO mallOrDt);
	public List<MallOrDtVO> getAll();
	public List<MallOrDtVO> getByOrNo(String mallOrNo);
	public MallOrDtVO findOneByFk(String mallOrNo,String commNo);
	public Integer getTotal(String mallOrNo);
	
}

package com.gmType.model;


import java.util.List;

public interface GmTypeDao_interface {

	public void add(GmTypeVO gmType);
	public void delete(String typeNo);
	public void update(GmTypeVO gmType);
	public List<GmTypeVO> getAll();
	public GmTypeVO getOneByNo(String typeNo);
	
}

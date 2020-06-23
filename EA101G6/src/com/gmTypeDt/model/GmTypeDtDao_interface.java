package com.gmTypeDt.model;

import java.util.List;

public interface GmTypeDtDao_interface {
	
	public void add(GmTypeDtVO gmTypeDt);
	public void delete(String typeNo,String commNo);
	public void deleteByTypeNo(String typeNo);
	public void deleteByCommNo(String commNo);
	public List<GmTypeDtVO> getAll();
	public List<GmTypeDtVO> findByTypeNo(String typeNo);
	public List<GmTypeDtVO> findByCommNo(String commNo);
	//public GmTypeDtVO getOne(GmTypeDtVO gmTypeDt);
	
}

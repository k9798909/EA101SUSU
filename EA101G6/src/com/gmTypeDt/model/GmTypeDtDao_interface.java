package com.gmTypeDt.model;

import java.util.List;

public interface GmTypeDtDao_interface {
	
	public void add(GmTypeDtVO gmTypeDt);
	public void delete(String typeNo,String commNo);
	//public void update(GmTypeDtVO gmTypeDt);
	public List<GmTypeDtVO> getAll();
	public List<GmTypeDtVO> getByTypeNo(String typeNo);
	public List<GmTypeDtVO> getByCommNo(String commNo);
	//public GmTypeDtVO getOne(GmTypeDtVO gmTypeDt);
	
}

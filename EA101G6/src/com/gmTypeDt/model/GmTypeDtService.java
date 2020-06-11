package com.gmTypeDt.model;

import java.util.List;

public class GmTypeDtService {
	
	private GmTypeDtDao_interface dao;
	
	public GmTypeDtService(){
		dao=new GmTypeDtJDBCDaoImpl();
	}
	//ok
	public void add(String typeNo, String commNo){
		
		GmTypeDtVO vo = new GmTypeDtVO();
		vo.setTypeNo(typeNo);
		vo.setCommNo(commNo);
		dao.add(vo);
	}
	
	//ok
	public void delete(String typeNo,String commNo){
		dao.delete(typeNo,commNo);
	}
	//ok
	public List<GmTypeDtVO> getAll(){
		return dao.getAll();
	}
	//ok
	public List<GmTypeDtVO> findByTypeNo(String typeNo){
		return dao.findByTypeNo(typeNo);
	}
	//ok
	public List<GmTypeDtVO> findByCommNo(String commNo){
		return dao.findByCommNo(commNo);
	}
	/**
	public static void main(String[] args) {
		
		GmTypeDtService ser = new GmTypeDtService();
		ser.add("ZT00007", "ZM00010");
		ser.delete("ZT00007", "ZM00010");
		List<GmTypeDtVO>list=ser.getByCommNo("ZM00010");
		for(GmTypeDtVO vo:list)
		System.out.println(vo.getTypeNo());
		System.out.println(ser.getByCommNo(1001));
		System.out.println(ser.getByTypeNo(4));
	}**/
	
}

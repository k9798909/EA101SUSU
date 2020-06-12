package com.gmType.model;

import java.util.List;

public class GmTypeService {
	private GmTypeDao_interface dao ;
	
	public GmTypeService() {
		dao = new GmTypeJDBCDaoImpl();
	}
	
	public void add(String typeName){
		GmTypeVO vo = new GmTypeVO();
		vo.setTypeName(typeName);
		dao.add(vo);
	};
	public void delete(String typeNo){
		dao.delete(typeNo);
	};
	public GmTypeVO update(String typeNo, String typeName) {
		GmTypeVO vo = new GmTypeVO();
		vo.setTypeNo(typeNo);
		vo.setTypeName(typeName);
		dao.update(vo);
		return vo;
	};
	public List<GmTypeVO> getAll(){
		return dao.getAll();
	};
	public GmTypeVO findOneByTypeNo(String typeNo){
		return dao.findOneByTypeNo(typeNo);
	};
	/**
	public static void main(String[] args) {
		GmTypeService ser =new GmTypeService();
		ser.add("哈哈類");
		ser.update("ZT00008","西西");
		ser.delete("ZT00009");
		List<GmTypeVO> list = ser.getAll();
		for(GmTypeVO vo : list)
			System.out.println(vo.getTypeName());
		System.out.println(ser.getOneByNo("ZT00009").getTypeName());
		
	}
	**/
}

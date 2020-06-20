package com.mallOrDt.model;

import java.sql.Connection;
import java.util.List;

public class MallOrDtService {
	
	MallOrDtDao_interface dao=null;
	
	public MallOrDtService(){
		dao=new MallOrDtJDBCDaoImpl();
	}
	
	//ok
	public void add(String mallOrNo, String commNo, Integer quantity, Integer price){
		MallOrDtVO vo =new MallOrDtVO();
		vo.setMallOrNo(mallOrNo);
		vo.setCommNo(commNo);
		vo.setQuantity(quantity);
		vo.setPrice(price);
		dao.add(vo);
	}
	//ok
	public void delete(String mallOrNo,String commNo){
		dao.delete(mallOrNo, commNo);
	}
	//ok
	public MallOrDtVO update(String mallOrNo, String commNo, Integer quantity, Integer price){
		MallOrDtVO vo =new MallOrDtVO();
		vo.setMallOrNo(mallOrNo);
		vo.setCommNo(commNo);
		vo.setQuantity(quantity);
		vo.setPrice(price);
		dao.update(vo);
		return vo;
	}
	//ok
	public List<MallOrDtVO> getAll(){
		return dao.getAll();
	}
	//ok
	public List<MallOrDtVO> getByOrNo(String mallOrNo){
		return dao.getByOrNo(mallOrNo);
	}
	//ok
	public MallOrDtVO findOneByFk(String mallOrNo,String commNo){
		return dao.findOneByFk(mallOrNo, commNo);
	}
	
	
	/**
	public static void main(String[] args) {
		MallOrDtService ser =new MallOrDtService();
		ser.add("20200603-0000001","ZM00005",1,199);
		ser.update("20200603-0000001","ZM00005",2,199);
		ser.delete("20200603-0000001","ZM00005");
		
		System.out.println(ser.getOneByFk("20200603-0000001","ZM00004").getPrice());
		List<MallOrDtVO>list=ser.getAll();
		for(MallOrDtVO vo:list)
		System.out.println(vo.getCommNo());
		
		List<MallOrDtVO>list1=ser.getByOrNo("20200603-0000001");
		for(MallOrDtVO vo:list1)
		System.out.println(vo.getCommNo());
		System.out.println(ser.getTotal("20200603-0000001"));
	}
	**/
}

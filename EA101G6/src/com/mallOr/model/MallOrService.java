package com.mallOr.model;

import java.util.List;


public class MallOrService {
	
private MallOrDAO_interface dao ;
	
	public MallOrService() {
		dao = new MallOrJDBCDAO();
	}
	
	//新增 ok
	public String add(String mbrNo, java.sql.Timestamp orDate, String take, String address, Integer status,
			Integer payStatus, Integer boxStatus) {
		MallOrVO vo = new MallOrVO();
		vo.setMbrNo(mbrNo);
		vo.setOrDate(orDate);
		vo.setTake(take);
		vo.setAddress(address);
		vo.setStatus(status);
		vo.setPayStatus(payStatus);
		vo.setBoxStatus(boxStatus);
		dao.add(vo);
		return "新增成功";
	}
	//刪除
	public String delete(String mallOrNo){
		dao.delete(mallOrNo);
		return "刪除成功";
	}
	//修改
	public String update(String mallOrNo, String mbrNo, java.sql.Timestamp orDate, String take, String address, Integer status,
			Integer payStatus, Integer boxStatus){
		MallOrVO vo = new MallOrVO();
		vo.setMallOrNo(mallOrNo);
		vo.setMbrNo(mbrNo);
		vo.setOrDate(orDate);
		vo.setTake(take);
		vo.setAddress(address);
		vo.setStatus(status);
		vo.setPayStatus(payStatus);
		vo.setBoxStatus(boxStatus);
		dao.update(vo);
		
		return "修改成功";
		
		
	}
	//ok
	public List<MallOrVO> getAll(){
		return dao.getAll();
	}
	//ok
	public List<MallOrVO> findByMbrNo(String mbrNo){
		return dao.findByMbrNo(mbrNo);
	}
	//ok
	public List<MallOrVO> findByStatus(Integer status){
		return dao.findByStatus(status);
	}
	//ok
	public MallOrVO findOneByOrNo(String mallOrNo) {
		return dao.findOneByOrNo(mallOrNo);
	}
	
	/**測試
	public static void main(String[] args) {
		MallOrService ser = new MallOrService();
		//ser.add("BM00001",new java.sql.Timestamp(new java.util.Date().getTime()),"超商取貨","330桃園市桃園區力行路7號",1,1,2);
		//ser.delete("20200605-0000013");
		//ser.update("20200605-0000013","BM00001",new java.sql.Timestamp(new java.util.Date().getTime()),"住家","330桃園市桃園區力行路7號",1,1,2);
		List<MallOrVO> list=ser.getByMbrNo("BM00001");
		for(MallOrVO vo : list)
			System.out.println(vo.getMallOrNo());
	
		System.out.println(ser.getOneByOrNo("20200605-0000013").getMbrNo());
	}
	 **/
	
}

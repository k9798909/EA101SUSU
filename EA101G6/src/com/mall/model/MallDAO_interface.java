package com.mall.model;


import java.util.List;

import com.gmType.model.GmTypeVO;

public interface MallDAO_interface {
	//新增
	public void add(MallVO mall);
	//刪除
	public void delete(String commno);
	//修改
	public void update(MallVO mall);
	//用商品名稱查詢，因為我查的可能不只一項回傳list
	public List<MallVO> findByName(String name);
	//拿全部
	public List<MallVO> getAll();
	//取得最新商品前五比
	public List<MallVO> getNew();
	
	public MallVO getOneByNo(String commno);
	
	public List<GmTypeVO> getType(String commno);
	
}

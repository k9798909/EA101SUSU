package com.buyCar.model;

import java.util.List;

import com.mall.model.MallVO;

public interface BuyCarDao_interface {

	public void add(String mbrNo,List<MallVO> mallVoList);
	public void delete();
	public void update();
	public void findByMbrNo(String MbrNo);
	
	
}

package com.mallOr.model;

import java.util.List;
import com.mallOrDt.model.MallOrDtVO;

public interface MallOrDAO_interface {

	public void add(MallOrVO mallor);
	public String add(MallOrVO mallOr,List<MallOrDtVO> mallOrDtList);
	public void update(MallOrVO mallor);
	public void delete(String mallOrNo);
	public List<MallOrVO> getAll();
	public List<MallOrVO> findByMbrNo(String mbrNo);
	public List<MallOrVO> findByStatus(Integer status);
	public List<MallOrVO> findByBoxStatus(Integer boxStatus);
	public MallOrVO findOneByOrNo(String mallOrNo);
	
	
	
	
	
}

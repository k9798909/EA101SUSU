package com.mallOr.model;

import java.util.List;
import java.util.Set;

import com.mallOrDt.model.MallOrDtVO;

public interface MallOrDAO_interface {

	public void add(MallOrVO mallor);
	public String add(MallOrVO mallOr,List<MallOrDtVO> mallOrDtList);
	public void update(MallOrVO mallor);
	public void delete(String mallOrNo);
	public Set<MallOrVO> getAll();
	public Set<MallOrVO> findByMbrNo(String mbrNo);
	public Set<MallOrVO> findByStatus(Integer status);
	public Set<MallOrVO> findByBoxStatus(Integer boxStatus);
	public MallOrVO findOneByOrNo(String mallOrNo);
	
	
	
	
	
}

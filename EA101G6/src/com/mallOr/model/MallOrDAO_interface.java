package com.mallOr.model;

import java.util.List;

public interface MallOrDAO_interface {

	public void add(MallOrVO mallor);	
	public void update(MallOrVO mallor);
	public void delete(String mallOrNo);
	public List<MallOrVO> getAll();
	public List<MallOrVO> getByMbrNo(String mbrNo);
	public List<MallOrVO> getByStatus(Integer status);
	public MallOrVO getOneByOrNo(String mallOrNo);
	
	
	
	
	
}

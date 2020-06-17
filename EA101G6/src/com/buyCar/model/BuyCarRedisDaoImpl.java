package com.buyCar.model;


import java.util.List;

import com.mall.model.MallVO;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class BuyCarRedisDaoImpl implements BuyCarDao_interface {

	@Override
	public void add(String mbrNo,List<MallVO> mallVoList) {
		// TODO Auto-generated method stub
		Jedis jedis = new Jedis("localhost", 6379);
		jedis.auth("123456");
		
		
		
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void findByMbrNo(String MbrNo) {
		// TODO Auto-generated method stub
		
	}

}

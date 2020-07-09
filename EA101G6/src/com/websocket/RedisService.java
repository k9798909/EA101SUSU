package com.websocket;
import java.util.Set;

import connectionpool.JedisUtil;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class RedisService {
	private static JedisPool pool = JedisUtil.getJedisPool();
	
	public Set<String> getUnDone(){
		Jedis jedis = pool.getResource();
		jedis.auth("123456");
		Set<String> unDoneSet = jedis.smembers("unDone");
		jedis.close();
		return unDoneSet;
	} 
	
//	public static void main(String args[]) {
//		RedisService rrr=new RedisService();
//		Set<String> set=rrr.getUnDone();
//		for(String str : set) {
//			System.out.println(str);
//		}
//		
//	}
	
	
}

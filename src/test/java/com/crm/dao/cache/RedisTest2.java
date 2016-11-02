package com.crm.dao.cache;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.ws.rs.PUT;

import org.junit.Test;

import com.crm.util.PoemUtil;



public class RedisTest2 {
	@Resource
	private RedisDao redisDao;
	
	@Test
	public void testgetPoemUtilList(){
		ArrayList<PoemUtil> poemUtils=redisDao.getRecommendPoemUtils();
		System.out.println(poemUtils);
	}
	
	@Test
	public void testPutPoemUtilList(){
		ArrayList<PoemUtil> poemUtils=new ArrayList<PoemUtil>();
		PoemUtil poemUtil1=new PoemUtil();
		poemUtil1.setPoemId(1);
		PoemUtil poemUtil2=new PoemUtil();
		poemUtil1.setPoemId(2);
		
		poemUtils.add(poemUtil1);
		poemUtils.add(poemUtil2);
		
		String result=redisDao.putRecommendPoemUtils(poemUtils);
		System.out.println(result);
	}
}

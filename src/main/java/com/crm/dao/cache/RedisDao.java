package com.crm.dao.cache;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.junit.validator.PublicClassValidator;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.crm.util.PoemUtil;
import com.crm.util.RedisUtil;
import com.dyuproject.protostuff.LinkedBuffer;
import com.dyuproject.protostuff.ProtostuffIOUtil;
import com.dyuproject.protostuff.runtime.RuntimeSchema;
import com.sun.xml.internal.messaging.saaj.util.ByteOutputStream;

import redis.clients.jedis.Jedis;

@Repository("redisDao")
public class RedisDao {
	private final Logger logger=LoggerFactory.getLogger(this.getClass());
	private String key="poemUtilList";
	private RuntimeSchema<PoemUtil> schema=RuntimeSchema.createFrom(PoemUtil.class);
	
	public ArrayList<PoemUtil> getRecommendPoemUtils(){
		List<PoemUtil> poemUtilList=null;
		Jedis jedis=null;
		try {
			 jedis=RedisUtil.getJedis();
			byte[] bytes=jedis.get(key.getBytes());
			if(bytes!=null){
				poemUtilList=ProtostuffIOUtil.parseListFrom(new ByteArrayInputStream(bytes),schema);
			}
		} catch (IOException e) {
			logger.error(e.getMessage(),e);
		}finally{
			if(jedis!=null){
				jedis.close();
			}
		}
		
		return (ArrayList<PoemUtil>) poemUtilList;
	}
	
	public String putRecommendPoemUtils(ArrayList<PoemUtil> poemUtilList){
		if(poemUtilList==null || poemUtilList.size()==0){
			return "fail";
		}
		Jedis jedis=null;
		String result="fail";
		try {
			jedis=RedisUtil.getJedis();
			LinkedBuffer linkedBuffer=LinkedBuffer.allocate(LinkedBuffer.DEFAULT_BUFFER_SIZE);
			byte[] poemUtilListBytes=null;
			ByteOutputStream byteOutputStream=null;
			int timeout=60*60;//过时时间
			byteOutputStream=new ByteOutputStream();
			ProtostuffIOUtil.writeListTo(byteOutputStream, poemUtilList, schema, linkedBuffer);
			poemUtilListBytes=byteOutputStream.getBytes();
			if(poemUtilListBytes!=null){
				result=jedis.setex(key.getBytes(), timeout, poemUtilListBytes);
				System.out.println(result);
			}
		} catch (IOException e) {
			logger.error(e.getMessage(),e);
		}finally{
			if(jedis!=null){
				jedis.close();
			}
		}
		return result;
		
		
	}
}

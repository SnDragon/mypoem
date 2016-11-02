package com.crm.dao.cache;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.crm.model.User;
import com.crm.util.RedisUtil;
import com.dyuproject.protostuff.LinkedBuffer;
import com.dyuproject.protostuff.ProtostuffIOUtil;
import com.dyuproject.protostuff.runtime.RuntimeSchema;
import com.sun.xml.internal.messaging.saaj.util.ByteOutputStream;

import redis.clients.jedis.Jedis;

public class RedisTest {
	Logger logger=LoggerFactory.getLogger(this.getClass());
	RuntimeSchema<User> schema=RuntimeSchema.createFrom(User.class);
	
	@Test
	public void putUser(){
		User user=new User();
		user.setUserId(1);
		user.setUserName("dragon");
		user.setUserEmail("18032404383@qq.com");
		
		try {
			Jedis jedis=RedisUtil.getJedis();
			String key="user:"+user.getUserId();
			byte[] bytes=ProtostuffIOUtil.toByteArray(user, schema, LinkedBuffer.allocate(LinkedBuffer.DEFAULT_BUFFER_SIZE));
			int timeout=60*60;//1小时过期
			String result=jedis.setex(key.getBytes(), timeout, bytes);
			
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void getUser(){
		Jedis jedis=RedisUtil.getJedis();
		try {
			
			String key="user:1";
			byte[] bytes=jedis.get(key.getBytes());
			if(bytes!=null){
				User user=schema.newMessage();
				ProtostuffIOUtil.mergeFrom(bytes, user, schema);
				System.out.println(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(jedis!=null){
				jedis.close();
			}
		}
	}
	
	@Test
	public void putUserList(){
		ArrayList<User> userList=new ArrayList<User>();
		
		User user=new User();
		user.setUserId(1);
		user.setUserName("dragon");
		User user2=new User();
		user2.setUserId(2);
		user2.setUserName("sn");
		userList.add(user);
		userList.add(user2);
		
		Jedis jedis=RedisUtil.getJedis();
		LinkedBuffer linkedBuffer=LinkedBuffer.allocate(LinkedBuffer.DEFAULT_BUFFER_SIZE);
		String key="userList";
		ByteOutputStream byteOutputStream=null;
		byte[] userListBytes=null;
		int timeout=60*60;
		try {
			
			byteOutputStream=new ByteOutputStream();
			ProtostuffIOUtil.writeListTo(byteOutputStream, userList, schema, linkedBuffer);
			userListBytes=byteOutputStream.getBytes();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(userListBytes!=null){
			String result=jedis.setex(key.getBytes(), timeout, userListBytes);
			System.out.println(result);
		}
		
	}
	
	@Test
	public void getUserList(){
		List<User> userList=null;
		Jedis jedis=RedisUtil.getJedis();
		String key="userList";
		byte[] bytes=jedis.get(key.getBytes());
		if(bytes==null || bytes.length==0){
			System.out.println("序列化对象为空");
			return;
		}
		
		try {
			userList=ProtostuffIOUtil.parseListFrom(new ByteArrayInputStream(bytes), schema);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(userList==null);
	}
}

package com.crm.service;

import java.util.ArrayList;

import com.crm.model.OtherPoem;
import com.crm.model.Poem;
import com.crm.util.HomeOtherPoemUtil;
import com.crm.util.HomePoemUtil;
import com.crm.util.PoemUtil;

public interface PoemService {
	
	public Poem insertPoem(Poem poem);

	public Poem getPoemById(int id);

	public ArrayList<PoemUtil> getPoemUtilsByUID(Integer uid);

	public boolean addSupport(Integer poemId);

	public boolean subSupport(Integer poemId);

	public ArrayList<PoemUtil> getRecommendPoemUtils();

	public PoemUtil getPoemUtilById(Integer userId, Integer pid);

	public boolean addTransmit(Integer poemId);

	public boolean addComment(Integer poemId);

	public boolean subComment(int poemId,int num);

	public ArrayList<PoemUtil> getPoemUtilsByUUID(Integer userId, Integer aid);

	public ArrayList<Poem> getCreationsByUId(Integer uid);

	public int getPoemNumberByUId(Integer uid);

	public ArrayList<Poem> getPoemListByPage(String page, Integer uid);

	public boolean removePoem(String poemId, String userId);

	public ArrayList<HomePoemUtil> getHomePoemUtils();

	public ArrayList<HomeOtherPoemUtil> getHomeOtherPoemUtils();

	public ArrayList<PoemUtil> getPoemUtilsByLID(Integer userId,Integer lid);

	public int getOtherPoemNumber();

	public ArrayList<OtherPoem> getOtherPoemListByPage(Integer page);

	public OtherPoem getOtherPoemById(Integer oid);

	public OtherPoem getPrevOtherPoemById(Integer oid);

	public OtherPoem getNextOtherPoemById(Integer oid);
}

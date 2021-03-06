package com.crm.dao;

import java.util.ArrayList;

import com.crm.model.OtherPoem;
import com.crm.model.Poem;
import com.crm.util.HomeOtherPoemUtil;
import com.crm.util.HomePoemUtil;
import com.crm.util.PoemUtil;

import sun.security.util.Length;

public interface PoemDao {
	public int insertPoem(Poem poem);

	public Poem getPoemById(int id);

	public ArrayList<PoemUtil> getPoemUtils();

	public int addSupport(Integer poemId);

	public int subSupport(Integer poemId);

	public PoemUtil getPoemUtilById(Integer pid);

	public int addTransmit(Integer poemId);

	public int addComment(Integer poemId);

	public int subComment(int poemId,int num);

	public ArrayList<PoemUtil> getPoemUtilsByAId(Integer aid);

	public ArrayList<Poem> getCreationsByUId(Integer uid,int begin,int length);

	public int getPoemNumberByUId(Integer uid);

	public int removePoem(Integer pid, Integer uid);

	public ArrayList<HomePoemUtil> getHomePoemUtils();

	public ArrayList<HomeOtherPoemUtil> getHomeOtherPoemUtils();

	public ArrayList<PoemUtil> getPoemUtilsByLId(Integer lid,int begin,int length);

	public int getOtherPoemNumber();

	public ArrayList<OtherPoem> getOtherPoemListByPage(int begin, int length);

	public OtherPoem getOtherPoemById(Integer oid);

	public OtherPoem getPrevOtherPoemById(Integer oid);

	public OtherPoem getNextOtherPoemById(Integer oid);

	public ArrayList<PoemUtil> getPoemListByKey(String key);

	public ArrayList<PoemUtil> getRecommendPoemUtils(int begin, int length);

	public ArrayList<PoemUtil> getPoemAndTransmitUtils(Integer uid);

	public ArrayList<PoemUtil> getPoemAndTransmitUtilsByPage(Integer uid, int begin, int poemsPerPage);


}

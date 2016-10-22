package com.crm.dao;

import java.util.ArrayList;

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


}

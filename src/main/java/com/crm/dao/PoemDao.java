package com.crm.dao;

import java.util.ArrayList;

import com.crm.model.Poem;
import com.crm.util.PoemUtil;

public interface PoemDao {
	public int insertPoem(Poem poem);

	public Poem getPoemById(int id);

	public ArrayList<PoemUtil> getPoemUtils();

	public int addSupport(Integer poemId);

	public int subSupport(Integer poemId);

	public PoemUtil getPoemUtilById(Integer userId, Integer pid);

	public int addTransmit(Integer poemId);

	public int addComment(Integer poemId);

	public int subComment(int poemId,int num);

	public ArrayList<PoemUtil> getPoemUtilsByAId(Integer aid);

}

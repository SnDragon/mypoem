package com.crm.service;

import java.util.ArrayList;

import com.crm.model.Poem;
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
}
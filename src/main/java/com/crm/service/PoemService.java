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
}

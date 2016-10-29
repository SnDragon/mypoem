package com.crm.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.crm.dao.TransmitCommentDao;
import com.crm.model.Comment;
import com.crm.service.TransmitCommentService;
import com.crm.service.TransmitService;
@Service("transmitCommentService")
public class TransmitCommentServiceImpl implements TransmitCommentService{

	@Resource
	private TransmitCommentDao transmitCommentDao;
	@Resource
	private TransmitService transmitService;
	
	@Override
	public Comment addComment(Comment comment) {
		if(comment==null){
			return null;
		}
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		comment.setCommentTime(timestamp);
		comment.setCommentThread("/");
		//此处应使用事务
		if(transmitCommentDao.insertComment(comment)>0 && transmitService.addComment(comment.getPoemId())){
			return comment;
		}else{
			return null;
		}
	}

	@Override
	public Comment addReplyComment(Comment comment) {
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		comment.setCommentTime(timestamp);
		if(transmitCommentDao.insertReplyComment(comment)>0 && transmitService.addComment(comment.getPoemId())){
			return comment;
		}else{
			return null;
		}
	}

	@Override
	public ArrayList<Comment> getCommentList(int poemId, int count) {
		int number=2;//每次要加载的评论数
		int from=2*(count-1);
		ArrayList<Comment> commentList=transmitCommentDao.getCommentList(poemId,from,number);
		for(int i=0;i<commentList.size();i++){
			Comment comment=commentList.get(i);
			String thread="/"+comment.getCommentId()+"/";
			comment.setChildren(transmitCommentDao.getChildrenCommentListByThread(poemId,thread));
		}
		return commentList;
	}

	@Override
	public int removeCommentByThread(String commentId, String commentThread, String poemId) {
		String childThread=commentThread+commentId+"/";
		int cId=Integer.parseInt(commentId);
		int pid=Integer.parseInt(poemId);
		int num=transmitCommentDao.getCommentNumberByThread(childThread);
		num+=1;
		System.out.println("number:"+num);
		if(transmitCommentDao.removeCommentById(cId)>0 && transmitService.subComment(pid, num)){
			return num;
		}
		return 0;
	}
}

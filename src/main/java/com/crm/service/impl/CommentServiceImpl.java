package com.crm.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.omg.CORBA.INTF_REPOS;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.crm.dao.CommentDao;
import com.crm.model.Comment;
import com.crm.service.CommentService;
import com.crm.service.PoemService;
@Service("commentService")
@Transactional(propagation=Propagation.REQUIRED)
public class CommentServiceImpl implements CommentService{

	@Resource
	private CommentDao commentDao;
	@Resource
	private PoemService poemService;
	
	@Override
	public Comment addComment(Comment comment) {
		if(comment==null){
			return null;
		}
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		comment.setCommentTime(timestamp);
		comment.setCommentThread("/");
		//此处应使用事务
		if(commentDao.insertComment(comment)>0 && poemService.addComment(comment.getPoemId())){
			return comment;
		}else{
			return null;
		}
	}

	@Override
	public Comment addReplyComment(Comment comment) {
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		comment.setCommentTime(timestamp);
		if(commentDao.insertReplyComment(comment)>0 && poemService.addComment(comment.getPoemId())){
			return comment;
		}else{
			return null;
		}
	}

	@Override
	public ArrayList<Comment> getCommentList(int poemId, int count) {
		int number=2;//每次要加载的评论数
		int from=2*(count-1);
		ArrayList<Comment> commentList=commentDao.getCommentList(poemId,from,number);
		for(int i=0;i<commentList.size();i++){
			Comment comment=commentList.get(i);
			String thread="/"+comment.getCommentId()+"/";
			comment.setChildren(commentDao.getChildrenCommentListByThread(poemId,thread));
		}
		return commentList;
	}

	@Override
	public int removeCommentById(String commentId,String poemId) {
		if(commentId==null || poemId==null){
			return 0;
		}
		int cId=Integer.parseInt(commentId);
		int pId=Integer.parseInt(poemId);
		int num=commentDao.removeCommentById(cId);
		if(num >0 && poemService.subComment(pId,num)){
			return num;
		}
		return 0;
	}

	@Override
	public int removeCommentByThread(String commentId, String commentThread, String poemId) {
		String childThread=commentThread+commentId+"/";
		int cId=Integer.parseInt(commentId);
		int pid=Integer.parseInt(poemId);
		int num=commentDao.getCommentNumberByThread(childThread);
		num+=1;
		System.out.println("number:"+num);
		if(commentDao.removeCommentById(cId)>0 && poemService.subComment(pid, num)){
			return num;
		}
		return 0;
	}

}

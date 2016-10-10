package com.crm.dao;

import java.util.ArrayList;

import com.crm.model.Comment;

public interface CommentDao {

	int insertComment(Comment comment);

	int insertReplyComment(Comment comment);

	ArrayList<Comment> getCommentList(int poemId, int from, int number);

	ArrayList<Comment> getChildrenCommentListByThread(int poemId, String thread);

	int removeCommentById(int commentId);

	int getCommentNumberByThread(String childThread);

}

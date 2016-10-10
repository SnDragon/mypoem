package com.crm.service;

import java.util.ArrayList;

import com.crm.model.Comment;

public interface CommentService {

	Comment addComment(Comment comment);

	Comment addReplyComment(Comment comment);

	ArrayList<Comment> getCommentList(int poemId, int count);

	int removeCommentById(String commentId,String poemId);

	int removeCommentByThread(String commentId, String commentThread, String poemId);

}

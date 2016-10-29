package com.crm.service;

import java.util.ArrayList;

import com.crm.model.Comment;

public interface TransmitCommentService {

	Comment addComment(Comment comment);

	int removeCommentByThread(String commentId, String commentThread, String poemId);

	Comment addReplyComment(Comment comment);

	ArrayList<Comment> getCommentList(int poemId, int count);

}

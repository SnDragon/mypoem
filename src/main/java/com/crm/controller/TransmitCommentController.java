package com.crm.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.model.Comment;
import com.crm.service.TransmitCommentService;

@Controller
@RequestMapping(value="/transmitComment")
public class TransmitCommentController {
	@Resource
	private TransmitCommentService transmitCommentService;
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String addComment(@RequestBody Comment comment){
		System.out.println(comment);
		Comment resultComment=transmitCommentService.addComment(comment);
		String result="";
		if(resultComment==null){
			return "{\"msg\":\"fail\"}";
		}
		int commentId=resultComment.getCommentId();
		if(commentId>0){
			result+="{\"msg\":\"success\",\"commentId\":";
			result+=commentId;
			result+=",\"commentThread\":\"";
			result+=comment.getCommentThread();
			result+="\"}";
		}else{
			result+="{\"msg\":\"fail\"}";
		}
		return result;
	}
	
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	@ResponseBody
	public String removeComment(HttpServletRequest request){
		String commentId=request.getParameter("commentId");
		String poemId=request.getParameter("poemId");
		String commentThread=request.getParameter("commentThread");
		String result="";
		System.out.println("cid:"+commentId+" poemId:"+poemId);
		int num=transmitCommentService.removeCommentByThread(commentId,commentThread,poemId);
		if(num>0){
			result+="{\"msg\":\"success\",\"num\":";
			result+=num;
			result+="}";
		}else{
			result+="{\"msg\":\"fail\"}";
		}
		return result;
	}
	
	@RequestMapping(value="addReplyComment",method=RequestMethod.POST)
	@ResponseBody
	public String addReplyComment(@RequestBody Comment comment){
		Comment resultComment=transmitCommentService.addReplyComment(comment);
		String result="";
		if(resultComment==null){
			return "{\"msg\":\"fail\"}";
		}
		int commentId=resultComment.getCommentId();
		if(commentId>0){
			result+="{\"msg\":\"success\",\"commentId\":";
			result+=commentId;
			result+=",\"commentThread\":\"";
			result+=comment.getCommentThread();
			result+="\"}";
		}else{
			result+="{\"msg\":\"fail\"}";
		}
		return result;
	}
	
	@RequestMapping(value="/getCommentList",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<Comment> getCommentList(HttpServletRequest request){
		
		System.out.println("poemId:"+request.getParameter("poemId"));
		System.out.println("count:"+request.getParameter("count"));
		int poemId=Integer.parseInt(request.getParameter("poemId"));
		int count=Integer.parseInt(request.getParameter("count"));
				
		return transmitCommentService.getCommentList(poemId,count);
	}
}

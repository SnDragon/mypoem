package com.crm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Path;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.Poem;
import com.crm.model.User;
import com.crm.service.PoemService;
import com.crm.util.PoemUtil;
import com.sun.org.apache.bcel.internal.generic.ReturnaddressType;

@Controller
@RequestMapping(value="/poem")
public class PoemController {
	@Resource
	private PoemService poemService;
	
	@ResponseBody
	@RequestMapping(value="/addPoem",method=RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public Poem fileUpload(@RequestBody Poem poem,HttpServletRequest request){
		System.out.println("before insert:"+poem);
		poem=poemService.insertPoem(poem);
		System.out.println("after insert:"+poem);
		return poem;
	}
	
	@RequestMapping(value="/imageUpload",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String imageUpload(@RequestParam("file") MultipartFile file,HttpServletRequest request){
		String uid=request.getParameter("uid");
		String result="";
		if(!file.isEmpty()){
			System.out.println("UploadPicture=====================>");
			FileOutputStream out=null;
			File filePath=null;
			System.out.println(file.getOriginalFilename());
			String fileName=file.getOriginalFilename();
			String newName=null;
			if(fileName.indexOf(".")!=-1){
				//获得图片扩展名
				String suffix=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
				if(suffix.equals("png") || suffix.equals("jpg")){
					//构建图片名
					String prefix="poem_"+uid+"_"+System.currentTimeMillis();
					newName=prefix+"."+suffix; 
					System.out.println("newName:"+newName);
				}
			}
			if(newName==null){
				return "wrong form";
			}
			try {
				if(!file.isEmpty()){
					byte[] bytes=file.getBytes();
//					filePath=new File(request.getSession().getServletContext().getRealPath("/img"));
					//由于eclipse内置配置问题，此处手动配置，实际发布时只需使用上面的就行了
					filePath=new File("D:\\javaEEd1\\mypoem\\src\\main\\webapp\\img\\poem");
					System.out.println(filePath);
					if(!filePath.exists()){
						filePath.mkdirs();
					}
					out=new FileOutputStream(filePath+"/"+newName);
					out.write(bytes);
					result=newName;
				}else{
					result="fail";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				try {
					if(out!=null){
						out.close();
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	@RequestMapping(value="/pid/{pid}",method=RequestMethod.GET)
	public ModelAndView getPoem(@PathVariable("pid")Integer pid,HttpSession session){
		User user=(User)session.getAttribute("user");
		PoemUtil poemUtil=poemService.getPoemUtilById(user.getUserId(),pid);
		System.out.println(poemUtil);
		ModelAndView modelAndView=new ModelAndView("showPoem");
		modelAndView.addObject("poemUtil",poemUtil);
		return modelAndView;
	}
	
	@RequestMapping(value="/removePoem",method=RequestMethod.POST)
	@ResponseBody
	public String removePoem(HttpServletRequest request){
		String poemId=request.getParameter("poemId");
		String userId=request.getParameter("userId");
		if(poemService.removePoem(poemId,userId)){
			return "success";
		}else{
			return "fail";
		}
	}
//	@RequestMapping(value="/getPoemListByPage")
//	@ResponseBody
//	public ArrayList<Poem> getPoemListByPage(HttpServletRequest request){
//		String page=request.getParameter("page");
//		String uid=request.getParameter("uid");
//		return poemService.getPoemListByPage(page,uid);
//	}
}

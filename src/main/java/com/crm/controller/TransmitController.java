package com.crm.controller;

import javax.annotation.Resource;
import javax.ejb.Remove;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.crm.model.Transmit;
import com.crm.service.TransmitService;

@Controller
@RequestMapping(value="/transmit")
public class TransmitController {
	@Resource
	private TransmitService transmitService;
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public String add(@RequestBody Transmit transmit){
		if(transmitService.addTransmit(transmit)){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping(value="/remove/{tid}",method=RequestMethod.POST)
	@ResponseBody
	public String removeTransmit(@PathVariable("tid") Integer transmitId){
		if(transmitService.removeTransmitById(transmitId)){
			return "success";
		}else{
			return "fail";
		}
	}
	
	
	@RequestMapping(value="/getTransmitListByPage",method=RequestMethod.GET)
	public ModelAndView getTransmitListByPage(){
		return null;
	}
	
	
}

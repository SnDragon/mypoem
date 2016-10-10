package com.crm.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
}

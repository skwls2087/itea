package com.itea.it.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.python.util.PythonInterpreter;
import org.tensorflow.*;
import com.itea.util.PageUtil;

@Controller
public class ItController {
	
	
	 	 
	    
	 

	
	@SuppressWarnings("resource")
	@RequestMapping("/it/itMain.co")
	public void  itMain(){
		System.out.println("it연구소 진입");
		PythonInterpreter interpreter;
		 
	 
	        interpreter = new PythonInterpreter();
	        interpreter.execfile("test.py");
//	        interpreter.exec("print(sum(7,8))");
	 
	    
	}
	@RequestMapping("/itLab/itTest.co")
	public void  itTest(){
		System.out.println("itTest 진입");
		
	}
	@RequestMapping("/it/itTestDetail.co")
	public void  itTestDetail(){
		System.out.println("itTestDetail 진입");
		
	}
		
	

}

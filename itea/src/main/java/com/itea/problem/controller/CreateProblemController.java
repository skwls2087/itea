package com.itea.problem.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.itea.dto.ProblemDTO;
import com.itea.problem.service.ProblemService;
import com.itea.util.FileUtil;

@Controller
@RequestMapping("/problem")
public class CreateProblemController {
	
	@Autowired
	ProblemService problemSV;
	
	//문제 출제하기
	@RequestMapping("/createProblemProc")
	public String problemMain(ProblemDTO pDTO,HttpServletRequest request,HttpSession session) throws FileNotFoundException {
		
		if(pDTO.getFile().getSize()!=0) {
			//1.첨부파일이 있다면 저장하기
			Path relativePath = Paths.get("");
	        String path = relativePath.toAbsolutePath().toString()+"/tomcat/webapps/ROOT/resources/files";
	        System.out.println("Working Directory = " + path);
	        
			Date date=new Date();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
			String today = transFormat.format(date);

			int oriName = pDTO.getFile().getOriginalFilename().lastIndexOf( "." );
			String ext = pDTO.getFile().getOriginalFilename().substring( oriName + 1 );
			
			String name=today+"."+ext;
			String saveName=FileUtil.renameTo(path, name);
			File file=new File(path,saveName);
			System.out.println(saveName+"으로 저장할게~");
			
			request.setAttribute("name", saveName);
			request.setAttribute("path", path);
			try {
				pDTO.getFile().transferTo(file);
			} catch (Exception e) {
				System.out.println("파일복사에러"+e);
			}
			pDTO.setPimg(saveName);//저장된 이름으로 pimg컬럼에 셋팅
		}
		
		int mno=(Integer) session.getAttribute("MNO");
		pDTO.setMno(mno);
		System.out.println(pDTO);
		
		if(pDTO.getPtype()==1) {
			problemSV.insertChoice(pDTO);
		}else if(pDTO.getPtype()==2) {
			problemSV.insertShort(pDTO);
		}else if(pDTO.getPtype()==3) {
			problemSV.insertEssay(pDTO);
		}
		
		System.out.println(pDTO);
		
		//return "redirect:createProblem.co";
		return "problem/createProblem";
	}
}

package com.java.sawon.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.command.Command;
import com.java.sawon.model.SawonDAO;
import com.java.sawon.model.SawonDTO;

public class ListOkCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String departmentName=request.getParameter("departmentName");
		logger.info(logMsg+"departmentName : "+departmentName);
		
		List<SawonDTO> sawonList=SawonDAO.getInstance().select(departmentName);
		logger.info(logMsg+"List size : "+sawonList.size());
		
		// List -> JSON Array(JSON 라이브러리 다운, JSON 형태 코딩 구현) -> JSP page 출력시 태그를 만듬. : Spring 할때		
		
		request.setAttribute("sawonList",sawonList);
		return "/WEB-INF/views/ajax/sawon/listOk.jsp";
	}

}

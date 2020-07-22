package com.java.fileBoard.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.java.command.Command;

public class UpdateCheckCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		logger.info(logMsg+boardNumber);
		logger.info(logMsg+pageNumber);
		
		request.setAttribute("boardNumber",boardNumber);
		request.setAttribute("pageNumber",pageNumber);
			
		return "/WEB-INF/views/fileBoard/updateCheck.jsp";
	}

}

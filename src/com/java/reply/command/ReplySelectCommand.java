package com.java.reply.command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.command.Command;
import com.java.reply.model.ReplyDAO;
import com.java.reply.model.ReplyDTO;

public class ReplySelectCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int bunho=Integer.parseInt(request.getParameter("bunho"));
		logger.info(logMsg+"bunho : "+bunho);
		
		ReplyDTO dto=ReplyDAO.getInstance().select(bunho);
		logger.info(logMsg+"dto : "+dto);
		
		if(dto!=null) {
			String str=dto.getBunho()+","+dto.getLine_reply();		
			response.setContentType("application/text;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(str);
		}
		
		return null;
	}

}

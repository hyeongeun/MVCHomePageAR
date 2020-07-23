package com.java.sawon.command;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

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
		//JSON
		JSONArray jsonArray = new JSONArray();
		if(sawonList!=null) {
			for(int i=0; i<sawonList.size(); i++){
				SawonDTO sawondDto = sawonList.get(i);
				
				JSONObject obj = new JSONObject();
				obj.put("employee_id", sawondDto.getEmployee_id());
				obj.put("first_name", sawondDto.getFirst_name());
				obj.put("job_id", sawondDto.getJob_id());
				obj.put("department_id", sawondDto.getDepartment_id());
				obj.put("department_name", sawondDto.getDepartment_name());
				
				jsonArray.add(obj);
				//logger.info(logMsg+obj);
			}
			logger.info(logMsg+jsonArray);
			
			//자바에서 만들어준거니까 text이다.
			response.setContentType("application/text;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(jsonArray);
		}
		//request.setAttribute("sawonList",sawonList);
		//return "/WEB-INF/views/ajax/sawon/listOk.jsp";
		return null;
	}

}

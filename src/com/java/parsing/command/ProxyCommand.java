package com.java.parsing.command;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;

import com.java.command.Command;

public class ProxyCommand implements Command {

	@Override
	public String proRequest(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		//프록시 서버: 시스템에 방화벽을 가지고 있는 경우 접근이 안된다. 그래서 외부와의 통신을 위해 만들어 놓은 가상서버이다. 
		//			방화벽 안쪽에 있는 서버들(기상청 홈페이지)의 외부 연결은 프록시 서버를 통해 이루어진다.  
		//외부에서 가져오는 것은 get방식이여야 한다. 
		
		
		//직접가지고 오지 못하기 때문에 proxyCommand들 통해서 가지고 와야한다. 
		String url="https://www.weather.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=109";
		GetMethod method = new GetMethod(url);
		
		HttpClient client = new HttpClient();
		int statusCode = client.executeMethod(method);
		
		//정상적인 번호는 200번 아니면 400번이 넘어와야 한다. 
		logger.info(logMsg+statusCode);
		
		if(statusCode == HttpStatus.SC_OK) {
			String result = method.getResponseBodyAsString();
			//logger.info(logMsg+result);
			
			response.setContentType("application/xml;charset=utf-8"); 		//application/text, application/json
			PrintWriter out = response.getWriter();
			out.print(result);
			
		}
		
		return null;
	}

}

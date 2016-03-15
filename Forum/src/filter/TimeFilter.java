package filter;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.util.Calendar;

public class TimeFilter implements Filter{
	public void init(FilterConfig config) throws ServletException {}
	public void destroy() {}
	
	public void doFilter(ServletRequest request, ServletResponse response,
	    FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		HttpSession session = httpRequest.getSession();
		
		if (session.getAttribute("initTime") != null){
			Calendar cal = Calendar.getInstance();
			int curr_time = cal.get(Calendar.HOUR_OF_DAY) * 3600 + // hours in second
						   cal.get(Calendar.MINUTE) * 60 + 		  // minutes in second
						   cal.get(Calendar.SECOND), 
				 initTime = (Integer)session.getAttribute("initTime"), allowance = 5;
			
			String uri = httpRequest.getRequestURI().toString().trim();
			boolean check = ((curr_time - initTime >= allowance * 60) ? true : false);
			
			if (!uri.startsWith("/logIn") && check){
				session.setAttribute("initTime", null);
				String msg = allowance + " minutes have passed since Log-In; Session has expired." ;
				httpResponse.sendRedirect("http://localhost:8078/logIn/1.Log-In.jsp?msg=" + msg);
			}
		}
		chain.doFilter(request, response);
	}
}

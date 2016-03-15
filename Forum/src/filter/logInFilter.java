package filter;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

public class logInFilter implements Filter{
	public void init(FilterConfig config) throws ServletException {}
	public void destroy() {}
	
	public void doFilter(ServletRequest request, ServletResponse response,
	    FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		HttpSession session = httpRequest.getSession();
		
		String check = (String)session.getAttribute("loggedIn"),
				 url = httpRequest.getRequestURL().toString().trim();

		if (url.equals("http://localhost:8078/")){
			httpResponse.sendRedirect("http://localhost:8078/logIn/1.Log-In.jsp");
		}
		else if (!url.contains("logIn") && (check == null || check.equals("f"))){
			String msg = "You must be logged in to access the Forum";
			httpResponse.sendRedirect("http://localhost:8078/logIn/1.Log-In.jsp?msg=" + msg);
		}
		chain.doFilter(request, response);
	}
}
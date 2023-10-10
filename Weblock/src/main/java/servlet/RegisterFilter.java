package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.getConnection;

/**
 * Servlet Filter implementation class RegisterFilter
 */
@WebFilter("/Register")
public class RegisterFilter extends HttpFilter implements Filter {
	/**
	 * @see HttpFilter#HttpFilter()
	 */
	public RegisterFilter() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		// pass the request along the filter chain
		System.out.println("filter");
		boolean emailExist = false;

		String email = request.getParameter("email");

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		try {
			Connection con = getConnection.getConnect();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from user where email='" + email + "'	");
			while (rs.next())
				emailExist = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (emailExist) {
			req.getSession(true).setAttribute("error", "**Email is already exist....!!");
			res.sendRedirect("login.jsp");
		} else {

			chain.doFilter(request, response);
			System.out.println("filter out");
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

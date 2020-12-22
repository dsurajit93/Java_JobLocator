package jl.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jl.dao.RecruiterDao;
import jl.pojo.Recruiter;

@WebServlet("/RecruiterLogin")
public class RecruiterLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		HttpSession session=request.getSession(true);
		Recruiter rct=new Recruiter();
		RecruiterDao rcd=new RecruiterDao();
		rct.setEmail(email);
		rct.setPassword(password);
		rct=rcd.checkUser(rct);
		if(rct!=null) {
			session.setAttribute("recId",rct.getId());
			session.setAttribute("recName", rct.getName());
			response.sendRedirect("Recruiter/RecruiterHome.jsp");
		}
		else {
			response.sendRedirect("Recruiter/RecruiterLogin.jsp?ok=-1");
		}
	}

}

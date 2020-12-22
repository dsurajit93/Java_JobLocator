package jl.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.dao.RecruiterDao;
import jl.pojo.Recruiter;

@WebServlet("/RecruiterRegister")
public class RecruiterRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		System.out.println(name+" "+email+" "+password);
		Recruiter rct=new Recruiter();
		RecruiterDao rcd=new RecruiterDao();
		rct.setName(name);
		rct.setEmail(email);
		rct.setPassword(password);
		boolean status=rcd.createUser(rct);
		int ok=0;
		if(status)
			ok=1;
		response.sendRedirect("Recruiter/RecruiterLogin.jsp?ok="+ok);
	}

}

package jl.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.dao.ApplicantDao;
import jl.pojo.Applicant;

@WebServlet("/ApplicantRegister")
public class ApplicantRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		System.out.println(name+" "+email+" "+password);
		Applicant app=new Applicant();
		ApplicantDao apd=new ApplicantDao();
		app.setName(name);
		app.setEmail(email);
		app.setPassword(password);
		boolean status=apd.createUser(app);
		int ok=0;
		if(status)
			ok=1;
		response.sendRedirect("Applicant/ApplicantLogin.jsp?ok="+ok);
		
	}

}

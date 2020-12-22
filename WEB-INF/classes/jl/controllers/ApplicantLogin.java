package jl.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jl.dao.ApplicantDao;
import jl.pojo.Applicant;

@WebServlet("/ApplicantLogin")
public class ApplicantLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		HttpSession session=request.getSession(true);
		Applicant app=new Applicant();
		ApplicantDao apd=new ApplicantDao();
		app.setEmail(email);
		app.setPassword(password);
		
		app=apd.checkUser(app);
		if(app!=null) {
			session.setAttribute("userId",app.getId());
			session.setAttribute("userName",app.getName());
			session.setAttribute("imageName", app.getImageName());
			response.sendRedirect("Applicant/ApplicantHome.jsp");
		}
		else {
			response.sendRedirect("Applicant/ApplicantLogin.jsp?ok=-1");
		}
	}

}

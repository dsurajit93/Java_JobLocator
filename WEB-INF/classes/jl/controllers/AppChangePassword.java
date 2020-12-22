package jl.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jl.dao.ApplicantDao;

@WebServlet("/AppChangePassword")
public class AppChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		int id=(int)session.getAttribute("userId");
		String password=request.getParameter("password");
		String newpassword=request.getParameter("newpassword");
		
		ApplicantDao apd=new ApplicantDao();
		boolean status=apd.checkPassward(id,password);	
		if(status) {
			status=apd.updatePassword(id,newpassword);
			
			if(status) {
				session.setAttribute("msg","Passward Changed Successfully");
			}
			else {
				session.setAttribute("msg","Sorry Something Wrong !! Please try again");
			}
		}
		else {
			request.setAttribute("msg","Current Passward does not match");
		}
		response.sendRedirect("Applicant/ChangePassword.jsp");
	}

}

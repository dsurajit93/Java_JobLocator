package jl.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.dao.ApplicantDao;
import jl.pojo.Applicant;

@WebServlet("/AppGetPersonalDetails")
public class AppGetPersonalDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=(int)request.getSession(false).getAttribute("userId");
		Applicant app=new Applicant();
		ApplicantDao apd=new ApplicantDao();
		app=apd.getApplicantPersonalDetails(id);
		request.setAttribute("apd",app);
		RequestDispatcher rd=request.getRequestDispatcher("/Applicant/UpdatePersonalDetails.jsp");
		rd.forward(request, response);
	}

}

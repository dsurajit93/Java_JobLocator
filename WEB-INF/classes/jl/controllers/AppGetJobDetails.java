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

@WebServlet("/AppGetJobDetails")
public class AppGetJobDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid=(int)request.getSession(false).getAttribute("userId");
		Applicant appjb=new Applicant();
		ApplicantDao apd=new ApplicantDao();
		appjb=apd.getApplicantJobDetails(uid);
		request.setAttribute("appjb",appjb);
		RequestDispatcher rd=request.getRequestDispatcher("/Applicant/UpdateJobDetails.jsp");
		rd.forward(request, response);
	}

}

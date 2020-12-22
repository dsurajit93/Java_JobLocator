package jl.controllers;

import java.io.IOException;
//import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.dao.ApplicantDao;
//import jl.pojo.Applicant;

@WebServlet("/AdminApplicantList")
public class AdminApplicantList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ArrayList<Applicant> al=new ArrayList<Applicant>();
		ApplicantDao apd=new ApplicantDao();
		request.setAttribute("applicantlist",apd.getApplicantList());
		RequestDispatcher rd=request.getRequestDispatcher("/Admin/Applicants.jsp");
		rd.forward(request,response);
	}

}

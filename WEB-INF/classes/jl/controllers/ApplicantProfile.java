package jl.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jl.dao.ApplicantDao;
import jl.pojo.Applicant;

@WebServlet("/ApplicantProfile")
public class ApplicantProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession(false);
		int id=(int)session.getAttribute("userId");
		ApplicantDao apd=new ApplicantDao();
		boolean exist=apd.checkId(id);
		
		if(exist) {
			request.setAttribute("checkId", "yes");
			Applicant appPersonal=new Applicant();
			appPersonal=apd.getApplicantPersonalDetails(id);
			request.setAttribute("appPersonal",appPersonal);
			
			Applicant appAcademic=new Applicant();
			appAcademic=apd.getApplicantAcademicDetails(id);
			request.setAttribute("appAcademic",appAcademic);
			
			Applicant appJob=new Applicant();
			appJob=apd.getApplicantJobDetails(id);
			request.setAttribute("appJob", appJob);
			
			RequestDispatcher rd=request.getRequestDispatcher("Applicant/ApplicantProfile.jsp");
			rd.forward(request, response);
		}
		else{
			request.setAttribute("checkId", "no");
			RequestDispatcher rd=request.getRequestDispatcher("Applicant/ApplicantProfile.jsp");
			rd.forward(request, response);
		}
		
	}

}

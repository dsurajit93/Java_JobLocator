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

@WebServlet("/ApplicantDetails")
public class ApplicantDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int aid=Integer.parseInt(request.getParameter("aid"));
		int rid=(int)request.getSession(false).getAttribute("recId");
		ApplicantDao apd=new ApplicantDao();
			request.setAttribute("checkId", "yes");
			Applicant appPersonal=new Applicant();
			appPersonal=apd.getApplicantPersonalDetails(aid);
			request.setAttribute("appPersonal",appPersonal);
			
			Applicant appAcademic=new Applicant();
			appAcademic=apd.getApplicantAcademicDetails(aid);
			request.setAttribute("appAcademic",appAcademic);
			
			Applicant appJob=new Applicant();
			appJob=apd.getApplicantJobDetails(aid);
			request.setAttribute("appJob", appJob);
			
			Applicant appFiles=new Applicant();
			appFiles=apd.getApplicantFileDetails(aid);
			request.setAttribute("appFiles", appFiles);
			
			RequestDispatcher rd;
			if(rid==0)
				rd=request.getRequestDispatcher("Admin/AboutApplicant.jsp");
			else
				rd=request.getRequestDispatcher("Recruiter/AboutApplicant.jsp");
			rd.forward(request, response);
	}

}

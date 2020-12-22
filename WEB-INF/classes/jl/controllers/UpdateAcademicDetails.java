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

@WebServlet("/UpdateAcademicDetails")
public class UpdateAcademicDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid=(int)request.getSession(false).getAttribute("userId");
		
		String diploma=request.getParameter("diploma");
		String bachelor=request.getParameter("bachelor");
		String master=request.getParameter("master");
		String phd=request.getParameter("phd");
		String[] acr=request.getParameterValues("t1");
		
		if(diploma!=null)
			diploma="yes";
		else
			diploma="no";
		if(bachelor!=null)
			bachelor="yes";
		else
			bachelor="no";
		if(master!=null)
			master="yes";
		else
			master="no";
		if(phd!=null)
			phd="yes";
		else
			phd="no";
		
		String qualification="";
		for(int i=0;i<acr.length;i+=5) {
			qualification+=acr[i]+","+acr[i+1]+","+acr[i+2]+","+acr[i+3]+","+acr[i+4];
			qualification+=";";
		}
		
		Applicant app=new Applicant();
		ApplicantDao apd=new ApplicantDao();
		
		app.setDiploma(diploma);
		app.setBachelor(bachelor);
		app.setMaster(master);
		app.setPhd(phd);
		app.setQualification(qualification);
		boolean status=apd.updateApplicant(app,uid);
		if(status) {
			response.sendRedirect("ApplicantProfile");
		}
		else {
			request.setAttribute("msg","something Wrong !! Please try again");
			RequestDispatcher rd=request.getRequestDispatcher("ApplicantProfile.jsp");
			rd.forward(request, response);
		}
		
	}

}

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


@WebServlet("/AppUpdateJobDetails")
public class AppUpdateJobDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] cname=request.getParameterValues("cname");
		String[] deg=request.getParameterValues("deg");
		String[] fyear=request.getParameterValues("fyear");
		String[] fmonth=request.getParameterValues("fmonth");
		String[] tyear=request.getParameterValues("tyear");
		String[] tmonth=request.getParameterValues("tmonth");
		
		String jobdetails="";
		for(int i=0;i<cname.length;i++) {
			System.out.println(cname[i]+"\t"+deg[i]+"\t"+fyear[i]+"\t"+fmonth[i]+"\t"+tyear[i]+"\t"+tmonth[i]+"\n");
			jobdetails+=cname[i]+","+deg[i]+","+fyear[i]+"-"+fmonth[i]+","+tyear[i]+"-"+tmonth[i];
			jobdetails+=";";
		}
		HttpSession session=request.getSession();
		int id=(int)session.getAttribute("userId");
		
		Applicant app=new Applicant();
		app.setId(id);
		app.setJobdetails(jobdetails);
		ApplicantDao apd=new ApplicantDao();
		boolean status=apd.updateJobProfile(app);
		if(status) {
			response.sendRedirect("ApplicantProfile");
		}
		else {
			request.setAttribute("msg", "Something wrong !!! Please Try Again");
			RequestDispatcher rd=request.getRequestDispatcher("ApplicantProfile");
			rd.forward(request, response);
		}
	}

}

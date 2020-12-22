package jl.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.dao.ApplicantDao;
import jl.dao.JobDao;

@WebServlet("/ApplyJob")
public class ApplyJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int jid=Integer.parseInt(request.getParameter("jid"));
		int rid=Integer.parseInt(request.getParameter("rid"));
		int aid=Integer.parseInt(request.getParameter("aid"));
		
		ApplicantDao apd=new ApplicantDao();
		boolean checkid=apd.checkId(aid);
		if(checkid) {
			JobDao jbd=new JobDao();
			Boolean status=jbd.applyJob(jid,rid,aid);
			if(status) {
				request.setAttribute("msg","You have successfully applied for the job");
				RequestDispatcher rd=request.getRequestDispatcher("AppJobs");
				rd.forward(request, response);
			}
			else {
				request.setAttribute("msg","You already have applied for the job");
				RequestDispatcher rd=request.getRequestDispatcher("AppJobs");
				rd.forward(request, response);
			}
		}
		else {
			request.setAttribute("msg","Please Create a JobLocator Profile First to Apply for Different Jobs.");
			RequestDispatcher rd=request.getRequestDispatcher("AppJobs");
			rd.forward(request, response);
		}
		
	}

}

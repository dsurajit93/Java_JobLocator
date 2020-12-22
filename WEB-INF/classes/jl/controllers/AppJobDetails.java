package jl.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.dao.JobDao;
import jl.pojo.Job;

@WebServlet("/AppJobDetails")
public class AppJobDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int jobid=Integer.parseInt(request.getParameter("jid"));
		
		Job jb=new Job();
		JobDao jbd=new JobDao();
		jb=jbd.getJobDetails(jobid);
		request.setAttribute("jdetails", jb);
		RequestDispatcher rd;
		if(request.getSession(false).getAttribute("admin")!="admin")
			rd=request.getRequestDispatcher("/Applicant/AppAboutJob.jsp");
		else
			rd=request.getRequestDispatcher("/Admin/AboutJob.jsp");
		rd.forward(request,response);
	}

}

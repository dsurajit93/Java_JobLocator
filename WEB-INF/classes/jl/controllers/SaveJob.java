package jl.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.dao.JobDao;


@WebServlet("/SaveJob")
public class SaveJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int jid=Integer.parseInt(request.getParameter("jid"));
		int rid=Integer.parseInt(request.getParameter("rid"));
		int aid=Integer.parseInt(request.getParameter("aid"));
		
		JobDao jbd=new JobDao();
		Boolean status=jbd.saveJob(jid,rid,aid);
		if(status) {
			request.setAttribute("msg","Job is successfully saved to your account");
			RequestDispatcher rd=request.getRequestDispatcher("AppJobs");
			rd.forward(request, response);
		}
		else {
			request.setAttribute("msg","You already saved the job");
			RequestDispatcher rd=request.getRequestDispatcher("AppJobs");
			rd.forward(request, response);
		}
	}

}

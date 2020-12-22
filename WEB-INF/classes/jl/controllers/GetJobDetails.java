package jl.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jl.dao.JobDao;
import jl.pojo.Job;

@WebServlet("/GetJobDetails")
public class GetJobDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int jid=Integer.parseInt(request.getParameter("jid"));
		HttpSession session=request.getSession(false);
		session.setAttribute("jid",jid);
		Job jb=new Job();
		JobDao jbd=new JobDao();
		jb=jbd.getJobDetails(jid);
		request.setAttribute("jdetails", jb);
		RequestDispatcher rd=request.getRequestDispatcher("/Recruiter/EditJob.jsp");
		rd.forward(request, response);
	}

}

package jl.controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.dao.JobDao;
import jl.pojo.Job;

@WebServlet("/PostedJob")
public class RecPostedJob extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rid=Integer.parseInt(request.getParameter("recId"));
		System.out.println(rid);
		ArrayList<Job> al=new ArrayList<Job>();
		JobDao jbd=new JobDao();
		al=jbd.getJobs(rid);
		request.setAttribute("jobdetails",al);
		RequestDispatcher rd=request.getRequestDispatcher("Recruiter/PostedJob.jsp");
		rd.forward(request, response);
	}

}

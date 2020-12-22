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

@WebServlet("/AppJobs")
public class AppJobs extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Job> al=new ArrayList<Job>();
		JobDao jbd=new JobDao();
		al=jbd.getAllJobs();
		request.setAttribute("alljobs", al);
		if(request.getAttribute("msg")!=null)
			request.setAttribute("msg",request.getAttribute("msg"));
		RequestDispatcher rd=request.getRequestDispatcher("/Applicant/AppJobs.jsp");
		rd.forward(request, response);
	}

}

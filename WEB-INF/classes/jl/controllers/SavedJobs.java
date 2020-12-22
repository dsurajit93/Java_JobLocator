package jl.controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jl.dao.JobDao;
import jl.pojo.Job;


@WebServlet("/SavedJobs")
public class SavedJobs extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Job> al=new ArrayList<Job>();
		
		HttpSession session=request.getSession(false);
		int aid=(int)session.getAttribute("userId");
		JobDao jbd=new JobDao();
		al=jbd.savedJobs(aid);
		request.setAttribute("savedjobs", al);;
		RequestDispatcher rd=request.getRequestDispatcher("/Applicant/SavedJobs.jsp");
		rd.forward(request, response);
	}

}

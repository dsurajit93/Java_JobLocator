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
import jl.pojo.Applicant;

@WebServlet("/CandidateSearch")
public class CandidateSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location=request.getParameter("location");
		String skill=request.getParameter("skill");
		
		ArrayList<Applicant> al=new ArrayList<Applicant>();
		JobDao jbd=new JobDao();
		al=jbd.searchCandidate(location,skill);
		request.setAttribute("sc", al);
		RequestDispatcher rd=request.getRequestDispatcher("/Recruiter/CandidateSearch.jsp");
		rd.forward(request,response);
	}

}

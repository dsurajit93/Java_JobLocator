package jl.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.dao.RecruiterDao;
import jl.pojo.Recruiter;

@WebServlet("/RecruiterDetails")
public class RecruiterDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rid=Integer.parseInt(request.getParameter("rid"));
		Recruiter rec=new Recruiter();
		RecruiterDao recd=new RecruiterDao();
		rec = recd.getRecruiterDetails(rid);
		
		request.setAttribute("recdetails", rec);
		RequestDispatcher rd;
		if(request.getSession(false).getAttribute("admin")!="admin")
			rd=request.getRequestDispatcher("Applicant/AboutRecruiter.jsp");
		else
			rd=request.getRequestDispatcher("Admin/AboutRecruiter.jsp");
			rd.forward(request, response);
	}

}

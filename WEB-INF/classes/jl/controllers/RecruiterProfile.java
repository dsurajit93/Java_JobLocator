package jl.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jl.dao.RecruiterDao;
import jl.pojo.Recruiter;

@WebServlet("/RecruiterProfile")
public class RecruiterProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession(false);
		int id=(int)session.getAttribute("recId");
		RecruiterDao rcd=new RecruiterDao();
		boolean exist=rcd.checkId(id);
		if(exist) {
			request.setAttribute("checkId", "yes");
			Recruiter rct=new Recruiter();
			rct=rcd.getRecruiterDetails(id);
			request.setAttribute("recDetails",rct);
			RequestDispatcher rd=request.getRequestDispatcher("Recruiter/RecruiterProfile.jsp");
			rd.forward(request, response);
		}
		else{
			request.setAttribute("checkId", "no");
			RequestDispatcher rd=request.getRequestDispatcher("Recruiter/RecruiterProfile.jsp");
			rd.forward(request, response);
		}
		
	}

}

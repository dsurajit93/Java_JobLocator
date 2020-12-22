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

@WebServlet("/GetRecruterProfile")
public class GetRecruterProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rid=(int)request.getSession(false).getAttribute("recId");
		
		Recruiter rec=new Recruiter();
		RecruiterDao rcd=new RecruiterDao();
		rec=rcd.getRecruiterDetails(rid);
		request.setAttribute("rd",rec);
		RequestDispatcher rd=request.getRequestDispatcher("/Recruiter/EditProfile.jsp");
		rd.forward(request, response);
	}

}

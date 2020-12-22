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

@WebServlet("/RecCreateProfile")
public class RecCreateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String headoffice=request.getParameter("headoffice");
		long cno=Long.parseLong(request.getParameter("cno"));
		String branches=request.getParameter("branch");
		String description=request.getParameter("description");
		String[] yr=request.getParameterValues("t1");
		String[] nrct=request.getParameterValues("t2");
		
		String lastrecruitment="";
		for(int i=0;i<yr.length;i++) {
			lastrecruitment+=yr[i]+","+nrct[i];
			lastrecruitment+=";";
		}
		
		HttpSession session=request.getSession(false);
		int id=(int)session.getAttribute("recId");
		Recruiter rec=new Recruiter();
		RecruiterDao rcd=new RecruiterDao();
		
		rec.setId(id);
		rec.setHeadoffice(headoffice);
		rec.setCno(cno);
		rec.setBranches(branches);
		rec.setDescription(description);
		rec.setLastrecruitment(lastrecruitment);
		
		boolean status=rcd.createRecruiter(rec);
		if(status) {
			response.sendRedirect("Recruiter/RecruiterHome.jsp");
		}
		else {
			request.setAttribute("msg", "Something Wrong !! Please Try Again");
			RequestDispatcher rd=request.getRequestDispatcher("Recruiter/RecCreateProfile.jsp");
			rd.forward(request, response);
		}
	}

}

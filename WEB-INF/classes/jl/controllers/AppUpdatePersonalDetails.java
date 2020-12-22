package jl.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jl.dao.ApplicantDao;
import jl.pojo.Applicant;

@WebServlet("/AppUpdatePersonalDetails")
public class AppUpdatePersonalDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		int id=(int)session.getAttribute("userId");
		String dob=request.getParameter("dob");
		java.sql.Date sqdob=null;
		try {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date udate=sdf.parse(dob);
			sqdob=new java.sql.Date(udate.getTime());
		}
		catch(Exception ee){
			ee.printStackTrace();
		}
		
		Applicant app=new Applicant();
		app.setName(request.getParameter("name"));
		app.setFname(request.getParameter("fname"));
		app.setAddress(request.getParameter("address"));
		app.setDob(sqdob);
		app.setMob(Long.parseLong(request.getParameter("mob")));
		app.setEmail(request.getParameter("email"));
		app.setObjective(request.getParameter("objective"));
		app.setSkill(request.getParameter("skill"));
		
		ApplicantDao apd=new ApplicantDao();
		int status=apd.updatePersonalDetails(id,app);
		if(status>0) {
			session.setAttribute("msg","Profile Updated Successfully");
			RequestDispatcher rd=request.getRequestDispatcher("ApplicantProfile");
			rd.forward(request, response);
		}
		else {
			session.setAttribute("msg","Something Wrong !! Please try again");
			RequestDispatcher rd=request.getRequestDispatcher("ApplicantProfile");
			rd.forward(request, response);
		}
	}

}

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

@WebServlet("/AppCreateProfile")
public class AppCreateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname=request.getParameter("fname");
		String dob=request.getParameter("dob");
		String addr=request.getParameter("address");
		long mob=Long.parseLong(request.getParameter("mob"));
		String objective=request.getParameter("objective");
		String skill=request.getParameter("skill");
		String diploma=request.getParameter("diploma");
		String bachelor=request.getParameter("bachelor");
		String master=request.getParameter("master");
		String phd=request.getParameter("phd");
		String[] degree=request.getParameterValues("degree");
		String[] course=request.getParameterValues("course");
		String[] ub=request.getParameterValues("ub");
		String[] marks=request.getParameterValues("marks");
		String[] pyr=request.getParameterValues("pyr");
		
		if(diploma!=null)
			diploma="yes";
		else
			diploma="no";
		if(bachelor!=null)
			bachelor="yes";
		else
			bachelor="no";
		if(master!=null)
			master="yes";
		else
			master="no";
		if(phd!=null)
			phd="yes";
		else
			phd="no";
		
		String qualification="";
		for(int i=0;i<degree.length;i++) {
			qualification+=degree[i]+","+course[i]+","+ub[i]+","+marks[i]+","+pyr[i];
			qualification+=";";
		}
		java.sql.Date sqdob=null;
		try {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date udate=sdf.parse(dob);
			sqdob=new java.sql.Date(udate.getTime());
		}
		catch(Exception ee){
			ee.printStackTrace();
		}
		
		System.out.println(fname+"\n"+sqdob+"\n"+addr+"\n"+mob+"\n"+objective+"\n"+skill+"\n"+diploma+"\n"+bachelor+"\n"+master+"\n"+phd+"\n"+qualification);
		HttpSession session=request.getSession(false);
		int id=(int)session.getAttribute("userId");
		Applicant app=new Applicant();
		ApplicantDao apd=new ApplicantDao();
		app.setId(id);
		app.setFname(fname);
		app.setDob(sqdob);
		app.setAddress(addr);
		app.setMob(mob);
		app.setObjective(objective);
		app.setSkill(skill);
		app.setDiploma(diploma);
		app.setBachelor(bachelor);
		app.setMaster(master);
		app.setPhd(phd);
		app.setQualification(qualification);
		boolean status=apd.createApplicant(app);
		if(status) {
			response.sendRedirect("Applicant/ApplicantJobDetails.jsp");
		}
		else {
			request.setAttribute("msg","something Wrong !! Please try again");
			RequestDispatcher rd=request.getRequestDispatcher("Applicant/CreateProfile.jsp");
			rd.forward(request, response);
		}
		
	}
}

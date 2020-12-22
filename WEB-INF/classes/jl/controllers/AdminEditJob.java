package jl.controllers;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jl.dao.JobDao;
import jl.pojo.Job;


@WebServlet("/AdminEditJob")
public class AdminEditJob extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		int jid=(int)session.getAttribute("jid");
		int rid=0;
		
		String jobtitle=request.getParameter("jobtitle");
		String jobdescription=request.getParameter("jobdetails");
		String joblocation=request.getParameter("jobloc");
		String postname=request.getParameter("postname");
		int vacancy=Integer.parseInt(request.getParameter("vac"));
		String diploma =request.getParameter("diploma");
		String bachelor=request.getParameter("bachelor");
		String master=request.getParameter("master");
		String phd=request.getParameter("phd");
		String qbranch=request.getParameter("qb");
		String rskill=request.getParameter("reqskill");
		int yoe=Integer.parseInt(request.getParameter("yoe"));
		String lastdate=request.getParameter("lastdate");
		String salary=request.getParameter("salary");
		
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
		
		
		System.out.println(diploma+"\t"+bachelor+"\t"+master+"\t"+phd);
		try {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date udate=sdf.parse(lastdate);
			java.sql.Date sqlastdate=new java.sql.Date(udate.getTime());
			
			Calendar cl=Calendar.getInstance();
			int year=cl.get(Calendar.YEAR);
			int month=cl.get(Calendar.MONTH)+1;
			int day=cl.get(Calendar.DATE);
			String c_date=year+"-"+month+"-"+day;
			udate=sdf.parse(c_date);
			java.sql.Date sqc_date=new java.sql.Date(udate.getTime());
			
			Job jb=new Job();
			jb.setRid(rid);
			jb.setJobtitle(jobtitle);
			jb.setJobdescription(jobdescription);
			jb.setJoblocation(joblocation);
			jb.setPostname(postname);
			jb.setVacancy(vacancy);
			jb.setDiploma(diploma);
			jb.setBachelor(bachelor);
			jb.setMaster(master);
			jb.setPhd(phd);
			jb.setQbranch(qbranch);
			jb.setRskill(rskill);
			jb.setYoe(yoe);
			jb.setC_date(sqc_date);
			jb.setLastdate(sqlastdate);
			jb.setSalary(salary);
			
			JobDao jbd=new JobDao();
			boolean status=jbd.updateJob(jb,jid);
			if(status) {
				session.setAttribute("msg","Job Details Successully Updated");
			}
			else {
				session.setAttribute("msg","Something Wrong !! Please Try Again");
				
			}
			/*RequestDispatcher rd=request.getRequestDispatcher("PostedJob?recId="+rid);
			rd.forward(request, response);*/
			response.sendRedirect("AdminPostedJob");
		}
		catch(Exception ee) {
			ee.printStackTrace();
		}
	}

}

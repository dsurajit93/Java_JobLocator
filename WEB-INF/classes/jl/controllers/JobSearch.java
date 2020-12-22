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


@WebServlet("/JobSearch")
public class JobSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Job> al=new ArrayList<Job>();
		String qry=null;
		String location=request.getParameter("location");
		String postname=request.getParameter("postname");;
		String skill=request.getParameter("skill");
		if(location.length()==0)
			location=null;
		if(postname.equals("Job For"))
			postname=null;
		if(skill.length()==0)
			skill=null;
		System.out.println(location+"\t"+postname+"\t"+skill);
		
		if((location!=null)&&(skill==null)&&(postname==null))
			qry="select * from jobdetails where joblocation like '%"+location+"%'";
		
		else if((location==null)&&(skill!=null)&&(postname==null))
			qry="select * from jobdetails where rskill like '%"+skill+"%'";
		
		else if((location==null)&&(skill==null)&&(postname!=null))
			qry="select * from jobdetails where postname like '%"+postname+"%'";
		
		else if((location!=null)&&(skill!=null)&&(postname==null))
			qry="select * from jobdetails where joblocation like '%"+location+"%' and rskill like '%"+skill+"%'";
		
		else if((location!=null)&&(skill==null)&&(postname!=null))
			qry="select * from jobdetails where joblocation like '%"+location+"%' and postname like '%"+postname+"%'";
		
		else if((location==null)&&(skill!=null)&&(postname!=null))
			qry="select * from jobdetails where rskill like '%"+skill+"%' and postname like '%"+postname+"%'";
		
		else if((location!=null)&&(skill!=null)&&(postname!=null))
			qry="select * from jobdetails where joblocation like '%"+location+"%' and rskill like '%"+skill+"%' and postname like '%"+postname+"%'";
		System.out.println(qry);
		
		JobDao jbd=new JobDao();
		al=jbd.searchJob(qry);
		if(al.size()==0)
			request.setAttribute("msg", "Sorry !! No match found for this combination");
		request.setAttribute("alljobs", al);
		RequestDispatcher rd=request.getRequestDispatcher("/Applicant/AppJobs.jsp");
		rd.forward(request, response);
		
	}

}

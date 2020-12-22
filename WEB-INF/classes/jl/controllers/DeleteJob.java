package jl.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.dao.JobDao;


@WebServlet("/DeleteJob")
public class DeleteJob extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rid=(int)request.getSession(false).getAttribute("recId");
		int jid=Integer.parseInt(request.getParameter("jid"));
		JobDao jbd=new JobDao();
		boolean status=jbd.DeleteJob(jid,rid);
		if(status)
			request.setAttribute("msg","Job Deleted Successfully");
		else
			request.setAttribute("msg","Something Wrong !! Please try again");
		RequestDispatcher rd=request.getRequestDispatcher("PostedJob?recId="+rid);
		rd.forward(request, response);
	}

}

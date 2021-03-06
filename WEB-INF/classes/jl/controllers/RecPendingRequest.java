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


@WebServlet("/RecPendingRequest")
public class RecPendingRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rid=(int)request.getSession(false).getAttribute("recId");
		int jid=Integer.parseInt(request.getParameter("jid"));
		ArrayList<Applicant> al=new ArrayList<Applicant>();
		JobDao jbd=new JobDao();
		al=jbd.getPendingApplicant(jid,rid);
		request.setAttribute("pendinglist", al);
		request.setAttribute("jid",jid);
		RequestDispatcher rd=request.getRequestDispatcher("Recruiter/PendingRequest.jsp");
		rd.forward(request, response);
	}

}

package jl.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import jl.dao.JobDao;

@WebServlet("/RecRequestApprove")
public class RecRequestApprove extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recId=(int) request.getSession(false).getAttribute("recId");
		/*int jid=(int)request.getAttribute("jid");*/
		int jid=Integer.parseInt(request.getParameter("jid"));
		System.out.println(jid);
		String[] saids=request.getParameterValues("aids");
		for(int i=0;i<saids.length;i++)
			System.out.println(saids[i]);
		Integer[] aids=new Integer[saids.length];
		int j=0;
		for(String s1: saids) {
			aids[j]=Integer.parseInt(s1);
			System.out.println(aids[j]);
			j++;
		}
		JobDao jbd=new JobDao();
		boolean status=jbd.approveRequest(jid,recId,aids);
		if(status) {
			response.sendRedirect("PostedJob?recId="+recId);
		}
	}

}

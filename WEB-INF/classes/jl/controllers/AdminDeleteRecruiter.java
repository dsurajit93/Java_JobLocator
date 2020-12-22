package jl.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.dao.RecruiterDao;

@WebServlet("/AdminDeleteRecruiter")
public class AdminDeleteRecruiter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rid=Integer.parseInt(request.getParameter("rid"));
		RecruiterDao recd=new RecruiterDao();
		boolean status=recd.DeleteAccount(rid);
		if(status)
			request.setAttribute("msg","Account Deleted Successfully");
		else
			request.setAttribute("msg","Something Wrong !! Please try again");
		RequestDispatcher rd=request.getRequestDispatcher("AdminRecruiterList");
		rd.forward(request, response);
	}

}

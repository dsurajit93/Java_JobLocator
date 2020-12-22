package jl.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.dao.ApplicantDao;

@WebServlet("/AdminDeleteApplicant")
public class AdminDeleteApplicant extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int appid=Integer.parseInt(request.getParameter("appid"));
		ApplicantDao apd=new ApplicantDao();
		boolean status=apd.DeleteAccount(appid);
		if(status)
			request.setAttribute("msg","Account Deleted Successfully");
		else
			request.setAttribute("msg","Something Wrong !! Please try again");
		RequestDispatcher rd=request.getRequestDispatcher("AdminApplicantList");
		rd.forward(request, response);
	}

}

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

@WebServlet("/JobHighlights")
public class JobHighlights extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<String> al=new ArrayList<String>();
		JobDao jbd=new JobDao();
		al=jbd.getHighlight();
		request.setAttribute("jh",al);
		RequestDispatcher rd=request.getRequestDispatcher("index.jsp?");
		rd.forward(request, response);
	}

}

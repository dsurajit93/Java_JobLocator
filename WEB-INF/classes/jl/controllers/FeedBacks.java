package jl.controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.dao.FeedbackDao;
import jl.pojo.Feedback;

@WebServlet("/FeedBacks")
public class FeedBacks extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Feedback> al=new ArrayList<Feedback>();
		FeedbackDao fd=new FeedbackDao();
		al=fd.getFeedbacks();
		request.setAttribute("fd", al);
		RequestDispatcher rd=request.getRequestDispatcher("/Admin/Feedbacks.jsp");
		rd.forward(request, response);
	}

}

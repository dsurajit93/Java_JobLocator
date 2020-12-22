package jl.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.dao.FeedbackDao;
import jl.pojo.Feedback;

@WebServlet("/feedback")
public class FeedbackStore extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Feedback fdb=new Feedback();
		fdb.setName(request.getParameter("name"));
		fdb.setEmail(request.getParameter("email"));
		fdb.setCno(Long.parseLong(request.getParameter("cn")));
		fdb.setFeedback(request.getParameter("feedback"));
		
		FeedbackDao fdao=new FeedbackDao();
		boolean status=fdao.insertFeedback(fdb);
		if(status) {
			request.setAttribute("msg","Thanks for your valuable feedback");
		}
		else
			request.setAttribute("msg","Sorry !! Something Wrong");
		
		RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		rd.forward(request,response);
	}
}

package jl.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jl.dao.AdminDao;
import jl.pojo.Admin;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		HttpSession session=request.getSession(true);
		Admin adm=new Admin();
		AdminDao add=new AdminDao();
		adm.setEmail(email);
		adm.setPassword(password);
		int id=add.checkUser(adm);
		if(id>0) {
			session.setAttribute("recId",0);
			session.setAttribute("admin","admin");
			response.sendRedirect("Admin/AdminHome.jsp");
		}
		else {
			response.sendRedirect("Admin/AdminLogin.jsp?ok=-1");
		}
	}

}

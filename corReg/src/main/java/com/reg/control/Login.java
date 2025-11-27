package com.reg.control;

import java.io.IOException;

import com.reg.model.Model;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet{
 private HttpSession session;

 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 String email = req.getParameter("email");
	 String password=req.getParameter("password");
	 session = req.getSession(true);
	 Model m=new Model();
		m.setEmail(email);
		m.setPassword(password);
		
		boolean res=m.loginStudent();
		if(res==true) {
			session.setAttribute("student_id", m.getStudent_id());
            session.setAttribute("name", m.getName());
	
			resp.sendRedirect("/corReg/home.html");
		}else {
			resp.sendRedirect("/corReg/LoginFail.html");
		}
}
}

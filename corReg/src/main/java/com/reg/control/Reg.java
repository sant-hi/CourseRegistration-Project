package com.reg.control;


import java.io.IOException;

import com.reg.model.Model;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Reg")
public class Reg extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	int student_id=Integer.parseInt(req.getParameter("student_id"));
	String name = req.getParameter("name");
	String email = req.getParameter("email");
	long phone = Long.parseLong(req.getParameter("phone"));
	String password=req.getParameter("password");
	
	Model m=new Model();
	m.setStudent_id(student_id);
	m.setPhone(phone);
	m.setEmail(email);
	m.setName(name);
	m.setPassword(password);
	
	boolean b=m.registerStudent();
	if(b==true) {
		resp.sendRedirect("/corReg/RegisterSuccess.html");
	}else {
		resp.sendRedirect("/corReg/RegisterFail.html");
	}
}

}

package com.reg.control;

import com.reg.model.Model;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/Reg")
public class Reg extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Model student = new Model();
        student.setStudent_id(Integer.parseInt(request.getParameter("student_id")));
        student.setName(request.getParameter("name"));
        student.setEmail(request.getParameter("email"));
        student.setPhone(Long.parseLong(request.getParameter("phone")));
        student.setPassword(request.getParameter("password"));

        if(student.registerStudent()) {
            response.sendRedirect("Login.html");
        } else {
            response.sendRedirect("RegisterFail.html");
        }
    }
}

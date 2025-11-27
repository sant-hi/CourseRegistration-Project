package com.reg.control;

import com.reg.model.Model;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/Login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Model student = new Model();
        student.setEmail(request.getParameter("email"));
        student.setPassword(request.getParameter("password"));

        if(student.loginStudent()) {
            HttpSession session = request.getSession();
            session.setAttribute("student", student);
            response.sendRedirect("home.html");
        } else {
            response.sendRedirect("LoginFail.html");
        }
    }
}

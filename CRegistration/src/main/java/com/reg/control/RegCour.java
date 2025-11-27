package com.reg.control;

import java.io.IOException;
import com.reg.model.Model;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RegCour")
public class RegCour extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        // Check if user is logged in
        if(session != null && session.getAttribute("student") != null) {
            int course_id = Integer.parseInt(request.getParameter("course_id"));
            Model student = (Model) session.getAttribute("student");
            student.setCourse_id(course_id);

            // Try to register student to course
            if(student.registerStudentToCourse()) {
                // Success → redirect to MyCourse page
                response.sendRedirect("cRSuccess.jsp");
            } else {
                // Failed → redirect to regFail.html
                response.sendRedirect("cRFail.html");
            }
        } else {
            // Not logged in → redirect to login page
            response.sendRedirect("Login.html");
        }
    }
}

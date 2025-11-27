package com.reg.control;

import com.reg.model.Model;
import com.reg.model.Course;
import com.reg.model.Registerations;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/MyCourse")
public class MyCourse extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session != null && session.getAttribute("student") != null) {
            Model student = (Model) session.getAttribute("student");
            Course[] myCourses = student.getStudentCoursesArray();
            request.setAttribute("myCourses", myCourses);
            request.getRequestDispatcher("myCourse.jsp").forward(request, response);
        } else {
            response.sendRedirect("Login.html");
        }
    }
}

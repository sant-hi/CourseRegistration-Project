package com.reg.control;

import com.reg.model.Model;
import com.reg.model.Course;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/ViewCourse")
public class ViewCourse extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Model m = new Model();
        Course[] courses = m.getAllCoursesArray();
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("viewCourses.jsp").forward(request, response);
    }
}

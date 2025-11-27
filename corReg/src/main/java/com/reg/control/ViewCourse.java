package com.reg.control;

import java.io.IOException;
import com.reg.model.Model;
import com.reg.model.Course;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ViewCourse")
public class ViewCourse extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Model m = new Model();
        Course[] courses = m.getAllCoursesArray();
        req.setAttribute("courses", courses);
        req.getRequestDispatcher("/viewCourses.jsp").forward(req, resp);

    }
}
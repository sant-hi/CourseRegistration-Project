package com.reg.control;


import java.io.IOException;

import com.reg.model.Course;
import com.reg.model.Model;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@WebServlet("/MyCourse")
public class MyCourse extends HttpServlet {
    private HttpSession session;

	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      session = req.getSession(false);
   
        int student_id = (int) session.getAttribute("student_id");
        Model m = new Model();
        Course[] myC = m.getStudentCoursesArray(student_id);

        req.setAttribute("myCourses", myC);
        req.getRequestDispatcher("/myCourse.jsp").forward(req, resp);
    }
}

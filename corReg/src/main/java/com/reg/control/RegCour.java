package com.reg.control;

import java.io.IOException;
import com.reg.model.Model;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RegCour")
public class RegCour extends HttpServlet {
	private HttpSession session;

	@Override
	   protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("student_id") == null) {
            resp.sendRedirect(req.getContextPath() + "/Login.html");
            return;
        }

        String courseIdParam = req.getParameter("course_id");
        if (courseIdParam == null || courseIdParam.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/cRFail.html");
            return;
        }

        try {
            int student_id = Integer.parseInt(session.getAttribute("student_id").toString());
            int course_id = Integer.parseInt(courseIdParam);

            Model m = new Model();
            m.setStudent_id(student_id);
            m.setCourse_id(course_id);
            boolean ok = m.registerStudentToCourse();

            if (ok) {
                resp.sendRedirect(req.getContextPath() + "/cRSuccess.jsp");
            } else {
                resp.sendRedirect(req.getContextPath() + "/cRFail.html");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(req.getContextPath() + "/cRFail.html");
        }
    }

}
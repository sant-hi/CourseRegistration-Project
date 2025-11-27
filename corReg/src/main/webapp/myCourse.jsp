<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.reg.model.Course" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Courses |E Learn Portal</title>
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #89f7fe, #66a6ff);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            animation: fadeIn 1.2s ease-in-out;
        }

        h2 {
            margin-top: 40px;
            font-size: 28px;
            text-transform: uppercase;
            color: #222;
            letter-spacing: 1px;
            text-align: center;
            animation: slideDown 1s ease;
        }

        table {
            width: 85%;
            border-collapse: collapse;
            margin: 30px auto;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            backdrop-filter: blur(8px);
            animation: fadeUp 1s ease;
        }

        th {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #fff;
            padding: 14px;
            font-size: 18px;
            letter-spacing: 0.5px;
        }

        td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
            color: #333;
            transition: all 0.3s ease;
        }

        tr:hover td {
            background: #eef5ff;
            transform: scale(1.01);
        }

        /* Message when no courses */
        .no-courses {
            text-align: center;
            margin-top: 60px;
            font-size: 20px;
            color: #333;
            background: rgba(255, 255, 255, 0.7);
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            animation: fadeUp 1.5s ease;
        }

        /* Navigation buttons */
        .nav-links {
            text-align: center;
            margin: 25px 0 50px 0;
        }

        .nav-links a {
            display: inline-block;
            margin: 10px;
            padding: 12px 20px;
            text-decoration: none;
            color: #fff;
            font-weight: 600;
            border-radius: 8px;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            transition: 0.3s ease;
        }

        .nav-links a:hover {
            background: linear-gradient(135deg, #185a9d, #43cea2);
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            transform: translateY(-2px);
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.97); }
            to { opacity: 1; transform: scale(1); }
        }

        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive design */
        @media screen and (max-width: 768px) {
            table {
                width: 95%;
                font-size: 14px;
            }
            th, td {
                padding: 10px;
            }
            h2 {
                font-size: 22px;
            }
        }
    </style>
</head>

<body>
<h2>My Registered Courses</h2>

<%
    Course[] myCourses = (Course[]) request.getAttribute("myCourses");
    if (myCourses != null && myCourses.length > 0) {
%>
    <table>
        <tr>
            <th>Course ID</th>
            <th>Course Name</th>
            <th>Description</th>
            <th>Seats Remaining</th>
        </tr>
        <%
            for (Course course : myCourses) {
        %>
        <tr>
            <td><%= course.getCourseId() %></td>
            <td><%= course.getCourseName() %></td>
            <td><%= course.getDescription() %></td>
            <td><%= course.getSeats() %></td>
        </tr>
        <%
            }
        %>
    </table>
<%
    } else {
%>
    <div class="no-courses">
        You are not enrolled in any courses yet.<br>
        Explore our catalog and register today!
    </div>
<%
    }
%>

<div class="nav-links">
    <a href="ViewCourse">🎓 View Courses</a>
    <a href="home.html">🏠 Home</a>
</div>

</body>
</html>

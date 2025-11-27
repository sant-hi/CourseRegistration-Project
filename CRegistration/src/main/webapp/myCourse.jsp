<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.reg.model.Course" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Courses | E Learn Portal</title>
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(120deg, rgba(37,117,252,0.7), rgba(106,17,203,0.7)),
                        url('images/pexels-fauxels-3184317.jpg') 
                        no-repeat center center/cover;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            animation: fadeIn 1.2s ease-in-out;
        }

        h2 {
            margin-top: 60px;
            font-size: 32px;
            text-transform: uppercase;
            color: #fff;
            letter-spacing: 1px;
            text-align: center;
            animation: slideDown 1s ease;
            font-weight: 700;
        }

        table {
            width: 85%;
            border-collapse: collapse;
            margin: 40px auto;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(8px);
            animation: fadeUp 1s ease;
        }

        th {
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            color: #fff;
            padding: 16px;
            font-size: 18px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
            color: #333;
            transition: all 0.3s ease;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover td {
            background: #eef3ff;
            transform: scale(1.01);
        }

        .no-courses {
            text-align: center;
            margin-top: 80px;
            font-size: 20px;
            color: #fff;
            background: rgba(255, 255, 255, 0.15);
            padding: 25px 50px;
            border-radius: 12px;
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.2);
            animation: fadeUp 1.5s ease;
            backdrop-filter: blur(5px);
        }

        .nav-links {
            text-align: center;
            margin: 40px 0 60px 0;
        }

        .nav-links a {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin: 10px;
            padding: 12px 24px;
            text-decoration: none;
            color: #fff;
            font-weight: 600;
            border-radius: 10px;
            background: linear-gradient(135deg, #185a9d, #43cea2);
            transition: all 0.3s ease;
        }

        .nav-links a:hover {
            background: linear-gradient(135deg, #43cea2, #185a9d);
            box-shadow: 0px 5px 18px rgba(0, 0, 0, 0.3);
            transform: translateY(-3px);
        }

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

        @media screen and (max-width: 768px) {
            table {
                width: 95%;
                font-size: 14px;
            }
            th, td {
                padding: 10px;
            }
            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>

<body>
    <h2><i class="fa-solid fa-book-open"></i> My Registered Courses</h2>

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
                <td><%= course.getCourse_id() %></td>
                <td><%= course.getCourse_name() %></td>
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
            <i class="fa-solid fa-circle-info"></i> You are not enrolled in any courses yet.<br>
            Explore our catalog and register today!
        </div>
    <%
        }
    %>

    <div class="nav-links">
        <a href="ViewCourse"><i class="fa-solid fa-graduation-cap"></i> View Courses</a>
        <a href="home.html"><i class="fa-solid fa-house"></i> Home</a>
    </div>

</body>
</html>

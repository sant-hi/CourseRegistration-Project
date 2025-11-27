<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.reg.model.Course" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Available Courses | E Learn Portal</title>

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(120deg, rgba(37,117,252,0.6), rgba(106,17,203,0.6)),
                        url('images/pexels-enginakyurt-2946979.jpg')
                        no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            color: #333;
            animation: fadeIn 1s ease-in-out;
        }

        /* ===== Title ===== */
        h2.page-title {
            text-align: center;
            margin: 60px 0 40px;
            font-size: 36px;
            color: #fff;
            letter-spacing: 1px;
            text-transform: uppercase;
            font-weight: 700;
            position: relative;
            display: inline-block;
            animation: slideDown 1s ease forwards;
        }

        h2.page-title::after {
            content: "";
            display: block;
            width: 100px;
            height: 4px;
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            margin: 10px auto 0;
            border-radius: 2px;
        }

        h2.page-title i {
            color: #43cea2;
            margin-right: 12px;
            animation: bounce 1.8s infinite;
        }

        /* ===== Grid Layout ===== */
        .course-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(270px, 1fr));
            gap: 30px;
            padding: 30px 70px;
        }

        /* ===== Course Card ===== */
        .course-card {
            background: rgba(255, 255, 255, 0.92);
            border-radius: 16px;
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            text-align: left;
            padding: 25px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            backdrop-filter: blur(8px);
        }

        .course-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
        }

        .course-card h3 {
            color: #2575fc;
            font-size: 22px;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .course-card span {
            display: block;
            font-weight: 600;
            margin-bottom: 10px;
            color: #444;
        }

        .course-card p {
            font-size: 15px;
            color: #555;
            margin-bottom: 12px;
            line-height: 1.6;
            max-height: 70px;
            overflow: hidden;
            transition: max-height 0.3s ease;
        }

        .course-card p.expanded {
            max-height: 500px;
        }

        .read-more {
            color: #185a9d;
            cursor: pointer;
            font-weight: 600;
            font-size: 14px;
            text-decoration: underline;
        }

        .register-btn {
            display: inline-block;
            margin-top: 10px;
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            color: #fff;
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 25px;
            font-weight: 600;
            font-size: 14px;
            transition: 0.3s ease;
        }

        .register-btn:hover {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            transform: scale(1.07);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.25);
        }

        /* ===== No Courses Message ===== */
        .no-courses {
            text-align: center;
            font-size: 20px;
            margin-top: 70px;
            color: #fff;
            background: rgba(255, 255, 255, 0.15);
            display: inline-block;
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.25);
            backdrop-filter: blur(6px);
        }

        /* ===== Navigation Links ===== */
        .nav-links {
            text-align: center;
            margin: 50px 0 70px 0;
        }

        .nav-links a {
            margin: 10px;
            padding: 12px 22px;
            border-radius: 10px;
            background: linear-gradient(135deg, #185a9d, #43cea2);
            color: #fff;
            text-decoration: none;
            font-weight: 600;
            font-size: 15px;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
        }

        .nav-links a:hover {
            background: linear-gradient(135deg, #43cea2, #185a9d);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.25);
        }

        /* ===== Animations ===== */
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.97); }
            to { opacity: 1; transform: scale(1); }
        }

        @keyframes slideDown {
            from { opacity: 0; transform: translateY(-25px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-8px); }
        }

        /* ===== Responsive ===== */
        @media screen and (max-width: 768px) {
            h2.page-title {
                font-size: 26px;
                margin: 40px 0 20px;
            }

            .course-container {
                padding: 20px;
                gap: 20px;
            }

            .course-card {
                padding: 18px;
            }
        }
    </style>

    <script>
        function toggleReadMore(element) {
            const paragraph = element.previousElementSibling;
            paragraph.classList.toggle("expanded");
            element.textContent = paragraph.classList.contains("expanded") ? "Read Less" : "Read More";
        }
    </script>
</head>

<body>

    <h2 class="page-title"> Available Courses</h2>

    <%
        Course[] courses = (Course[]) request.getAttribute("courses");
        if (courses != null && courses.length > 0) {
    %>

    <div class="course-container">
        <%
            for (Course course : courses) {
        %>
        <div class="course-card">
            <h3><i class="fa-solid fa-chalkboard-teacher"></i> <%= course.getCourse_name() %></h3>
            <span><i class="fa-solid fa-users"></i> Seats Available: <%= course.getSeats() %></span>
            <p><%= course.getDescription() %></p>
            <span class="read-more" onclick="toggleReadMore(this)">Read More</span><br>
            <a class="register-btn" href="<%= session.getAttribute("student") != null ? "RegCour?course_id=" + course.getCourse_id() : "Login.html" %>">
                <i class="fa-solid fa-clipboard-check"></i> Register
            </a>
        </div>
        <%
            }
        %>
    </div>

    <%
        } else {
    %>
    <p class="no-courses"><i class="fa-solid fa-circle-info"></i> No courses available at the moment. Please check back later.</p>
    <%
        }
    %>

    <div class="nav-links">
        <a href="home.html"><i class="fa-solid fa-house"></i> Home</a>
        <a href="MyCourse"><i class="fa-solid fa-graduation-cap"></i> My Courses</a>
    </div>

</body>
</html>

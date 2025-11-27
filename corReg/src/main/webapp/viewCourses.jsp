<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.reg.model.Course" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Available Courses | E Learn Portal</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #89f7fe, #66a6ff);
            margin: 0;
            padding: 0;
            color: #333;
            animation: fadeIn 1s ease-in-out;
        }
        
         h2.page-title {
    text-align: center;
    margin: 50px 0 30px;
    font-size: 36px;
    color: #2575fc;
    letter-spacing: 1px;
    text-transform: uppercase;
    position: relative;
    display: inline-block;
    font-weight: 700;
    transition: all 0.3s ease;
    animation: slideDown 1s ease forwards;
}

/* Gradient underline */
h2.page-title::after {
    content: "";
    display: block;
    width: 80px;
    height: 4px;
    background: linear-gradient(135deg, #6a11cb, #2575fc);
    margin: 10px auto 0 auto;
    border-radius: 2px;
}

/* Hover effect on title */
h2.page-title:hover {
    color: #6a11cb;
    transform: scale(1.05);
}

/* Optional icon animation */
h2.page-title span.icon {
    display: inline-block;
    margin-right: 10px;
    animation: bounce 1.5s infinite;
}

/* Bounce animation for icon */
@keyframes bounce {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-10px); }
}

/* Slide down animation for title */
@keyframes slideDown {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
}

        h2 {
            text-align: center;
            margin: 40px 0 20px;
            font-size: 32px;
            color: #222;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .course-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            padding: 40px 60px;
        }

        .course-card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.15);
            overflow: hidden;
            text-align: left;
            padding: 20px;
            transition: 0.3s ease;
            position: relative;
        }

        .course-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.25);
        }

        .course-card h3 {
            color: #2575fc;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .course-card span {
            display: block;
            font-weight: 600;
            margin-bottom: 10px;
            color: #444;
        }

        .course-card p {
            font-size: 14px;
            color: #555;
            margin-bottom: 15px;
            max-height: 60px;
            overflow: hidden;
            transition: max-height 0.3s ease;
        }

        .course-card p.expanded {
            max-height: 500px; /* adjust if needed */
        }

        .course-card .read-more {
            color: #2575fc;
            cursor: pointer;
            font-weight: bold;
            font-size: 14px;
            text-decoration: underline;
        }

        .course-card a.register-btn {
            display: inline-block;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #fff;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: bold;
            transition: 0.3s;
            font-size: 14px;
        }

        .course-card a.register-btn:hover {
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        .no-courses {
            text-align: center;
            font-size: 20px;
            margin-top: 50px;
            color: #444;
        }

        .nav-links {
            text-align: center;
            margin: 40px 0;
        }

        .nav-links a {
            margin: 10px;
            padding: 10px 20px;
            border-radius: 8px;
            background: linear-gradient(135deg, #43cea2, #185a9d);
            color: #fff;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s;
        }

        .nav-links a:hover {
            background: linear-gradient(135deg, #185a9d, #43cea2);
            transform: scale(1.05);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.97); }
            to { opacity: 1; transform: scale(1); }
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
<h2 class="page-title"><span class="icon">📚</span>Available Courses</h2>


<%
    Course[] courses = (Course[]) request.getAttribute("courses");
    if (courses != null && courses.length > 0) {
%>

<div class="course-container">
    <%
        for (Course course : courses) {
    %>
    <div class="course-card">
        <h3><%= course.getCourseName() %></h3>
        <span>Seats Available: <%= course.getSeats() %></span>
        <p><%= course.getDescription() %></p>
        <span class="read-more" onclick="toggleReadMore(this)">Read More</span>
        <a class="register-btn" href="RegCour?course_id=<%= course.getCourseId() %>">Register</a>
    </div>
    <%
        }
    %>
</div>

<%
    } else {
%>
<p class="no-courses">No courses available at the moment. Please check back later.</p>
<%
    }
%>

<div class="nav-links">
    <a href="home.html">🏠 Home</a>
    <a href="MyCourse">🎓 My Courses</a>
   
</div>

</body>
</html>

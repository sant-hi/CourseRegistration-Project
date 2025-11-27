<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Course Registration Success</title>
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #43cea2, #185a9d);
        color: #fff;
        margin: 0;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        animation: fadeIn 1.2s ease-in;
    }

    .container {
        background: rgba(255, 255, 255, 0.15);
        backdrop-filter: blur(12px);
        padding: 50px 70px;
        border-radius: 20px;
        text-align: center;
        box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        animation: slideUp 1.2s ease;
    }

    h2 {
        font-size: 30px;
        margin-bottom: 15px;
        animation: bounce 1.5s infinite alternate;
    }

    .checkmark {
        font-size: 60px;
        color: #4eff90;
        display: inline-block;
        animation: pop 1s ease-in-out;
    }

    p {
        font-size: 18px;
        margin: 10px 0;
    }

    a {
        display: inline-block;
        margin: 15px 10px;
        padding: 12px 25px;
        border-radius: 30px;
        text-decoration: none;
        font-weight: bold;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        color: #fff;
        transition: 0.3s ease;
    }

    a:hover {
        background: linear-gradient(135deg, #2575fc, #6a11cb);
        transform: scale(1.05);
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }

    /* Animations */
    @keyframes fadeIn {
        from { opacity: 0; transform: scale(0.95); }
        to { opacity: 1; transform: scale(1); }
    }

    @keyframes slideUp {
        from { opacity: 0; transform: translateY(50px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes pop {
        0% { transform: scale(0); opacity: 0; }
        100% { transform: scale(1); opacity: 1; }
    }

    @keyframes bounce {
        from { transform: translateY(0px); }
        to { transform: translateY(-5px); }
    }

    @media screen and (max-width: 600px) {
        .container {
            width: 80%;
            padding: 30px;
        }
        h2 {
            font-size: 24px;
        }
        a {
            padding: 10px 20px;
        }
    }
</style>
</head>
<body>

<div class="container">
    <div class="checkmark">✔</div>
    <h2>Course Registration Successful!</h2>
    <p>Your course has been successfully registered.</p>
    <p>
        <a href="MyCourse">🎓 View My Courses</a>
        <a href="ViewCourse">📚 Back to Courses</a>
        <a href="home.html">🏠 Home</a>
    </p>
</div>

</body>
</html>

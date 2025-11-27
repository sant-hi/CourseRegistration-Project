<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Course Registration Success | E-Learn Portal</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    /* --- Global Styles --- */
    body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        color: #fff;
        overflow: hidden;
    }

    /* --- Glassy Container --- */
    .container {
        position: relative;
        background: rgba(255,255,255,0.12);
        backdrop-filter: blur(14px);
        padding: 50px 60px;
        border-radius: 20px;
        text-align: center;
        box-shadow: 0 15px 35px rgba(0,0,0,0.25);
        width: 400px;
        animation: fadeInUp 1s ease forwards;
    }

    /* --- Success Icon --- */
    .checkmark {
        font-size: 70px;
        color: #4eff90;
        display: block;
        margin: 0 auto 20px auto;
        animation: pop 0.8s ease-in-out;
    }

    h2 {
        font-size: 28px;
        margin-bottom: 15px;
        color: #fff;
        text-shadow: 1px 2px 6px rgba(0,0,0,0.3);
    }

    p {
        font-size: 16px;
        margin-bottom: 25px;
        color: #e6e6e6;
    }

    /* --- Buttons --- */
    .btn {
        display: inline-block;
        margin: 8px 6px;
        padding: 12px 25px;
        border-radius: 50px;
        font-weight: 600;
        text-decoration: none;
        color: #fff;
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        box-shadow: 0 6px 18px rgba(0,0,0,0.25);
        transition: all 0.3s ease;
    }

    .btn i {
        margin-right: 8px;
    }

    .btn:hover {
        background: linear-gradient(135deg, #2575fc, #6a11cb);
        transform: translateY(-3px) scale(1.05);
        box-shadow: 0 10px 25px rgba(0,0,0,0.35);
    }

    /* --- Animations --- */
    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(50px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes pop {
        0% { transform: scale(0); opacity: 0; }
        100% { transform: scale(1); opacity: 1; }
    }

    /* --- Responsive --- */
    @media screen and (max-width: 600px) {
        .container {
            width: 90%;
            padding: 35px 25px;
        }
        h2 {
            font-size: 24px;
        }
        .btn {
            padding: 10px 18px;
            font-size: 14px;
        }
        .checkmark {
            font-size: 50px;
        }
    }
</style>
</head>
<body>

<div class="container">
    <div class="checkmark"><i class="fa-solid fa-circle-check"></i></div>
    <h2>Course Registration Successful!</h2>
    <p>Your course has been successfully registered. You can now view your courses or continue exploring new ones.</p>
    
    <a href="MyCourse" class="btn"><i class="fa-solid fa-graduation-cap"></i> View My Courses</a>
    <a href="ViewCourse" class="btn"><i class="fa-solid fa-book-open"></i> Back to Courses</a>
    <a href="home.html" class="btn"><i class="fa-solid fa-house"></i> Home</a>
</div>

</body>
</html>

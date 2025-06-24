<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login Modules</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #0f2027;
            color: white;
        }

        .navbar-custom {
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
        }

        .hero {
            background: url('https://i.pinimg.com/736x/64/a4/c2/64a4c212a61a5c47f4b859d4b2046d0c.jpg') center center/cover no-repeat;
            height: 100vh;
            position: relative;
        }

        .hero-overlay {
            background: rgba(0, 0, 0, 0.6);
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            text-align: center;
        }

        .hero h1 {
            font-size: 3rem;
            font-weight: bold;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .login-section {
            padding: 50px 20px;
            background: #1c1f2e;
        }

        .card {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            padding: 30px 20px;
            color: white;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(10px);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.5);
        }

        .icon i {
            font-size: 50px;
            color: #fff;
            background: linear-gradient(to right, #ff6a00, #ee0979);
            padding: 20px;
            border-radius: 50%;
            margin-bottom: 15px;
        }

        footer {
            background-color: #111;
            color: #ccc;
            text-align: center;
            padding: 15px 0;
            font-size: 14px;
        }

        .dropdown-menu a:hover {
            background-color: #007bff;
            color: #fff !important;
        }

        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom shadow-sm">
        <div class="container-fluid px-4">
            <a class="navbar-brand fw-bold" href="#">My Portal</a>
            <div class="ms-auto">
                <div class="dropdown">
                    <button class="btn btn-outline-light dropdown-toggle" type="button" id="loginDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        Select Login
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="loginDropdown">
                        <li><a class="dropdown-item" href="StudentLogin">Student Login</a></li>
                        <li><a class="dropdown-item" href="PraticalInchargeLogin">Practical In-Charge</a></li>
                        <li><a class="dropdown-item" href="AdminLogin">Admin Login</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <!-- Fullscreen Image Section -->
    <section class="hero">
        <div class="hero-overlay">
            <h1>MGM'S COLLEGE OF CS & IT NANDED</h1>
            <p class="text-light mt-2">Empower yourself through knowledge</p>
        </div>
    </section>

    <!-- Login Cards Section -->
   
    <!-- Footer -->
    <footer>
        <p>© 2024 MGM Brand. All rights reserved. | Designed with ❤️</p>
    </footer>

    <!-- Bootstrap Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>

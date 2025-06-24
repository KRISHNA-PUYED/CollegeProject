<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Welcome Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
            min-height: 100vh;
            background-attachment: fixed;
            background-size: cover;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
        }

        .nav-link {
            color: #ffffff !important;
            font-size: 18px;
            font-weight: 500;
            transition: 0.3s ease-in-out;
        }

        .nav-link:hover {
            color: #00ffd5 !important;
            text-shadow: 0 0 10px #00ffd5;
        }

        .welcome-card {
            max-width: 650px;
            margin: 100px auto;
            padding: 50px 30px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            box-shadow: 0 0 30px rgba(0, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            text-align: center;
        }

        .highlighted-name {
            font-size: 3rem;
            font-weight: bold;
            background: linear-gradient(270deg, #ff6ec4, #7873f5, #4ade80, #00f0ff, #ff6ec4);
            background-size: 1000% 1000%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: rainbowText 10s linear infinite;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        @keyframes rainbowText {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .subtitle {
            font-size: 1.3rem;
            margin-top: 15px;
            color: rgba(255, 255, 255, 0.85);
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.5);
        }

        .btn-custom {
            margin-top: 30px;
            padding: 12px 35px;
            font-size: 1.2rem;
            font-weight: bold;
            background: transparent;
            color: #00ffd5;
            border: 2px solid #00ffd5;
            border-radius: 30px;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 0 10px #00ffd5, 0 0 20px #00ffd5 inset;
        }

        .btn-custom:hover {
            background-color: #00ffd5;
            color: #000;
            box-shadow: 0 0 15px #00ffd5, 0 0 25px #00ffd5;
            transform: scale(1.05);
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark px-4">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold text-white" href="#">Student Panel</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="StudentLogout/${suid}/${subject}" class="nav-link">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Welcome Card -->
    <div class="welcome-card">
        <h1 class="highlighted-name">Welcome ${stuname}</h1>
        <p class="subtitle">Class: ${stuclass}</p>
        <p class="subtitle">Batch: ${stubatch}</p>
        <p class="subtitle">Practical Subject: ${subject}</p>
        <a href="https://krishna-puyed.github.io/CodingProApp/CodingPro.html" class="btn btn-custom">Get Started</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

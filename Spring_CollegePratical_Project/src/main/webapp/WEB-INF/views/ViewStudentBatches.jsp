<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Batch Data</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    
    <style>
        body {
            background: linear-gradient(to right, #141e30, #243b55);
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
            min-height: 100vh;
        }

        .navbar {
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
        }

        .navbar-brand, .nav-link {
            color: white !important;
            font-weight: 600;
        }

        .main-container {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 15px;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            backdrop-filter: blur(10px);
            padding: 30px;
            width: 100%;
            max-width: 700px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }

        table {
            color: #fff;
            text-align: center;
        }

        th {
            background: rgba(255, 255, 255, 0.2);
            font-size: 1rem;
        }

        td {
            background-color: rgba(255, 255, 255, 0.05);
        }

        .btn-view {
            border-radius: 30px;
            font-weight: 500;
        }

        .btn-view:hover {
            background: #17a2b8;
            color: white;
        }

        .count-box {
            text-align: center;
            margin-top: 20px;
            font-size: 1.3rem;
            font-weight: bold;
            color: #ffe082;
        }

        @media (max-width: 768px) {
            .glass-card {
                padding: 20px;
            }

            table {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            👥 Batch: ${stubatch}
        </a>
        <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon text-white"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <span class="nav-link">📘 Subject: <strong>${subject}</strong></span>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="main-container">
    <div class="glass-card">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Name</th>
                    <th>Profile</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${sbatch}" var="stu">
                    <tr>
                        <td>${stu.suid}</td>
                        <td>${stu.sname}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/viewstudentprofile/${stu.suid}/${subject}/${stu.sname}/${stubatch}"
                               class="btn btn-outline-info btn-view">
                                <i class="bi bi-person-lines-fill"></i> View
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Count -->
<div class="count-box">
    👨‍🎓 Total Students: ${scount}
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student View Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #1f4037, #99f2c8);
            font-family: 'Segoe UI', sans-serif;
            color: #333;
            margin: 0;
        }

        .navbar-gradient {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        .navbar-brand {
            font-weight: 600;
            font-size: 1.7rem;
            color: #fff !important;
        }

        .nav-link {
            color: #fff !important;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: #ffd700 !important;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            color: white;
            width: 90%;
            max-width: 800px;
            margin: 40px auto;
        }

        table {
            color: #fff;
        }

        th {
            background: rgba(0,0,0,0.4);
        }

        td {
            background: rgba(255,255,255,0.05);
        }

        .btn-print {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 50px;
            font-weight: bold;
            transition: all 0.3s ease-in-out;
        }

        .btn-print:hover {
            background: linear-gradient(to right, #0072ff, #00c6ff);
            transform: scale(1.05);
        }

        footer {
            background: #343a40;
            color: #fff;
            padding: 15px 0;
            font-size: 0.95rem;
            position: relative;
            bottom: 0;
            width: 100%;
            margin-top: 40px;
        }

        @media (max-width: 768px) {
            .navbar-brand {
                font-size: 1.2rem;
            }
            .glass-card {
                padding: 15px;
            }
        }
    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-gradient navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">👨‍🎓 ${stuname}</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#">ID: ${stuId}</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Subject: ${sub}</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Attendance Glass Card -->
<div id="printSection" class="glass-card">
    <table class="table table-bordered text-center">
        <thead>
            <tr>
                <th colspan="2">Name: ${stuname}</th>
            </tr>
            <tr>
                <th>Student ID: ${stuId}</th>
                <th>Subject: ${sub}</th>
            </tr>
            <tr>
                <th>Practical Date</th>
                <th>Attendance</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${stuAtt}" var="list">
                <tr>
                    <td>${list.pdate}</td>
                    <td>${list.attendance}</td>
                </tr>
            </c:forEach>
            <tr>
                <th>Total Practical</th>
                <td>${total}</td>
            </tr>
            <tr>
                <th>Present</th>
                <td>${present}</td>
            </tr>
            <tr>
                <th>Absent</th>
                <td>${stuabs}</td>
            </tr>
            <tr>
                <th>Percentage</th>
                <td>${percentage}%</td>
            </tr>
        </tbody>
    </table>
</div>

<!-- Download Button -->
<div class="text-center mt-3 no-print">
    <button class="btn btn-print" onclick="printData()"><i class="bi bi-download"></i> Download</button>
</div>

<!-- Footer -->
<footer class="text-center">
    <p>© 2024 MGM Brand. All Rights Reserved.</p>
</footer>

<script>
    function printData() {
        const printContents = document.getElementById('printSection').innerHTML;
        const originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
        location.reload();
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

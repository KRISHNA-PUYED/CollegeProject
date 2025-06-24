<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Teacher Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #667eea, #764ba2);
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.8);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        .navbar-brand {
            color: #ffffff !important;
            font-size: 1.7rem;
            font-weight: 600;
        }

        .btn-login {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            border: none;
            color: white;
            padding: 0.5rem 1.5rem;
            border-radius: 30px;
            transition: 0.3s;
        }

        .btn-login:hover {
            background: linear-gradient(to right, #0072ff, #00c6ff);
        }

        .main-content {
            flex: 1; /* This pushes footer to bottom */
            padding: 40px 20px;
        }

        table {
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            vertical-align: middle;
        }

        th {
            background-color: rgba(0, 0, 0, 0.6);
            color: #fff;
            font-size: 1rem;
        }

        td a.btn {
            font-size: 0.875rem;
            border-radius: 30px;
        }

        .footer {
            background: #222;
            color: #fff;
            padding: 15px 0;
            font-size: 0.9rem;
        }

        .footer p {
            margin: 0;
        }

        @media (max-width: 768px) {
            .navbar-brand {
                font-size: 1.2rem;
            }
            table {
                font-size: 0.85rem;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">👨‍🏫 Welcome ${teaname}</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <a href="GoHome" class="btn btn-login">Logout</a>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container main-content">
    <div class="table-responsive">
        <table class="table table-bordered table-hover text-center align-middle">
            <thead>
                <tr>
                    <th>Practical Subject</th>
                    <th>Student Class</th>
                    <th>Student Batch</th>
                    <th>View Students</th>
                    <th>Check Attendance</th>
                    <th>Mark Attendance</th>
                    <th>Add Practical Date</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${logteadata}" var="log">
                    <tr>
                        <td>${log.subject}</td>
                        <td>${log.sclass}</td>
                        <td>${log.sbatch}</td>
                        <td><a href="studentbatch/${log.sbatch}/${log.subject}" class="btn btn-outline-light">View</a></td>
                        <td><a href="attendance/${log.sbatch}/${log.subject}" class="btn btn-outline-warning">Check</a></td>
                        <td><a href="${pageContext.request.contextPath}/CheckAtt/${log.subject}/${log.sbatch}" class="btn btn-outline-success">Mark</a></td>
                        <td><a href="${pageContext.request.contextPath}/databatch/${log.sbatch}/${log.subject}" class="btn btn-outline-primary">Assign</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Footer -->
<footer class="footer text-center">
    <div class="container">
        <p>© 2024 MGM Brand. All Rights Reserved.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

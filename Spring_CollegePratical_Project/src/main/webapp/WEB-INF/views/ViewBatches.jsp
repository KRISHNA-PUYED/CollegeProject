<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Batches Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #9face6);
            font-family: 'Segoe UI', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .custom-navbar {
            background: rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
        }

        .navbar-brand {
            font-weight: bold;
            font-size: 1.6rem;
            color: white;
        }

        .box {
            padding: 30px;
            margin-top: 30px;
            width: 95%;
            max-width: 1100px;
            margin-left: auto;
            margin-right: auto;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        table {
            background-color: white;
            color: #000;
            border-radius: 10px;
            overflow: hidden;
            text-align: center;
        }

        thead th {
            background: linear-gradient(45deg, #00c6ff, #0072ff);
            color: white;
            font-weight: bold;
        }

        .btn-warning {
            border-radius: 10px;
            font-weight: bold;
        }

        .btn-warning:hover {
            background-color: #e69500;
            color: #fff;
        }

        .btn-primary {
            margin-top: 25px;
            border-radius: 12px;
            font-weight: bold;
            background: linear-gradient(to right, #0072ff, #00c6ff);
            border: none;
        }

        .btn-primary:hover {
            background: linear-gradient(to right, #005bea, #00aaff);
        }

        footer {
            background-color: #212529;
            color: white;
            padding: 12px 0;
        }

        @media (max-width: 768px) {
            .box {
                padding: 20px 10px;
            }

            .navbar-brand {
                font-size: 1.3rem;
            }

            table {
                font-size: 0.9rem;
            }

            .btn-primary {
                width: 100%;
            }
        }
    </style>
</head>

<body class="d-flex flex-column min-vh-100">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg custom-navbar shadow-sm">
        <div class="container-fluid justify-content-center">
            <a class="navbar-brand" href="#">Teacher Batches</a>
        </div>
    </nav>

    <!-- Main Box -->
    <div class="box">

        <div class="table-responsive">
            <table class="table table-bordered table-hover table-sm">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Practical Subject</th>
                        <th>Class</th>
                        <th>Batch</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${allbatches}" var="batch">
                        <tr>
                            <td>${batch.tname}</td>
                            <td>${batch.subject}</td>
                            <td>${batch.sclass}</td>
                            <td>${batch.sbatch}</td>
                            <td><a class="btn btn-warning btn-sm" href="batchdelete/${batch.tname}/${batch.subject}/${batch.sbatch}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <a class="btn btn-primary w-50 mx-auto d-block" href="${pageContext.request.contextPath}/BackAdminDashbord">Back to Dashboard</a>
    </div>

    <!-- Footer -->
    <footer class="text-center mt-auto">
        <div>
            <p>© 2024 MGM Brand. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>

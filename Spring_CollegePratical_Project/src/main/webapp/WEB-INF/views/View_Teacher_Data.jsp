<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Teacher Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .custom-navbar {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
            letter-spacing: 1px;
        }

        .table-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            border-radius: 15px;
            padding: 30px;
            margin-top: 40px;
            width: 95%;
            max-width: 1100px;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        table {
            text-align: center;
            background-color: white;
            color: #000;
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            background: linear-gradient(45deg, #00c6ff, #0072ff);
            color: white;
        }

        .btn-primary, .btn-warning {
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0044cc;
        }

        .btn-warning:hover {
            background-color: #e6a600;
            color: white;
        }

        .back-btn {
            display: block;
            margin: 30px auto 10px;
            border-radius: 12px;
            font-weight: bold;
        }

        footer {
            background: rgba(0, 0, 0, 0.4);
            color: #fff;
        }

        @media (max-width: 768px) {
            .navbar-brand {
                font-size: 1.4rem;
            }

            .table-container {
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
    <nav class="navbar navbar-expand-lg custom-navbar shadow-sm">
        <div class="container-fluid justify-content-center">
            <a class="navbar-brand">Teacher's Info</a>
        </div>
    </nav>

    <!-- Table Section -->
    <div class="table-container">
        <h3 class="text-center text-danger mb-4">${msg}</h3>

        <div class="table-responsive">
            <table class="table table-bordered table-hover align-middle">
                <thead>
                    <tr class="table-active">
                        <th>ID</th>
                        <th>Password</th>
                        <th>Name</th>
                        <th>Subject</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${Tealist}" var="Teacher">
                        <tr>
                            <td>${Teacher.eid}</td>
                            <td>${Teacher.epassword}</td>
                            <td>${Teacher.ename}</td>
                            <td>${Teacher.esubject}</td>
                            <td><a class="btn btn-primary btn-sm" href="teaupdate/${Teacher.eid}">Update</a></td>
                            <td><a class="btn btn-warning btn-sm" href="teadelete/${Teacher.eid}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <a class="btn btn-success back-btn w-50 text-center" href="${pageContext.request.contextPath}/BackAdminDashbord">Back to Dashboard</a>
    </div>

    <!-- Footer -->
    <footer class="text-center py-3 mt-auto">
        <p>© 2024 MGM Brand. All Rights Reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Add Teacher Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .custom-navbar {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            padding: 30px;
            margin-top: 50px;
            width: 90%;
            max-width: 500px;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        .form-control {
            border-radius: 10px;
            padding: 12px;
        }

        .btn-primary {
            background: #ffffff;
            color: #0072ff;
            border: none;
            font-weight: bold;
            padding: 12px 20px;
            border-radius: 10px;
            transition: 0.3s ease;
        }

        .btn-primary:hover {
            background: #d9f0ff;
            color: #003d80;
        }

        .btn-success {
            margin-top: 20px;
            padding: 10px 25px;
            border-radius: 10px;
        }

        footer {
            background: rgba(0, 0, 0, 0.3);
            color: #fff;
            padding: 10px 0;
        }

        @media (max-width: 576px) {
            .navbar-brand {
                font-size: 1.3rem;
            }

            .form-container {
                margin-top: 20px;
                padding: 20px;
            }
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar custom-navbar fixed-top">
        <div class="container-fluid justify-content-center">
            <a class="navbar-brand">ADD TEACHER DETAILS</a>
        </div>
    </nav>

    <!-- Form -->
    <form action="InsertTeacherData" method="post">
        <div class="form-container mt-5 pt-5">

            <div class="mb-3">
                <input type="text" name="tid" class="form-control" placeholder="Enter ID..." required>
            </div>

            <div class="mb-3">
                <input type="password" name="tpassword" class="form-control" placeholder="Enter Password..." required>
            </div>

            <div class="mb-3">
                <input type="text" name="tname" class="form-control" placeholder="Enter Name..." required>
            </div>

            <div class="mb-3">
                <input type="text" name="tsubject" class="form-control" placeholder="Enter Subject..." required>
            </div>

            <div class="text-center">
                <input type="submit" name="sub" class="btn btn-primary w-100" value="ADD TEACHER">
            </div>

            <div class="text-center">
                <a href="${pageContext.request.contextPath}/BackAdminDashbord" class="btn btn-success w-100 mt-3">Back</a>
            </div>

        </div>
    </form>

    <!-- Footer -->
    <footer class="text-center mt-auto">
        <p>© 2024 MGM Brand. All Rights Reserved.</p>
    </footer>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>

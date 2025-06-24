<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stylish Login</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .login-card {
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.2);
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            color: #fff;
        }

        .login-card h4 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: 500;
            color: #fff;
        }

        .form-control {
            border-radius: 10px;
            border: none;
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.25rem rgba(255, 255, 255, 0.25);
            border-color: #fff;
        }

        .btn-login {
            background-color: #fff;
            color: #2575fc;
            font-weight: bold;
            transition: all 0.3s;
            border-radius: 10px;
        }

        .btn-login:hover {
            background-color: #2575fc;
            color: #fff;
            border: 1px solid #fff;
        }

        .card-header-custom {
            font-size: 1.8rem;
            font-weight: bold;
            text-align: center;
            color: #fff;
            margin-bottom: 20px;
        }

        .error-message {
            text-align: center;
            color: #ffcccc;
            margin-bottom: 15px;
        }

        @media (max-width: 576px) {
            .login-card {
                margin: 0 15px;
                padding: 20px;
            }
        }
    </style>
</head>

<body>

    <div class="login-card">
        <h4 class="error-message">${message}</h4>
        <div class="card-header-custom">Admin Login</div>
        <div class="card-body">
            <form action="AdminLoginData" method="post">
                <div class="mb-3">
                    <label for="id" class="form-label">Enter ID</label>
                    <input type="text" class="form-control" name="id" placeholder="Enter your ID" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Enter Password</label>
                    <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-login">Login</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

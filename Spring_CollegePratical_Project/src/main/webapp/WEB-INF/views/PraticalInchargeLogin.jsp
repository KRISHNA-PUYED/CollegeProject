<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Practical In-Charge Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #8E2DE2, #4A00E0);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 400px;
            color: #fff;
        }

        .login-card-header {
            background: linear-gradient(to right, #D4145A, #FBB03B);
            padding: 20px;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            text-align: center;
        }

        .login-card-header h3 {
            margin: 0;
            font-weight: 600;
        }

        .login-card-body {
            padding: 30px;
        }

        .form-label {
            font-weight: 600;
            color: #fff;
        }

        .form-control {
            border-radius: 50px;
            padding: 12px 20px;
            background-color: rgba(255, 255, 255, 0.1);
            color: #fff;
            border: 1px solid #ddd;
        }

        .form-control::placeholder {
            color: #eee;
        }

        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.2);
            border-color: #FBB03B;
            box-shadow: none;
            color: #fff;
        }

        .btn-login {
            background: linear-gradient(to right, #FF512F, #DD2476);
            border: none;
            border-radius: 50px;
            padding: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
            color: white;
        }

        .btn-login:hover {
            background: linear-gradient(to right, #DD2476, #FF512F);
        }

        @media (max-width: 576px) {
            .login-card-body {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

    <div class="login-card shadow-lg">
        <div class="login-card-header">
            <h3>🔐 Practical In-Charge Login</h3>
        </div>
        <div class="login-card-body">
            <form action="PraticalInchargeLoginData" method="post">
                <div class="mb-3">
                    <label for="id" class="form-label">Enter ID</label>
                    <input type="text" class="form-control" name="id" placeholder="Enter your ID..." required />
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" placeholder="Enter your password..." required />
                </div>
                <div class="d-grid">
                    <input type="submit" class="btn btn-login" name="sub" value="Login" />
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

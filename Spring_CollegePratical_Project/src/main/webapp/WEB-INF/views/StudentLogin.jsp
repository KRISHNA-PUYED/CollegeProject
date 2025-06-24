<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Student Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #2C5364, #203A43, #0F2027);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            backdrop-filter: blur(12px);
            padding: 30px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            color: #fff;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
            color: #ffffff;
            background: linear-gradient(to right, #ff512f, #dd2476);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .form-control, .form-select {
            background-color: rgba(255, 255, 255, 0.1);
            color: #fff;
            border: 1px solid #ccc;
            margin-bottom: 15px;
        }

        .form-control::placeholder {
            color: #ccc;
        }

        .form-control:focus, .form-select:focus {
            background-color:#808080;
            border-color: #007bff;
            box-shadow: none;
            color: #fff;
        }

        .btn-custom {
            background: linear-gradient(to right, #00c6ff, #0072ff);
            border: none;
            color: white;
            width: 100%;
            font-weight: 600;
        }

        .btn-custom:hover {
            background: linear-gradient(to right, #0072ff, #00c6ff);
        }

        .msg {
            text-align: center;
            margin-bottom: 15px;
        }

        .msg h4 {
            color: #ff4d4d;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <div class="msg">
            <h4>${message}</h4>
        </div>
        <h2>🔐 Student Login</h2>
        <form action="StudentLoginPage" method="post" class="login-form">
            <input type="text" name="sid" class="form-control" placeholder="Enter Student ID..." required />
            <input type="password" name="spassword" class="form-control" placeholder="Enter Password..." required />

            <select name="stuSubject" class="form-select" required>
                <option disabled selected>Select Practical</option>
                <option value="C">C</option>
                <option value="CPP">CPP</option>
                <option value="JAVA">JAVA</option>
                <option value="HTML">HTML</option>
                <option value="PYTHON">PYTHON</option>
                <option value="DBMS">DBMS</option>
                <option value="RDBMS">RDBMS</option>
                <option value="MATLAB">MATLAB</option>
                <option value="C#">C#</option>
            </select>

            <select name="stuBatch" class="form-select" required>
                <option disabled selected>Select Batch</option>
                <optgroup label="FYBCS">
                    <option value="FYBCS-A1">A1</option>
                    <option value="FYBCS-A2">A2</option>
                    <option value="FYBCS-A3">A3</option>
                    <option value="FYBCS-A4">A4</option>
                    <option value="FYBCS-B1">B1</option>
                    <option value="FYBCS-B2">B2</option>
                    <option value="FYBCS-B3">B3</option>
                    <option value="FYBCS-B4">B4</option>
                </optgroup>
                <optgroup label="SYBCS">
                    <option value="SYBCS-A1">A1</option>
                    <option value="SYBCS-A2">A2</option>
                    <option value="SYBCS-A3">A3</option>
                    <option value="SYBCS-A4">A4</option>
                    <option value="SYBCS-B1">B1</option>
                    <option value="SYBCS-B2">B2</option>
                    <option value="SYBCS-B3">B3</option>
                    <option value="SYBCS-B4">B4</option>
                </optgroup>
                <optgroup label="TYBCS">
                    <option value="TYBCS-A1">A1</option>
                    <option value="TYBCS-A2">A2</option>
                    <option value="TYBCS-A3">A3</option>
                    <option value="TYBCS-A4">A4</option>
                    <option value="TYBCS-B1">B1</option>
                    <option value="TYBCS-B2">B2</option>
                    <option value="TYBCS-B3">B3</option>
                    <option value="TYBCS-B4">B4</option>
                </optgroup>
            </select>

            <input type="date" name="sdate" class="form-control" required />

            <input type="submit" name="sub" value="Login" class="btn btn-custom mt-3" />
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Update Teacher</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #74ebd5, #9face6);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: #333;
        }

        .form-box {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            padding: 40px 30px;
            width: 90%;
            max-width: 500px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
            color: #000;
        }

        .form-box h2 {
            margin-bottom: 30px;
            font-weight: bold;
            color: #004085;
            text-align: center;
        }

        .form-control {
            border-radius: 12px;
            padding: 12px;
            margin-bottom: 20px;
        }

        .btn-primary {
            width: 100%;
            border-radius: 12px;
            font-weight: bold;
            background: linear-gradient(90deg, #0072ff, #00c6ff);
            border: none;
            transition: 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(90deg, #0052cc, #00aaff);
        }

        .back-link {
            margin-top: 20px;
            text-align: center;
        }

        .back-link a {
            color: white;
            background: #28a745;
            padding: 10px 20px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .back-link a:hover {
            background: #218838;
        }

        @media (max-width: 576px) {
            .form-box {
                padding: 30px 20px;
            }
        }
    </style>
</head>

<body>

    <form action="${pageContext.request.contextPath}/TeacherUpdateData" method="post" class="form-box">
        <h2>Update Teacher Info</h2>

        <input type="hidden" name="tid" value="${teaData.eid}" class="form-control">

        <input type="text" name="tname" value="${teaData.ename}" class="form-control" placeholder="Enter Name..." required>

        <input type="password" name="tpassword" value="${teaData.epassword}" class="form-control" placeholder="Enter Password..." required>

        <input type="submit" name="sub" class="btn btn-primary mt-3" value="Update">
    </form>

    <div class="back-link">
        <a href="${pageContext.request.contextPath}/BackAdminDashbord">Back to Dashboard</a>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>

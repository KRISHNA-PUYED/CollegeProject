<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>College Project - Student Update</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap & Google Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    
    <style>
        body {
            background: linear-gradient(135deg, #74ebd5, #ACB6E5);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .update-form-card {
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }

        .form-title {
            font-weight: 600;
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }

        .form-label {
            font-weight: 500;
        }

        .btn-update {
            width: 100%;
            background: #007bff;
            border: none;
            font-weight: 600;
        }

        .btn-update:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>

    <div class="update-form-card">
        <h3 class="form-title">Update Student Information</h3>
        <form action="${pageContext.request.contextPath}/StudentUpdate" method="post">
            <div class="mb-3">
                <label for="sname" class="form-label">Student Name</label>
                <input type="text" class="form-control" id="sname" name="sname" value="${stUpdate.sname}" required>
            </div>
            <div class="mb-3">
                <label for="suid" class="form-label">Student ID</label>
                <input type="text" class="form-control" id="suid" name="suid" value="${stUpdate.suid}" required>
            </div>
            <div class="mb-3">
                <label for="spassword" class="form-label">Password</label>
                <input type="password" class="form-control" id="spassword" name="spassword" value="${stUpdate.spassword}" required>
            </div>
            <div class="mb-3">
                <label for="sclass" class="form-label">Class</label>
                <input type="text" class="form-control" id="sclass" name="sclass" value="${stUpdate.sclass}" required>
            </div>
            <div class="mb-3">
                <label for="sbatch" class="form-label">Batch</label>
                <input type="text" class="form-control" id="sbatch" name="sbatch" value="${stUpdate.sbatch}" required>
            </div>
            <button type="submit" class="btn btn-update">Update</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

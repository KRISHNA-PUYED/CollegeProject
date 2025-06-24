<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Add Batches to Teacher</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #7f7fd5, #86a8e7, #91eae4);
            font-family: 'Segoe UI', sans-serif;
            color: #333;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .custom-navbar {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(12px);
        }

        .navbar-brand {
            font-size: 1.7rem;
            font-weight: bold;
            color: #fff;
            letter-spacing: 1px;
        }

        .form-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            border-radius: 20px;
            padding: 40px 30px;
            max-width: 600px;
            margin: 40px auto;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }

        .form-select,
        .btn {
            border-radius: 10px;
            padding: 10px;
        }

        .btn-primary {
            width: 100%;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            border: none;
            font-weight: bold;
        }

        .btn-primary:hover {
            background: linear-gradient(to right, #005bea, #00c6ff);
        }

        .back-btn {
            margin: 0 auto 40px;
            text-align: center;
        }

        .back-btn a {
            padding: 10px 30px;
            border-radius: 12px;
            font-weight: bold;
            background: #28a745;
            color: white;
            text-decoration: none;
        }

        .back-btn a:hover {
            background: #218838;
        }

        footer {
            background-color: #212529;
            color: white;
            padding: 10px 0;
        }

        @media (max-width: 576px) {
            .navbar-brand {
                font-size: 1.3rem;
            }

            .form-card {
                padding: 30px 20px;
            }
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg custom-navbar shadow-sm">
        <div class="container-fluid justify-content-center">
            <a class="navbar-brand">Add Batches to Teacher</a>
        </div>
    </nav>

    <!-- Main Form -->
    <main class="container text-center flex-grow-1">
        <h5 class="text-danger mt-3">${message}</h5>

        <form action="AddBatchesToTeacher" method="post" class="form-card">
            <div class="mb-3">
                <select name="addbatch" class="form-select" required>
                    <option value="" disabled selected>Select Teacher</option>
                    <c:forEach items="${tea}" var="teacher">
                        <option value="${teacher.ename}">${teacher.ename}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <select name="stuSubject" class="form-select" required>
                    <option value="" disabled selected>Select Subject</option>
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
            </div>

            <div class="mb-3">
                <select name="stuClass" class="form-select" required>
                    <option value="" disabled selected>Select Class</option>
                    <option value="FYBCS">FYBCS</option>
                    <option value="SYBCS">SYBCS</option>
                    <option value="TYBCS">TYBCS</option>
                    <option value="FYBCA">FYBCA</option>
                    <option value="SYBCA">SYBCA</option>
                    <option value="TYBCA">TYBCA</option>
                </select>
            </div>

            <div class="mb-4">
                <select name="stuBatch" class="form-select" required>
                    <option value="" disabled selected>Select Batch</option>
                    <option value="FYBCS-A1">FYBCS-A1</option>
                    <option value="FYBCS-A2">FYBCS-A2</option>
                    <option value="FYBCS-A3">FYBCS-A3</option>
                    <option value="FYBCS-A4">FYBCS-A4</option>
                    <option value="FYBCS-B1">FYBCS-B1</option>
                    <option value="FYBCS-B2">FYBCS-B2</option>
                    <option value="FYBCS-B3">FYBCS-B3</option>
                    <option value="FYBCS-B4">FYBCS-B4</option>
                    <option value="SYBCS-A1">SYBCS-A1</option>
                    <option value="SYBCS-A2">SYBCS-A2</option>
                    <option value="SYBCS-A3">SYBCS-A3</option>
                    <option value="SYBCS-A4">SYBCS-A4</option>
                    <option value="SYBCS-B1">SYBCS-B1</option>
                    <option value="SYBCS-B2">SYBCS-B2</option>
                    <option value="SYBCS-B3">SYBCS-B3</option>
                    <option value="SYBCS-B4">SYBCS-B4</option>
                    <option value="TYBCS-A1">TYBCS-A1</option>
                    <option value="TYBCS-A2">TYBCS-A2</option>
                    <option value="TYBCS-A3">TYBCS-A3</option>
                    <option value="TYBCS-A4">TYBCS-A4</option>
                    <option value="TYBCS-B1">TYBCS-B1</option>
                    <option value="TYBCS-B2">TYBCS-B2</option>
                    <option value="TYBCS-B3">TYBCS-B3</option>
                    <option value="TYBCS-B4">TYBCS-B4</option>
                </select>
            </div>

            <input class="btn btn-primary" type="submit" name="sub" value="Add Batch">
        </form>

        <!-- Back Button -->
        <div class="back-btn">
            <a href="${pageContext.request.contextPath}/BackAdminDashbord">Back to Dashboard</a>
        </div>
    </main>

    <!-- Footer -->
    <footer class="text-center">
        <div class="pt-2">
            <p>© 2024 MGM Brand. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>

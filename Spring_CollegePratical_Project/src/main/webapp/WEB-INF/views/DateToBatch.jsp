<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Practical Dates</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #e0f7fa, #e1bee7);
            min-height: 100vh;
            padding-bottom: 60px;
        }

        .navbar {
            background-color: #2c3e50;
        }

        .navbar-brand, .nav-link, .navbar h3 {
            color: #ffffff !important;
        }

        .navbar h3 {
            margin-left: 20px;
        }

        .box {
            background: rgba(255, 255, 255, 0.85);
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 500px;
            margin: 40px auto;
        }

        .form-control {
            border-radius: 8px;
            box-shadow: none;
        }

        .btn-danger {
            background: #e74c3c;
            border: none;
            transition: all 0.3s;
        }

        .btn-danger:hover {
            background: #c0392b;
        }

        .btn-primary {
            margin-top: 15px;
            background: #2980b9;
            border: none;
        }

        .btn-primary:hover {
            background: #1c5980;
        }

        .table-custom {
            margin-top: 30px;
            border-radius: 10px;
            overflow: hidden;
            background-color: white;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        }

        h1, h3 {
            text-align: center;
        }

        footer {
            position: relative;
            bottom: 0;
            width: 100%;
            background: #17a2b8;
            color: white;
            padding: 10px;
        }

        @media (max-width: 768px) {
            .box, .datebox {
                width: 90% !important;
            }
        }
    </style>
</head>

<body>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="#">Batch - ${batch}</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="ms-auto">
            <h3>Subject - ${sub}</h3>
        </div>
    </div>
</nav>

<h1 class="mt-4 text-success">${message}</h1>

<div class="box">
    <form action="${pageContext.request.contextPath}/BatchDataDate" method="post">
        <h4 class="mb-3 text-danger text-center">Select Practical Date:</h4>
        <input type="hidden" name="batch" value="${batch}">
        <input type="hidden" name="tsub" value="${sub}">
        <input type="date" class="form-control mb-3" name="sdate" required>
        <input type="submit" class="btn btn-danger w-100" name="sub" value="Proceed">
    </form>
</div>

<div class="container datebox" id="printSection">
    <div class="table-responsive table-custom">
        <table class="table table-bordered table-striped text-center">
            <thead class="table-dark">
                <tr>
                    <th>Practical Subject</th>
                    <th>Student Batch</th>
                </tr>
            </thead>
            <tbody>
                <tr class="table-light">
                    <td>${sub}</td>
                    <td>${batch}</td>
                </tr>
                <tr>
                    <th>Practical Dates</th>
                    <th>Delete Date</th>
                </tr>
                <c:forEach items="${datelist}" var="list">
                    <tr>
                        <td class="table-light">${list.bdate}</td>
                        <td class="table-light">
                            <a class="btn btn-warning btn-sm" 
                               href="${pageContext.request.contextPath}/pdatedelete/${list.bdate}/${batch}/${sub}">
                                Delete
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div class="text-center">
    <button class="btn btn-primary" onclick="printData()">Download</button>
</div>

<footer class="text-center mt-5">
    <p>© 2024 MGM Brand. All Rights Reserved.</p>
</footer>

<script>
    function printData() {
        var printContents = document.getElementById('printSection').innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
        location.reload();
    }
</script>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

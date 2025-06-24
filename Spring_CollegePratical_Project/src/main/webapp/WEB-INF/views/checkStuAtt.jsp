<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>Attendance Dashboard</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <!-- Custom Style -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f7f8;
            color: #333;
        }

        .navbar {
            background-color: #222;
        }

        .navbar-brand {
            font-size: 1.8rem;
            color: #fff !important;
        }

        .nav-link {
            color: #fff !important;
        }

        .container-main {
            margin-top: 30px;
        }

        .form-card {
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: auto;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .btn-primary {
            width: 100%;
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .table-custom {
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 15px rgba(0,0,0,0.05);
        }

        h1, h3 {
            text-align: center;
        }

        .download-btn {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .btn-download {
            background-color: #28a745;
            color: #fff;
            padding: 10px 30px;
            border-radius: 8px;
        }

        .btn-download:hover {
            background-color: #218838;
        }

        .no-print {
            text-align: center;
        }

        @media (max-width: 576px) {
            .form-card {
                padding: 20px;
            }

            .table {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="#">Subject: ${sub}</a>
        <div class="ms-auto text-white">
            <h5 class="mb-0">${batch}</h5>
        </div>
    </div>
</nav>

<div class="container container-main">
    <h1 style="color: crimson;">${msg}</h1>

    <!-- Attendance Form -->
    <div class="form-card">
        <form action="${pageContext.request.contextPath}/viewAttStu" method="post">
            <input type="hidden" name="sbatch" value="${batch}">
            <input type="text" name="stusub" class="form-control" placeholder="Subject" value="${sub}" readonly>
            <input type="date" class="form-control" name="d1" placeholder="Select Date">
            <input type="hidden" name="d1" value="${ddd}">
            <input type="submit" class="btn btn-primary" value="Load Attendance">
        </form>
    </div>

    <!-- Attendance Table -->
    <div id="printSection" class="mt-5 table-custom p-3">
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Student ID</th>
                    <th>Student Name</th>
                    <th>Login Date</th>
                    <th>Attendance</th>
                    <th>Login Time</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${stulist}" var="slist">
                    <tr>
                        <td>${slist.suid}</td>
                        <td>${slist.sname}</td>
                        <td>${slist.pdate}</td>
                        <td>${slist.attendance}</td>
                        <td>${slist.logtime}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Download Button -->
    <div class="download-btn no-print">
        <button class="btn btn-download" onclick="printData()">Download Report</button>
    </div>

    <!-- Attendance Actions -->
    <div class="attabs mt-5">
        <h3 style="color: seagreen;">${message}</h3>
        <div class="table-custom p-3">
            <table class="table table-bordered">
                <thead class="table-success">
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Attendance Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${allstu}" var="list">
                        <tr>
                            <td>${list.suid}</td>
                            <td>${list.sname}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/StudentAbsent/${list.suid}/${list.sname}/${sub}/${logdate}/${batch}"
                                   class="btn btn-danger">Mark Absent</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Print Script -->
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

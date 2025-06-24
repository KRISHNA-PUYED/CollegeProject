<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Attendance View</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap & Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to right, #1e3c72, #2a5298);
      min-height: 100vh;
      color: #fff;
    }

    .navbar-custom {
      background: linear-gradient(to right, #4e54c8, #8f94fb);
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
    }

    .navbar-brand, .nav-link {
      font-size: 1.4rem;
      font-weight: bold;
      color: white !important;
    }

    h1 {
      text-align: center;
      margin: 30px 0 20px;
      font-size: 2rem;
      color: #c8e6c9;
      font-weight: 600;
    }

    table {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      border-radius: 10px;
      overflow: hidden;
      margin: auto;
      width: 90%;
    }

    table th, table td {
      text-align: center;
      vertical-align: middle;
      color: #fff;
    }

    table th {
      background-color: rgba(0, 0, 0, 0.6);
    }

    table tbody tr:hover {
      background-color: rgba(255, 255, 255, 0.1);
      transition: 0.3s;
    }

    .btn-primary {
      background: linear-gradient(to right, #00c6ff, #0072ff);
      border: none;
      border-radius: 50px;
      font-weight: bold;
    }

    .btn-primary:hover {
      background: linear-gradient(to right, #0072ff, #00c6ff);
    }

    .clear {
      text-align: center;
      margin: 40px auto 20px;
    }

    .clear a {
      padding: 12px 30px;
      font-size: 1rem;
    }

    @media (max-width: 768px) {
      .navbar-brand, .nav-link {
        font-size: 1rem;
      }

      table {
        font-size: 0.9rem;
      }
    }
  </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-custom navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Batch: ${sbatch}</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link active" href="#">Subject: ${sub}</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Success Message -->
<h1>${mess}</h1>

<!-- Attendance Table -->
<div class="container mb-5">
  <table class="table table-bordered table-hover shadow-sm">
    <thead>
      <tr>
        <th>SID</th>
        <th>Name</th>
        <th>Date</th>
        <th>Login Time</th>
        <th>Logout Time</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${sattendance}" var="list">
        <tr>
          <td>${list.suid}</td>
          <td>${list.sname}</td>
          <td>${list.logindate}</td>
          <td>${list.logintime}</td>
          <td>${list.logouttime}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

<!-- Clear All Button -->
<div class="clear">
  <a href="${pageContext.request.contextPath}/DeleteAllLoginLogout/${sbatch}/${sub}" class="btn btn-primary">
    <i class="bi bi-trash"></i> Clear All
  </a>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

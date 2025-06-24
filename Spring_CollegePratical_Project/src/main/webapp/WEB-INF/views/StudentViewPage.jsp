<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Student View</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- Bootstrap, Icons, Fonts -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(to right, #a1c4fd, #c2e9fb);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      padding-top: 75px;
    }

    .navbar {
      background: linear-gradient(to right, #00c9ff, #92fe9d);
      position: fixed;
      width: 100%;
      top: 0;
      z-index: 1000;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    .navbar-brand {
      font-weight: 700;
      font-size: 1.5rem;
      color: #fff !important;
      letter-spacing: 1px;
    }

    .form-box {
      background: #ffffffd9;
      backdrop-filter: blur(10px);
      border-radius: 15px;
      padding: 30px;
      max-width: 600px;
      margin: 20px auto;
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }

    .form-select, .btn {
      border-radius: 30px;
    }

    .btn-primary {
      font-weight: 600;
      padding: 8px 25px;
    }

    .table-container {
      max-width: 90%;
      margin: 0 auto 40px;
    }

    table {
      border-radius: 12px;
      overflow: hidden;
    }

    table th {
      background-color: #007bff;
      color: white;
    }

    .btn-warning {
      color: white;
    }

    .back-btn {
      display: block;
      width: fit-content;
      margin: 20px auto;
      padding: 8px 25px;
      border-radius: 30px;
    }

    footer {
      background: #00c9ff;
      color: white;
      text-align: center;
      padding: 12px;
      font-weight: 500;
      margin-top: auto;
    }

    @media (max-width: 576px) {
      .form-box {
        margin: 15px;
        padding: 20px;
      }

      .btn {
        width: 100%;
      }

      .table-container {
        width: 100%;
        padding: 0 10px;
      }
    }
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
  <div class="container justify-content-center">
    <a class="navbar-brand" href="#"><i class="bi bi-mortarboard-fill me-2"></i>Student View</a>
  </div>
</nav>

<!-- Form -->
<form action="StudentViewData" method="post">
  <div class="form-box">
    <h5 class="text-danger text-center">${msg}</h5>

    <div class="mb-3">
      <select name="stuClass" class="form-select" required>
        <option selected disabled>🎓 Select Student Class</option>
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
        <option selected disabled>🏷️ Select Student Batch</option>
        <optgroup label="FYBCS">
          <option>FYBCS-A1</option><option>FYBCS-A2</option><option>FYBCS-A3</option><option>FYBCS-A4</option>
          <option>FYBCS-B1</option><option>FYBCS-B2</option><option>FYBCS-B3</option><option>FYBCS-B4</option>
        </optgroup>
        <optgroup label="SYBCS">
          <option>SYBCS-A1</option><option>SYBCS-A2</option><option>SYBCS-A3</option><option>SYBCS-A4</option>
          <option>SYBCS-B1</option><option>SYBCS-B2</option><option>SYBCS-B3</option><option>SYBCS-B4</option>
        </optgroup>
        <optgroup label="TYBCS">
          <option>TYBCS-A1</option><option>TYBCS-A2</option><option>TYBCS-A3</option><option>TYBCS-A4</option>
          <option>TYBCS-B1</option><option>TYBCS-B2</option><option>TYBCS-B3</option><option>TYBCS-B4</option>
        </optgroup>
      </select>
    </div>

    <div class="text-center">
      <input type="submit" class="btn btn-primary" name="sub" value="🔍 View Student">
    </div>
  </div>
</form>

<!-- Table -->
<div class="table-container">
  <table class="table table-bordered table-hover table-sm text-center align-middle">
    <thead>
      <tr>
        <th>Student Name</th>
        <th>Student UID</th>
        <th>Password</th>
        <th>Class</th>
        <th>Batch</th>
        <th>Update</th>
        <th>Delete</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${stobj}" var="stlist">
        <tr>
          <td>${stlist.sname}</td>
          <td>${stlist.suid}</td>
          <td>${stlist.spassword}</td>
          <td>${stlist.sclass}</td>
          <td>${stlist.sbatch}</td>
          <td><a class="btn btn-sm btn-primary" href="${pageContext.request.contextPath}/update/${stlist.suid}"><i class="bi bi-pencil-square"></i></a></td>
          <td><a class="btn btn-sm btn-warning" href="${pageContext.request.contextPath}/delete/${stlist.suid}"><i class="bi bi-trash3"></i></a></td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <a href="${pageContext.request.contextPath}/BackAdminDashbord" class="btn btn-primary back-btn">⬅ Back</a>
</div>

<!-- Footer -->
<footer>
  © 2024 MGM Brand. All Rights Reserved.
</footer>

<!-- Bootstrap Script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

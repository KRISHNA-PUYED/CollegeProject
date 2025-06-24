<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Add Student Data</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- Bootstrap, Icons, Fonts -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(to right, #83a4d4, #b6fbff);
      margin: 0;
      padding-top: 75px; /* to avoid navbar overlap */
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    .navbar {
      background: rgba(0, 172, 255, 0.9);
      backdrop-filter: blur(10px);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      position: fixed;
      width: 100%;
      top: 0;
      z-index: 999;
    }

    .navbar-brand {
      font-weight: 700;
      font-size: 1.5rem;
      color: #fff !important;
      letter-spacing: 1px;
    }

    .form-box {
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(8px);
      border-radius: 20px;
      padding: 35px;
      max-width: 600px;
      margin: 0 auto 40px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }

    .form-control, .form-select {
      border-radius: 30px;
      padding: 10px 20px;
    }

    .form-select option {
      padding: 10px;
    }

    .btn-primary {
      border-radius: 30px;
      padding: 10px 25px;
      font-weight: 600;
    }

    .btn-back {
      background-color: #ffffff;
      color: #0d6efd;
      border: 2px solid #0d6efd;
      border-radius: 30px;
    }

    .btn-back:hover {
      background-color: #0d6efd;
      color: white;
    }

    .message-success {
      color: green;
      font-weight: 500;
      text-align: center;
      margin-bottom: 15px;
    }

    footer {
      background: linear-gradient(to right, #00f2fe, #4facfe);
      color: white;
      padding: 10px 0;
      font-weight: 500;
      text-align: center;
      margin-top: auto;
      box-shadow: 0 -3px 8px rgba(0,0,0,0.1);
    }

    @media (max-width: 576px) {
      .form-box {
        margin: 20px 10px;
        padding: 25px;
      }

      .btn {
        width: 100%;
      }
    }
  </style>
</head>
<body>

<!-- Header -->
<nav class="navbar navbar-expand-lg shadow-sm">
  <div class="container justify-content-center">
    <a class="navbar-brand" href="#"><i class="bi bi-person-plus-fill me-2"></i> Add Student Data</a>
  </div>
</nav>

<!-- Form -->
<div class="container my-4">
  <div class="form-box">
    <h4 class="message-success">${message}</h4>
    <form action="AddAllStudentData" method="post">
      <div class="mb-3">
        <input type="text" class="form-control" name="stuName" placeholder="👤 Student Full Name..." required>
      </div>
      <div class="mb-3">
        <input type="text" class="form-control" name="stuUid" placeholder="🆔 Student UID..." required>
      </div>
      <div class="mb-3">
        <select name="stuClass" class="form-select" required>
          <option selected disabled>🎓 Select Class</option>
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
          <option selected disabled>🏷️ Select Batch</option>
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
      <div class="d-grid gap-2">
        <input type="submit" class="btn btn-primary" name="sub" value="➕ Add Student">
        <a href="${pageContext.request.contextPath}/BackAdminDashbord" class="btn btn-back">⬅ Back</a>
      </div>
    </form>
  </div>
</div>

<!-- Footer -->
<footer>
  <p>© 2024 MGM Brand. All Rights Reserved.</p>
</footer>

<!-- Bootstrap Script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

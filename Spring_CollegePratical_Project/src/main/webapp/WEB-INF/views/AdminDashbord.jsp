<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Admin Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- Bootstrap, Font Awesome, Google Fonts -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #dfe9f3 0%, #ffffff 100%);
      overflow-x: hidden;
    }

    .navbar {
      background: #0d6efd;
      padding: 0.8rem 1rem;
    }

    .navbar-brand {
      color: #fff !important;
      font-weight: 600;
      font-size: 1.6rem;
    }

    .profile-img {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 10px;
    }

    .btn-logout {
      background-color: #ffffff;
      color: #0d6efd;
      border-radius: 25px;
      padding: 6px 18px;
      font-weight: 600;
    }

    .btn-logout:hover {
      background-color: #e2e6ea;
      color: #0a58ca;
    }

    .glass-card {
      backdrop-filter: blur(8px);
      background: rgba(255, 255, 255, 0.8);
      border-radius: 15px;
      padding: 30px;
      text-align: center;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      transition: 0.3s ease;
    }

    .glass-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
    }

    .glass-card h5 {
      font-weight: 600;
      margin-bottom: 20px;
    }

    .glass-card .btn {
      border-radius: 25px;
      padding: 8px 22px;
      font-size: 15px;
    }

    .section-title {
      font-size: 28px;
      font-weight: 600;
      color: #0d6efd;
      text-align: center;
      margin: 40px 0 30px;
    }

    .fa-icon {
      font-size: 28px;
      margin-bottom: 12px;
      color: #0d6efd;
    }

    .dropdown-menu {
      border-radius: 12px;
    }
  </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <a class="navbar-brand" href="#">ADMIN PANEL</a>
    <div class="dropdown ms-auto">
      <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
         id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
        <img src="https://i.pravatar.cc/40?img=11" alt="admin" class="profile-img">
        <span>Admin</span>
      </a>
      <ul class="dropdown-menu dropdown-menu-end text-small shadow" aria-labelledby="dropdownUser1">
        <li><a class="dropdown-item" href="#">Profile</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="GoHome">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Main Section -->
<div class="container py-5">
  <div class="section-title">Manage Your Modules</div>
  <div class="row g-4">
    <!-- Box 1 -->
    <div class="col-lg-4 col-md-6">
      <div class="glass-card">
        <i class="fa-solid fa-user-plus fa-icon"></i>
        <h5>Add Students</h5>
        <a href="AddStudents" class="btn btn-primary">Add Students</a>
      </div>
    </div>

    <!-- Box 2 -->
    <div class="col-lg-4 col-md-6">
      <div class="glass-card">
        <i class="fa-solid fa-users-viewfinder fa-icon"></i>
        <h5>View Students</h5>
        <a href="ViewStudent" class="btn btn-primary">View Students</a>
      </div>
    </div>

    <!-- Box 3 -->
    <div class="col-lg-4 col-md-6">
      <div class="glass-card">
        <i class="fa-solid fa-person-chalkboard fa-icon"></i>
        <h5>Add Teachers</h5>
        <a href="AddTeachers" class="btn btn-primary">Add Teachers</a>
      </div>
    </div>

    <!-- Box 4 -->
    <div class="col-lg-4 col-md-6">
      <div class="glass-card">
        <i class="fa-solid fa-eye fa-icon"></i>
        <h5>View Teachers</h5>
        <a href="ViewTeachers" class="btn btn-primary">View Teachers</a>
      </div>
    </div>

    <!-- Box 5 -->
    <div class="col-lg-4 col-md-6">
      <div class="glass-card">
        <i class="fa-solid fa-layer-group fa-icon"></i>
        <h5>Add Batches</h5>
        <a href="AddBatches" class="btn btn-primary">Add Batches</a>
      </div>
    </div>

    <!-- Box 6 -->
    <div class="col-lg-4 col-md-6">
      <div class="glass-card">
        <i class="fa-solid fa-list-check fa-icon"></i>
        <h5>View Batches</h5>
        <a href="ViewBatches" class="btn btn-primary">View Batches</a>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

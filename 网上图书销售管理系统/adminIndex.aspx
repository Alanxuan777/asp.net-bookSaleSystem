<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminIndex.aspx.cs" Inherits="网上图书销售管理系统.adminIndex" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>管理员主页</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>
<body id="page-top" style="margin:0;">
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="adminIndex.aspx">管理员主页</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" >
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0" runat="server">
      <div class="input-group">
          <asp:TextBox ID="TextBox1" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" runat="server"></asp:TextBox>
        <div class="input-group-append">
            <asp:Button ID="Button_Search" class="btn btn-primary" runat="server" Text="搜索" OnClick="Button_Search_Click1" />
        </div>
      </div>
    </form>


    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0 ">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
        </a>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="adminAdviceLook.aspx">意见箱</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="adminCenter.aspx">个人中心</a>
          <a class="dropdown-item" href="adminUpdatePwd.aspx">修改密码</a>
          <a class="dropdown-item" href="login.aspx" >退出登录 </a>
        </div>
      </li>
    </ul>

  </nav>
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="adminLookOrder.aspx">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>订单管理</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>图书管理</span>
        </a>
        <div class="dropdown-menu" >
          <a class="dropdown-item" href="adminSearchBook.aspx">查看图书</a>
          <a class="dropdown-item" href="adminUpdateBook.aspx">修改图书</a>
          <a class="dropdown-item" href="adminAddBook.aspx">添加图书</a>
          <a class="dropdown-item" href="adminBookCount.aspx">图书统计</a>
        </div>
      </li>
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>用户管理</span>
        </a>
        <div class="dropdown-menu" >
          <a class="dropdown-item" href="adminSearchUser.aspx">查看用户</a>
          <a class="dropdown-item" href="adminUpdateUser.aspx">修改用户</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="adminSalessummary.aspx">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>销售汇总</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="adminAdviceLook.aspx">
          <i class="fas fa-fw fa-table"></i>
          <span>意见箱</span></a>
      </li>
    </ul>

    <!-- /.content-wrapper -->

    <div id="content-wrapper">

      <div class="container-fluid">


        <!-- Page Content -->
 <div class="card text-white bg-dark mb-3" style="max-width: 90rem;">
    <div class="card-header">Index</div>
    <div class="card-body">
     <h5 class="card-title">图书销售管理系统</h5>
        <p class="card-text">
        Book sales management system
        </p>
    </div>
 </div>
  <!-- Icon Cards-->
        <div class="row">
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-person-booth"></i>
                </div>
                <div class="mr-5">用户统计:<h1><asp:Label ID="Label_yonghu" runat="server" Text="Label"></asp:Label></h1></div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="adminSearchUser.aspx">
                <span class="float-left">查看</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-warning o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-list"></i>
                </div>
                <div class="mr-5">订单统计:<h1><asp:Label ID="Label_order" runat="server" Text="Label"></asp:Label></h1></div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="adminLookOrder.aspx">
                <span class="float-left">查看</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-success o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-shopping-cart"></i>
                </div>
                <div class="mr-5">总销量统计:<h1><asp:Label ID="Label_sales" runat="server" Text="Label"></asp:Label></h1></div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="adminSalessummary.aspx">
                <span class="float-left">查看</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-danger o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-book-reader"></i>
                </div>
                <div class="mr-5">图书统计:<h1><asp:Label ID="Label_book" runat="server" Text="Label"></asp:Label></h1></div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="adminSearchBook.aspx">
                <span class="float-left">查看</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
        </div>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->

    </div>
    <!-- /.content-wrapper -->
   </div>
    <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>
  </body>
  </html>

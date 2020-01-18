<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminUpdatePwd.aspx.cs" Inherits="网上图书销售管理系统.adminUpdatePwd" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>修改密码</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>
<body id="page-top" style="margin:0;">
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="adminIndex.aspx">管理员</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" >
      <i class="fas fa-bars"></i>
    </button>

    


    <!-- Navbar -->
    <ul class="navbar-nav ml-auto mr-0 mr-md-3 my-2 my-md-0">
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
          <a class="dropdown-item active" href="adminUpdatePwd.aspx">修改密码</a>
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
          <i class="fas fa-fw fa-book"></i>
          <span>图书管理</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
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

        <!-- Breadcrumbs-->
       <form runat="server"  class = "m-auto">
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="adminUpdatePwd.aspx">修改密码</a>
          </li>
          <li class="breadcrumb-item active">Update Password</li>
        </ol>

        <!-- Page Content -->
       <div class="input-group mb-3 justify-content-center p-2" >
          <div class="form-group col-md-3">
            <div class="form-label-group">
                <asp:TextBox ID="TextBox_oldPwd" class="form-control" placeholder=" " required="required" autofocus="autofocus" runat="server" TextMode="Password"></asp:TextBox>
              <label for="TextBox_oldPwd">原密码
                </label>
            </div>
          </div>
        </div>
        <div class="input-group mb-3 justify-content-center p-2" >
         <div class="form-group col-md-3">
            <div class="form-label-group">
                <asp:TextBox ID="TextBox_newPwd" class="form-control" placeholder=" " required="required"  runat="server" TextMode="Password"></asp:TextBox>
              <label for="TextBox_newPwd">新密码
                </label>
            </div>
          </div>
        </div>
        <div class="input-group mb-3 justify-content-center p-2" >
         <div class="form-group col-md-3">
            <div class="form-label-group">
                <asp:TextBox ID="TextBox_newPwd2" class="form-control" placeholder=" " required="required"  runat="server" TextMode="Password"></asp:TextBox>
              <label for="TextBox_newPwd2">请再次确认密码
                </label>
            </div>
          </div>
        </div>
        <div class="input-group mb-3 justify-content-center p-2">
                  <asp:Button ID="Button_update" class="btn btn-primary col-md-1 m-3" runat="server" Text="修改" OnClick="Button_update_Click" /> 
                  <asp:Button ID="Button_cancle" class="btn btn-primary col-md-1 m-3" runat="server" Text="取消" OnClick="Button_cancle_Click" />            
        </div>
      </form>

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

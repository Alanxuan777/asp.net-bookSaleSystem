<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminSearchUser.aspx.cs" Inherits="网上图书销售管理系统.adminSearchUser" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>查看用户</title>

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
          <a class="dropdown-item active" href="adminSearchUser.aspx">查看用户</a>
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
            <a href="adminSearchUser.aspx">查看用户</a>
          </li>
            <li class="breadcrumb-item active">Search User</li>
            <ul class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                    <li>
                        <asp:TextBox ID="TextBox_Search" class="form-control" placeholder="请输入用户账号查询" 
                            aria-label="Search" aria-describedby="basic-addon2" runat="server"></asp:TextBox>
                         <asp:Button ID="Button_Search" class="btn btn-primary" runat="server" Text="搜索" OnClick="Button_Search_Click"/> 
                    </li>
                </ul>
        </ol>

        <!-- Page Content -->
           <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
               <Columns>
                   <asp:BoundField DataField="uid" HeaderText="用户账号" ReadOnly="True" SortExpression="uid" />
                   <asp:BoundField DataField="uname" HeaderText="用户姓名" SortExpression="uname" />
                   <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex" />
                   <asp:BoundField DataField="birthday" HeaderText="生日" SortExpression="birthday" />
                   <asp:BoundField DataField="upassword" HeaderText="密码" SortExpression="upassword" />
                   <asp:BoundField DataField="tel" HeaderText="电话" SortExpression="tel" />
                   <asp:BoundField DataField="address" HeaderText="地址" SortExpression="address" />
                   <asp:HyperLinkField HeaderText="编辑" Text="编辑" DataNavigateUrlFields="uid" DataNavigateUrlFormatString="adminUpdateUser.aspx?uid={0}"/>
                   <asp:CommandField ShowDeleteButton="True" HeaderText="删除" />
               </Columns>
           </asp:GridView>  
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SaleBookSystemConnectionString %>" DeleteCommand="DELETE FROM [yonghu] WHERE [uid] = @uid" InsertCommand="INSERT INTO [yonghu] ([uid], [uname], [sex], [birthday], [upassword], [tel], [address]) VALUES (@uid, @uname, @sex, @birthday, @upassword, @tel, @address)" SelectCommand="SELECT * FROM [yonghu]" UpdateCommand="UPDATE [yonghu] SET [uname] = @uname, [sex] = @sex, [birthday] = @birthday, [upassword] = @upassword, [tel] = @tel, [address] = @address WHERE [uid] = @uid">
               <DeleteParameters>
                   <asp:Parameter Name="uid" Type="String" />
               </DeleteParameters>
               <InsertParameters>
                   <asp:Parameter Name="uid" Type="String" />
                   <asp:Parameter Name="uname" Type="String" />
                   <asp:Parameter Name="sex" Type="String" />
                   <asp:Parameter Name="birthday" Type="DateTime" />
                   <asp:Parameter Name="upassword" Type="String" />
                   <asp:Parameter Name="tel" Type="String" />
                   <asp:Parameter Name="address" Type="String" />
               </InsertParameters>
               <UpdateParameters>
                   <asp:Parameter Name="uname" Type="String" />
                   <asp:Parameter Name="sex" Type="String" />
                   <asp:Parameter Name="birthday" Type="DateTime" />
                   <asp:Parameter Name="upassword" Type="String" />
                   <asp:Parameter Name="tel" Type="String" />
                   <asp:Parameter Name="address" Type="String" />
                   <asp:Parameter Name="uid" Type="String" />
               </UpdateParameters>
           </asp:SqlDataSource>
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

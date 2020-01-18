<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminSearchBook.aspx.cs" Inherits="网上图书销售管理系统.adminSearchBook" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>查看图书</title>

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
          <a class="dropdown-item active" href="adminSearchBook.aspx">查看图书</a>
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
        <form runat="server">
        <ul class="breadcrumb">
          <li class="breadcrumb-item m-2">
            <a href="adminSearchBook.aspx">查看图书</a>
          </li>
          <li class="breadcrumb-item active m-2">Search Book</li>
          <li class="m-2">分类查询</li>
          <li class="m-2">图书类型</li>
          <li class="col-md-2 m-2 my-md-0">
              <asp:DropDownList ID="DropDownList_booktype" class="form-control" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="booktype" DataValueField="booktype" OnSelectedIndexChanged="DropDownList_booktype_SelectedIndexChanged">               
              </asp:DropDownList>
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SaleBookSystemConnectionString %>" SelectCommand="SELECT DISTINCT [booktype] FROM [book]"></asp:SqlDataSource>
          </li>
          <li class="m-2"> 
              根据选择内容查询图书
          </li>    
            <li class=" d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">              
                <asp:DropDownList ID="DropDownList_choose" class="form-control" runat="server">
                  <asp:ListItem>-请选择-</asp:ListItem>
                  <asp:ListItem>图书名称</asp:ListItem>
                    <asp:ListItem>图书作者</asp:ListItem>
                    <asp:ListItem>出版社</asp:ListItem>
                    <asp:ListItem>图书编号</asp:ListItem>
              </asp:DropDownList>
            </li>
          <li class=" d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
              <asp:TextBox ID="TextBox_search" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" runat="server"></asp:TextBox>
              <asp:Button ID="Button_Search" class="btn btn-primary" runat="server" Text="搜索" OnClick="Button_Search_Click"  /> 
          </li>
        </ul>
            

        <!-- Page Content -->
          <center>
        <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" DataKeyNames="bookid" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" >
            <Columns>
                <asp:ImageField DataImageUrlField="bookid" ControlStyle-CssClass="img_content" DataImageUrlFormatString="Images\{0}.jpg" HeaderText="图片">
                </asp:ImageField>
                <asp:BoundField DataField="bookid" HeaderText="图书编号" ReadOnly="True" SortExpression="bookid" />
                <asp:BoundField DataField="bookname" HeaderText="图书名称" SortExpression="bookname" />
                <asp:BoundField DataField="booktype" HeaderText="图书类型" SortExpression="booktype" />
                <asp:BoundField DataField="bookprice" HeaderText="图书价格" SortExpression="bookprice" />
                <asp:BoundField DataField="publisher" HeaderText="出版社" SortExpression="publisher" />
                <asp:BoundField DataField="publisherdate" HeaderText="出版日期" SortExpression="publisherdate" />
                <asp:BoundField DataField="author" HeaderText="作者" SortExpression="author" />
                <asp:HyperLinkField HeaderText="编辑" Text="编辑" DataNavigateUrlFields="bookid" DataNavigateUrlFormatString="adminUpdateBook.aspx?bookid={0}"/>
                <asp:CommandField ShowDeleteButton="True" HeaderText="删除" />
            </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SaleBookSystemConnectionString %>" SelectCommand="SELECT * FROM [book]" DeleteCommand="DELETE FROM [book] WHERE [bookid] = @bookid" InsertCommand="INSERT INTO [book] ([bookid], [bookname], [booktype], [bookprice], [publisher], [publisherdate], [author]) VALUES (@bookid, @bookname, @booktype, @bookprice, @publisher, @publisherdate, @author)" UpdateCommand="UPDATE [book] SET [bookname] = @bookname, [booktype] = @booktype, [bookprice] = @bookprice, [publisher] = @publisher, [publisherdate] = @publisherdate, [author] = @author WHERE [bookid] = @bookid">
                <DeleteParameters>
                    <asp:Parameter Name="bookid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="bookid" Type="Int32" />
                    <asp:Parameter Name="bookname" Type="String" />
                    <asp:Parameter Name="booktype" Type="String" />
                    <asp:Parameter Name="bookprice" Type="Double" />
                    <asp:Parameter Name="publisher" Type="String" />
                    <asp:Parameter Name="publisherdate" Type="DateTime" />
                    <asp:Parameter Name="author" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="bookname" Type="String" />
                    <asp:Parameter Name="booktype" Type="String" />
                    <asp:Parameter Name="bookprice" Type="Double" />
                    <asp:Parameter Name="publisher" Type="String" />
                    <asp:Parameter Name="publisherdate" Type="DateTime" />
                    <asp:Parameter Name="author" Type="String" />
                    <asp:Parameter Name="bookid" Type="Int32" />
                </UpdateParameters>
              </asp:SqlDataSource>
              </center>
        </form>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->

    </div>
    <!-- /.content-wrapper -->
   </div>
      <!-- wrapper -->
   <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
    <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>
  </body>
  </html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="网上图书销售管理系统.login" %>

<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Login</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark" style="margin:0;">
    <div style="text-align:center;"><h2><font color="white">图书销售管理系统</font></h2></div>
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">登录
        </div>
      <div class="card-body">
          <form id="form1" runat="server">
          <div class="form-group">
            <div class="form-label-group">
                <asp:TextBox ID="TextBox_id" class="form-control" placeholder="Email address" required="required" autofocus="autofocus" runat="server"></asp:TextBox>
              <label for="TextBox_id">账号
                </label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
                <asp:TextBox ID="TextBox_pwd" class="form-control" placeholder="Password" required="required" runat="server" TextMode="Password"></asp:TextBox>
              <label for="TextBox_pwd">密码
                </label>
            </div>
          </div>
          <asp:RadioButtonList ID="RadioButtonList1" runat="server"  RepeatDirection="Horizontal">
              <asp:ListItem Selected="True">管理员</asp:ListItem>
              <asp:ListItem>用户</asp:ListItem>
                </asp:RadioButtonList>
              <asp:Button ID="btn_login" class="btn btn-primary btn-block" runat="server" Text="登录" OnClick="btn_login_Click1" />
        <div class="text-center">
          <a class="d-block small mt-3" href="register.aspx">
            用户注册</a>
            <a class="d-block small mt-3" href="Index.aspx">
            主页</a>
        </div>
          </form>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="网上图书销售管理系统.register" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>注册</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark" style="margin:0;">

  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">注册</div>
      <div class="card-body">
          <form id="form1" runat="server">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <asp:TextBox ID="TextBox_name" class="form-control" placeholder=" " required="required" autofocus="autofocus" runat="server"></asp:TextBox>
                  <label for="TextBox_name">名字
                  </label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <asp:TextBox ID="TextBox_tel" class="form-control" placeholder=" " required="required"  runat="server"></asp:TextBox>
                  <label for="TextBox_tel">电话</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
           <div class="form-row">
           <div class="col-md-6">
            <div class="form-label-group">
                <asp:TextBox ID="TextBox_id" class="form-control" placeholder=" " required="required"  runat="server"></asp:TextBox>
              <label for="TextBox_id">账号</label>
            </div>
           </div>
           <div class="col-md-6">
            <div class="form-label-group">
               <asp:TextBox ID="TextBox_address" class="form-control" placeholder=" " required="required"  runat="server"></asp:TextBox>
              <label for="TextBox_address">地址</label>
            </div>
           </div>
          </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <asp:TextBox ID="TextBox_inputPassword" class="form-control" placeholder=" " required="required"  runat="server" TextMode="Password"></asp:TextBox>
                  <label for="TextBox_inputPassword">密码</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <asp:TextBox ID="TextBox_confirmPassword" class="form-control" placeholder=" " required="required"  runat="server" TextMode="Password"></asp:TextBox>
                  <label for="TextBox_confirmPassword">再次输入密码</label>
                </div>
              </div>
            </div>
          </div>
        <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                    <asp:TextBox ID="TextBox_sex" class="form-control" placeholder=" " required="required"  runat="server" ></asp:TextBox>
                  <label for="TextBox_sex">性别</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <asp:TextBox ID="TextBox_birthday" class="form-control" placeholder=" " required="required"  runat="server" ></asp:TextBox>
                  <label for="TextBox_birthday">出生日期
                    </label>
                </div>
              </div>
            </div>
          </div>
          <asp:Button ID="btn_register" class="btn btn-primary btn-block" runat="server" Text="注册" OnClick="btn_register_Click" />

              <asp:Button ID="btn_cancel" class="btn btn-primary btn-block" runat="server" Text="取消" OnClick="btn_cancel_Click" />
          </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="login.aspx">登录</a>
        </div>
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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userCenter.aspx.cs" Inherits="网上图书销售管理系统.userCenter" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人中心</title>
    <link rel="stylesheet" href="bootstrap-3.3.4/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="Flat-UI-master/dist/css/flat-ui.min.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="bootstrap-3.3.4/dist/js/jquery-1.11.3.min.js"></script>
    <style>
        .pagination {
            background: #16a085;
        }
    </style>
    <script>
        $(function () {
            $('#myTabs a').click(function () {
                if ($(this)[0].hash == "#orderManager" && $("#footer").hasClass("navbar-fixed-bottom")) {
                    $("#footer").removeClass("navbar-fixed-bottom");
                } else {
                    if (!$("#footer").hasClass("navbar-fixed-bottom")) {
                        $("#footer").addClass("navbar-fixed-bottom");
                    }
                }
                $(this).tab('show')
            });
        })
    </script>
</head>
<body>
<div class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a href="userIndex.aspx" class="navbar-brand">小小书店</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="userAllBook.aspx">全部分类</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li>
                    <span class="navbar-brand">欢迎,
                        <asp:Label ID="Label_show" runat="server" Text="Label"></asp:Label>
                    </span> 
                </li>
                <li>
                    <a href="userBuyCar.aspx"><span class="glyphicon glyphicon-shopping-cart">购物车</span></a>
                </li>
                <li>
                    <a href="userCenter.aspx">个人中心</a>
                </li>
                <li>
                    <a href="userLiuyan.aspx">留言</a>
                </li>
                <li>
                    <a href="login.aspx">退出登录</a>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="container">
    <div class="row thumbnail center col-sm-12">
        <div class="col-sm-12">
            <h3 class="text-center" style="margin-bottom: 20px">个人中心</h3>
        </div>

        <ul class="nav nav-tabs nav-justified" id="myTabs">
            <li class="active"><a href="#editInfo">个人信息</a></li>
            <li><a href="#editPassword">密码修改</a></li>
            <li><a href="#orderManager">查看订单</a></li>
        </ul>

        <!-- Tab panes -->
        <form runat="server">
            <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="editInfo">
                <div class="table-responsive" style="padding: 20px;">
                    <table class="table">
                        <tbody>
                        <tr>
                            <td>姓名</td>
                            <td><asp:Label ID="Label_name" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>用户名</td>
                            <td><asp:Label ID="Label_id" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>手机号码</td>
                            <td><asp:Label ID="Label_tel" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                         <tr>
                            <td>性别</td>
                            <td><asp:Label ID="Label_sex" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                         <tr>
                            <td>生日</td>
                            <td><asp:Label ID="Label_birthday" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                         <tr>
                            <td>地址</td>
                            <td><asp:Label ID="Label_address" runat="server" Text="Label"></asp:Label></td>
                        </tr>
                 
                        </tbody>
                    </table>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="editPassword">
                <div class="container" style="padding: 20px;">
                    <div class="col-sm-12">
                            <div class="form-group">
                                <label for="old_password" class="col-sm-4 control-label">旧密码</label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="TextBox_oldPwd" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="new_password" class="col-sm-4 control-label">新密码</label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="TextBox_newPwd" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="confirm_password" class="col-sm-4 control-label">确认密码</label>
                                <div class="col-sm-5">
                                    <asp:TextBox ID="TextBox_newPwd2" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-5">
                                    <asp:Button ID="Button_update" class="btn btn-info btn-block" runat="server" Text="修改" OnClick="Button_update_Click"/>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="orderManager">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" DataKeyNames="orderid" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize ="10">
                        <Columns>
                            <asp:BoundField DataField="orderid" HeaderText="订单号" InsertVisible="False" ReadOnly="True" SortExpression="orderid" />
                            <asp:BoundField DataField="bookname" HeaderText="图书名称" SortExpression="bookname" />
                            <asp:BoundField DataField="uid" HeaderText="用户账号" SortExpression="uid" />
                            <asp:BoundField DataField="saledate" HeaderText="购买日期" SortExpression="saledate" />
                            <asp:BoundField DataField="amount" HeaderText="数量" SortExpression="amount" />
                            <asp:BoundField DataField="money" HeaderText="金额" SortExpression="money" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SaleBookSystemConnectionString %>" SelectCommand="SELECT bookname,orders.*FROM [orders],[book] where book.bookid=orders.bookid"></asp:SqlDataSource>
                </div>
            </div>
        </div>
        </form>
    </div>
</div>

<script src="bootstrap-3.3.4/dist/js/bootstrap.min.js"></script>
<script src="Flat-UI-master/dist/js/flat-ui.min.js"></script>
<script src="bootstrap-3.3.4/js/carousel.js"></script>
</body>
</html>

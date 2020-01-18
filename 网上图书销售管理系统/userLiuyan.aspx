<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userLiuyan.aspx.cs" Inherits="网上图书销售管理系统.userLiuyan" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>留言</title>
    <link rel="stylesheet" href="bootstrap-3.3.4/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="Flat-UI-master/dist/css/flat-ui.min.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="bootstrap-3.3.4/dist/js/jquery-1.11.3.min.js"></script>
    <style>
        .row {
            margin-top: 20px;
        }

        .center {
            text-align: center;
        }

        .card {
            margin-top: 10px;
        }

        #dropdown-menu li {
            padding-bottom: 10px;
            line-height: 30px;
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
    <form id="form1" runat="server">
<div class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a href="userIndex.aspx" class="navbar-brand">小小书店</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="userAllbook.aspx">全部分类</a></li>
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
            <h3 class="text-center" style="margin-bottom: 20px">留言</h3>
        </div>

        <ul class="nav nav-tabs nav-justified" id="myTabs">
            <li class="active"><a href="#editInfo">留言</a></li>
            <li><a href="#orderManager">查看回复</a></li>
        </ul>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="editInfo">
                <div class="table-responsive" style="padding: 20px;">
                    <asp:TextBox ID="TextBox_liuyan" runat="server" class="form-control" TextMode="MultiLine" Height="150"></asp:TextBox>
                    <div style="align-content:center">
                       <asp:Button ID="Button_liuyan" class="btn btn-primary col-md-2 m-4" runat="server" Text="留言" OnClick="Button_liuyan_Click"/> 
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="orderManager">
                <div class="table-responsive">                   
                    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="count">
                        <Columns>
                            <asp:BoundField DataField="count" HeaderText="编号" InsertVisible="False" ReadOnly="True" SortExpression="count" />
                            <asp:BoundField DataField="uid" HeaderText="账号" SortExpression="uid" />
                            <asp:BoundField DataField="aid" HeaderText="管理员" SortExpression="aid" />
                            <asp:BoundField DataField="huifu_text" HeaderText="内容" SortExpression="huifu_text" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SaleBookSystemConnectionString %>" SelectCommand="SELECT * FROM [admin_advice]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
   </div>
</div>

<script src="bootstrap-3.3.4/dist/js/bootstrap.min.js"></script>
<script src="Flat-UI-master/dist/js/flat-ui.min.js"></script>
<script src="bootstrap-3.3.4/js/carousel.js"></script>
    </form>
</body>
</html>
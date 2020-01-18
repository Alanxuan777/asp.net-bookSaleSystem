<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userBuyCar.aspx.cs" Inherits="网上图书销售管理系统.userBuyCar" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>购物车</title>
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
    <div class="row thumbnail center">
        <div class="col-sm-12">
            <h3 class="text-center" style="margin-bottom: 20px">购物车</h3>
        </div>
        <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" DataKeyNames="count" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:TemplateField HeaderText="选择">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="uid" HeaderText="账号" SortExpression="uid" />
                <asp:BoundField DataField="bookid" HeaderText="图书编号" SortExpression="bookid" />
                <asp:BoundField DataField="bookname" HeaderText="图书名称" SortExpression="bookname" />
                <asp:BoundField DataField="amount" HeaderText="数量" SortExpression="amount" />
                <asp:BoundField DataField="bookprice" HeaderText="单价" SortExpression="bookprice" />
                <asp:BoundField DataField="总价" HeaderText="总价" ReadOnly="True" SortExpression="总价" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SaleBookSystemConnectionString %>" SelectCommand="SELECT buyCar.*,bookname,bookprice,bookprice*buyCar.amount as 总价 FROM [buyCar],book where book.bookid=buyCar.bookid"></asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="统计"></asp:Label>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="总数:"></asp:Label>
        &nbsp;
        <asp:Label ID="Label_count" runat="server" Text="0"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="总价:"></asp:Label>
        &nbsp;
        <asp:Label ID="Label_money" runat="server" Text="0"></asp:Label>
        <div class="col-sm-offset-9 col-sm-3" style="padding-bottom: 15px;">
            <asp:Button ID="Button_delete" class="btn btn-danger" runat="server" Text="删除" OnClick="Button_delete_Click" />
            <asp:Button ID="Button_buy" class="btn btn-success" runat="server" Text="购买" OnClick="Button_buy_Click"/>
        </div>
    </div>
</div>
        </form>
    </body>
</html>
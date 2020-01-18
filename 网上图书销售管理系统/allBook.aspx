<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="allBook.aspx.cs" Inherits="网上图书销售管理系统.allBook" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>图书分类</title>
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
            $('#myTabs li').click(function (e) {
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
            <a href="Index.aspx" class="navbar-brand">小小书店</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="allBook.aspx">全部分类</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li>
                    <asp:TextBox ID="TextBox_search" runat="server" class="form-control" placeholder="输入图书类型查询"></asp:TextBox>
                </li>
                <li><asp:Button ID="Button_search" runat="server" class="btn btn-info" Text="搜索" OnClick="Button_Search_Click"/></li>
                <li><a href="login.aspx">登录</a></li>
                <li><a href="register.aspx">注册</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container">
    <p>全部图书</p>
    <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-condensed" runat="server" AutoGenerateColumns="False" DataKeyNames="bookid" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="bookid" HeaderText="图书编号" ReadOnly="True" SortExpression="bookid" />
            <asp:BoundField DataField="bookname" HeaderText="图书编号" SortExpression="bookname" />
            <asp:BoundField DataField="booktype" HeaderText="图书类型" SortExpression="booktype" />
            <asp:BoundField DataField="bookprice" HeaderText="图书价格" SortExpression="bookprice" />
            <asp:BoundField DataField="publisher" HeaderText="出版社" SortExpression="publisher" />
            <asp:BoundField DataField="publisherdate" HeaderText="出版日期" SortExpression="publisherdate" />
            <asp:BoundField DataField="author" HeaderText="作者" SortExpression="author" />
            

            <asp:HyperLinkField DataNavigateUrlFields="bookid" DataNavigateUrlFormatString="login.aspx?bookid={0}" HeaderText="购买" Text="购买" />
            

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SaleBookSystemConnectionString %>" SelectCommand="SELECT * FROM [book]"></asp:SqlDataSource>
</div>  
<script src="bootstrap-3.3.4/dist/js/bootstrap.min.js"></script>
<script src="Flat-UI-master/dist/js/flat-ui.min.js"></script>
<script src="bootstrap-3.3.4/js/carousel.js"></script>
    </form>
</body>
</html>

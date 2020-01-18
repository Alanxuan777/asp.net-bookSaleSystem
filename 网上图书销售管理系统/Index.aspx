<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="网上图书销售管理系统.Index" %>

<DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>图书商城</title>
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
            <a href="userIndex.aspx" class="navbar-brand">小小书店</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="allBook.aspx">全部分类</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li>
                    <asp:TextBox ID="TextBox_search" runat="server" class="form-control" placeholder="输入关键字查询"></asp:TextBox>
                </li>
                <li><asp:Button ID="Button_search" runat="server" class="btn btn-info" Text="搜索" OnClick="Button_Search_Click"/></li>
                <li><a href="login.aspx">登录</a></li>
                <li><a href="register.aspx">注册</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="Images/book2.jpg" alt="" style="height: 500px;width: 100%;">
            </div>
            <div class="item">
                <img src="Images/book.png" alt="" style="height: 500px;width: 100%;">
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="card">
        <div class="panel panel-info">
            <div class="panel-heading">计算机</div>
            <div class="panel-body">
                <div class="row">
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="bookid" DataSourceID="SqlDataSource1" RepeatColumns="4" CssClass="table table-bordered" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both">
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        <ItemStyle BackColor="White" ForeColor="#330099" />
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" src='<%# Eval("imagesUrl") %>' style="width:100px;height:100px;"/>
                            <br/>
                            图书名:
                            <asp:Label ID="booknameLabel" runat="server" Text='<%# Eval("bookname") %>' />
                            <br />
                            价格:
                            <asp:Label ID="bookpriceLabel" runat="server" Text='<%# Eval("bookprice") %>' />
                            <br />
                            出版社:
                            <asp:Label ID="publisherLabel" runat="server" Text='<%# Eval("publisher") %>' />
                            <br />
                            <a href="javascript:alert('请先登录');window.location.href='login.aspx';" class="btn btn-info btn-block" >购买</a>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SaleBookSystemConnectionString %>" SelectCommand="SELECT * FROM [book] where booktype='计算机'"></asp:SqlDataSource>

                </div>
            </div>
        </div>
        <div class="panel panel-primary">
            <div class="panel-heading">小说</div>
            <div class="panel-body">
                <div class="row">
                    <asp:DataList ID="DataList2" runat="server" DataKeyField="bookid" DataSourceID="SqlDataSource2" RepeatColumns="4" CssClass="table table-bordered" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both">
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        <ItemStyle BackColor="White" ForeColor="#330099" />
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" src='<%# Eval("imagesUrl") %>' style="width:100px;height:100px;"/>
                            <br/>
                            图书名:
                            <asp:Label ID="booknameLabel" runat="server" Text='<%# Eval("bookname") %>' />
                            <br />
                            价格:
                            <asp:Label ID="bookpriceLabel" runat="server" Text='<%# Eval("bookprice") %>' />
                            <br />
                            出版社:
                            <asp:Label ID="publisherLabel" runat="server" Text='<%# Eval("publisher") %>' />
                            <br />
                            <a href="javascript:alert('请先登录');window.location.href='login.aspx';" class="btn btn-info btn-block" >购买</a>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SaleBookSystemConnectionString %>" SelectCommand="SELECT * FROM [book] where booktype='小说'"></asp:SqlDataSource>
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
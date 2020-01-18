<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userBookDetail.aspx.cs" Inherits="网上图书销售管理系统.userBookDetail" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>图书详情</title>
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
    <div class="row thumbnail">
        <div class="col-sm-4">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="Images/<%= Label_bookid.Text%>.jpg" alt="" style="height: 100px;width: 100px;align-content:center">
                    </div>
                </div>

            </div>
            <div class="caption center">
                <h5><asp:Label ID="Label_bookname" runat="server" Text="Label"></asp:Label></h5>
                <p>单价：<span class="text-danger"><asp:Label ID="Label_bookprice" runat="server" Text="Label"></asp:Label></span></p>
                    <input id="min" name="" type="button" value="-" />    
                    <input id="quantity" name="count"  type="text" value="1" />    
                    <input id="add" name="" type="button" value="+" />
                <p>
                    <asp:Button ID="Button_buy" class="btn btn-danger btn-block" runat="server" Text="立即购买" OnClick="Button_buy_Click" />
                    <asp:Button ID="Button_car" class="btn btn-warning btn-block" runat="server" Text="加入购物车" OnClick="Button_car_Click" />
                </p>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="caption">
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    基本信息
                </div>
                <div class="panel-body">
                    <div>作者：<asp:Label ID="Label_author" runat="server" Text="Label"></asp:Label></div>
                    <div>出版社：<asp:Label ID="Label_publisher" runat="server" Text="Label"></asp:Label></div>
                    <div>编号：<asp:Label ID="Label_bookid" runat="server" Text="Label"></asp:Label></div>
                    <div>出版日期：<asp:Label ID="Label_date" runat="server" Text="Label"></asp:Label></div>
                    <div>所属分类：<asp:Label ID="Label_booktype" runat="server" Text="Label"></asp:Label></div>
                </div>
            </div>
        </div>

    </div>
</div>
<script>    
$(function(){    
    var t = $("#quantity");    
    $("#add").click(function(){    
        t.val(parseInt(t.val())+1);    
        $("#min").removeAttr("disabled");                 //当按加1时，解除$("#min")不可读状态    
        setTotal();    
    })    
    $("#min").click(function(){    
               if (parseInt(t.val())>1) {                     //判断数量值大于1时才可以减少    
                t.val(parseInt(t.val())-1)    
                }else{    
                $("#min").attr("disabled","disabled")        //当$("#min")为1时，$("#min")不可读状态    
               }    
        setTotal();    
    })    
    function setTotal(){    
        $("#total").html((parseInt(t.val())*3.95).toFixed(2));    
    }    
    setTotal();    
})    
</script> 
<script src="bootstrap-3.3.4/dist/js/bootstrap.min.js"></script>
<script src="Flat-UI-master/dist/js/flat-ui.min.js"></script>
<script src="bootstrap-3.3.4/js/carousel.js"></script>
    </form>
  </body>
</html>


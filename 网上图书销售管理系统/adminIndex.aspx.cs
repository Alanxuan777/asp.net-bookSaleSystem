using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace 网上图书销售管理系统
{
    public partial class adminIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConnSql conn = new ConnSql();
                String sqlText = "select count(*) from yonghu";
                String sqlText2 = "select count(*) from orders";
                String sqlText3 = "select sum(sales) from sales";
                String sqlText4 = "select count(*) from book";
                try
                {
                    SqlDataReader read = conn.selectRead(sqlText);
                    SqlDataReader read2 = conn.selectRead(sqlText2);
                    SqlDataReader read3 = conn.selectRead(sqlText3);
                    SqlDataReader read4 = conn.selectRead(sqlText4);
                    if (read.HasRows)
                    {
                        while (read.Read())
                        {
                            Label_yonghu.Text = read.GetInt32(0).ToString();
                        }
                    }
                    if (read2.HasRows)
                    {
                        while (read2.Read())
                        {
                            Label_order.Text = read2.GetInt32(0).ToString();
                        }
                    }
                    if (read3.HasRows)
                    {
                        while (read3.Read())
                        {
                            Label_sales.Text = read3.GetInt32(0).ToString();
                        }
                    }
                    if (read4.HasRows)
                    {
                        while (read4.Read())
                        {
                            Label_book.Text = read4.GetInt32(0).ToString();
                        }
                    }
                }
                catch
                {

                }
            }
        }
        protected void Button_Search_Click1(object sender, EventArgs e)
        {
            if (TextBox1.Text == "意见箱")
            {
                Response.Redirect("~/adminAdviceLook.aspx");
            }
            else if (TextBox1.Text == "修改密码")
            {
                Response.Redirect("~/adminUpdatePwd.aspx");
            }
            else if (TextBox1.Text == "订单管理")
            {
                Response.Redirect("~/adminLookOrder.aspx");
            }
            else if (TextBox1.Text == "查看图书")
            {
                Response.Redirect("~/adminSearchBook.aspx");
            }
            else if (TextBox1.Text == "修改图书")
            {
                Response.Redirect("~/adminUpdateBook.aspx");
            }
            else if (TextBox1.Text == "添加图书")
            {
                Response.Redirect("~/adminAddBook.aspx");
            }
            else if (TextBox1.Text == "图书统计")
            {
                Response.Redirect("~/adminBookCount.aspx");
            }
            else if (TextBox1.Text == "查看用户")
            {
                Response.Redirect("~/adminSearchUser.aspx");
            }
            else if (TextBox1.Text == "修改用户")
            {
                Response.Redirect("~/adminUpdateUser.aspx");
            }
            else if (TextBox1.Text == "销售汇总")
            {
                Response.Redirect("~/adminSalessummary.aspx");
            }
        }
    }
}
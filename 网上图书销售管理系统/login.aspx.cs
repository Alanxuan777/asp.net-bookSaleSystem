using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace 网上图书销售管理系统
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }


        protected void btn_login_Click1(object sender, EventArgs e)
        {
            ConnSql conn = new ConnSql();
            String id = TextBox_id.Text.ToString();
            String password = TextBox_pwd.Text.ToString();
            if (RadioButtonList1.SelectedItem.Text == "用户")
            {
                String sqlText = "select * from yonghu where uid='"+id+"' and upassword='"+password+"'";
                try
                {
                    if (conn.selectSql(sqlText)>0)
                    {
                        Session["password"] = password;
                        Session["id"] = id;
                        Response.Redirect("~/userIndex.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('账号或密码错误！');</script>");
                    }
                }
                catch
                {
                    Response.Write("<script>alert('用户登录失败');</script>");
                }
            }
            else if (RadioButtonList1.SelectedItem.Text == "管理员")
            {
                String sqlText = "select * from admin where aid='" + id + "' and apassword='" + password + "'";
                try
                {
                    if (conn.selectSql(sqlText)>0)
                    {
                        Session["password"] = password;
                        Session["id"] = id;
                        Response.Redirect("~/adminIndex.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('账号或密码错误！');</script>");
                    }
                }
                catch
                {
                    Response.Write("<script>alert('管理员登录失败');</script>");
                }
            }
        }
    }
}
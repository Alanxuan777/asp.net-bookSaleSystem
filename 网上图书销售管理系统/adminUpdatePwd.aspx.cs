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
    public partial class adminUpdatePwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_update_Click(object sender, EventArgs e)
        {
            String id = Session["id"].ToString();
            String password = Session["password"].ToString();
            String oldPwd = TextBox_oldPwd.Text.Trim().ToString();
            String newPwd = TextBox_newPwd.Text.Trim().ToString();
            String newPwd2 = TextBox_newPwd2.Text.Trim().ToString();
            ConnSql conn = new ConnSql();
            if (password != oldPwd)
            {
                Response.Write("<script>alert('原密码错误！');</script>");
            }
            else
            {
                if (newPwd != newPwd2)
                {
                    Response.Write("<script>alert('两次输入密码不一致！');</script>");
                }
                else
                {
                    if (newPwd == password)
                    {
                        Response.Write("<script>alert('输入密码不能和原密码相同！');</script>");
                    }
                    else
                    {
                        try
                        {
                            String sqlText = "update admin set apassword='" + newPwd + "' where aid='" + id + "'";
                            conn.RunSql(sqlText);
                            Response.Write("<script>alert('修改成功！');</script>");
                        }
                        catch (Exception ex)
                        {
                            Response.Write("<script>alert('修改失败');</script>");
                            Response.Write(ex);
                        }
                    }
                }
            }
        }

        protected void Button_cancle_Click(object sender, EventArgs e)
        {
            TextBox_oldPwd.Text = "";
            TextBox_newPwd.Text = "";
            TextBox_newPwd2.Text = "";
        }
    }
}
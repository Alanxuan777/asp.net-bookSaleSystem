using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace 网上图书销售管理系统
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            ConnSql conn = new ConnSql();
            String name = TextBox_name.Text.ToString();
            String tel = TextBox_tel.Text.ToString();
            String id = TextBox_id.Text.ToString();
            String address = TextBox_address.Text.ToString();
            String password1 = TextBox_inputPassword.Text.ToString();
            String password2 = TextBox_confirmPassword.Text.ToString();
            String sex = TextBox_sex.Text.ToString();
            String birthday = TextBox_birthday.Text.ToString();
            String sqlText = "insert into yonghu values('"+id+"','"+name+"','"+sex+"','"+Convert.ToDateTime(birthday)+"'," +
                "'"+password1+"','"+tel+"','"+address+"')";
            String sqlText2 = "select * from yonghu where uid='" + id + "'";
            if (conn.selectSql(sqlText2) > 0)
            {
                Response.Write("<script>alert('该账号已被注册!');</script>"); 
            }
            else
            {
                if (password1 != password2)
                {

                    Response.Write("<script>alert('两次输入的密码不同!');</script>");
                }
                else
                {
                    try
                    {
                        conn.RunSql(sqlText);
                        Response.Write("<script>alert('注册成功!');window.location.href='./login.aspx';</script>");
                    }
                    catch
                    {
                        Response.Write("<script>alert('注册失败!');</script>");
                    }
                }
            }
            
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            TextBox_name.Text = "";
            TextBox_tel.Text = "";
            TextBox_id.Text = "";
            TextBox_address.Text = "";
            TextBox_inputPassword.Text = "";
            TextBox_confirmPassword.Text = "";
            TextBox_sex.Text = "";
            TextBox_birthday.Text = "";
        }
    }
}
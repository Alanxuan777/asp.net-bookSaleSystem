using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 网上图书销售管理系统
{
    public partial class userCenter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String id = Session["id"].ToString();
                String sql = "SELECT bookname,orders.* FROM orders,book where book.bookid=orders.bookid and uid='" + id + "'";
                ConnSql conn = new ConnSql();
                String sqlText = "select uid,uname,sex,birthday,tel,address from yonghu where uid='" + id + "'";
                try
                {
                    SqlDataReader read = conn.selectRead(sqlText);
                    while (read.Read())
                    {
                        Label_show.Text = read.GetString(1).ToString();
                        Label_id.Text = read.GetString(0).ToString();
                        Label_name.Text = read.GetString(1).ToString();
                        Label_sex.Text = read.GetString(2);
                        Label_birthday.Text = read.GetDateTime(3).ToString();
                        Label_tel.Text = read.GetString(4);
                        Label_address.Text = read.GetString(5);
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                }
                SqlDataSource1.SelectCommand = sql;
                GridView1.DataSourceID = "SqlDataSource1";
                GridView1.DataBind();
            }
        }
        protected void Button_update_Click(object sender, EventArgs e)
        {
            String id = Session["id"].ToString();
            String password = Session["password"].ToString();
            String oldPwd = TextBox_oldPwd.Text.Trim().ToString();
            String newPwd = TextBox_newPwd.Text.Trim().ToString();
            String newPwd2 = TextBox_newPwd2.Text.Trim().ToString();
            ConnSql conn = new ConnSql();
            if (oldPwd == "" || newPwd == "" || newPwd2 == "")
            {
                Response.Write("<script>alert('请输入文本框内容！');</script>");
            }
            else
            {
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
                                String sqlText = "update yonghu set upassword='" + newPwd + "' where uid='" + id + "'";
                                conn.RunSql(sqlText);
                                Response.Write("<script>alert('修改成功！');</script>");
                                TextBox_oldPwd.Text = "";
                                TextBox_newPwd.Text = "";
                                TextBox_newPwd2.Text = "";
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
        }
    }
}
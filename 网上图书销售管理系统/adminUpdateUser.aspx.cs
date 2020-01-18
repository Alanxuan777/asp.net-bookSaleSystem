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
    public partial class adminUpdateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList_sex.AppendDataBoundItems = true;
                ListItem li = new ListItem("请选择", "0");
                DropDownList_sex.Items.Insert(0, li);
                String uid = null;
                if (Request.QueryString.Count > 0)
                {
                    uid = Request.QueryString["uid"].ToString();
                }
                Label_uid.Text = uid;
                ConnSql conn = new ConnSql();
                String sqlText = "select * from yonghu where uid='" + uid + "'";
                if (uid != null)
                {
                    try
                    {
                        SqlDataReader read = conn.selectRead(sqlText);
                        while (read.Read())
                        {
                            TextBox_name.Text = read.GetString(1).ToString();
                            TextBox_birthday.Text = read.GetDateTime(3).ToString();
                            TextBox_password.Text = read.GetString(4);
                            TextBox_tel.Text = read.GetString(5).ToString();
                            TextBox_address.Text = read.GetString(6);
                            this.DropDownList_sex.Text = read.GetString(2);
                        }
                        conn.Close();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex);
                    }
                }
            }
        }

        protected void Button_update_Click(object sender, EventArgs e)
        {
            String text_search = TextBox_Search.Text.ToString();
            String uid = null;
            if (Request.QueryString.Count > 0)
            {
                uid = Request.QueryString["uid"];
            }
            else
            {
                if (text_search == "")
                {
                    Response.Write("<script>alert('请输入用户账号查询');</script>");
                }
                else
                {
                    uid = TextBox_Search.Text.ToString();
                }
            }
            String name = TextBox_name.Text.Trim().ToString();
            String sex = DropDownList_sex.SelectedItem.Text.Trim().ToString();
            String birthday = TextBox_birthday.Text.Trim().ToString();
            String password = TextBox_password.Text.Trim().ToString();
            String tel = TextBox_tel.Text.Trim().ToString();
            String address = TextBox_address.Text.Trim().ToString();
            if (!TextBox_name.Text.Trim().Equals("") && !TextBox_birthday.Text.Trim().Equals("") && !TextBox_password.Text.Trim().Equals("") &&
                !TextBox_tel.Text.Trim().Equals("") && !TextBox_address.Text.Trim().Equals("") && DropDownList_sex.SelectedItem.Text != "请选择")
            {
                try
                {
                    String sqlText = "update yonghu set uname='" + name + "',sex='" + sex + "',birthday='" + Convert.ToDateTime(birthday) + "'," +
                    "upassword='" + password + "',tel='" + tel + "',address='" + address + "' where uid='" + uid + "'";
                    ConnSql conn = new ConnSql();
                    conn.RunSql(sqlText);
                    Response.Write("<script>alert('修改成功');</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('修改失败');</script>");
                    Response.Write(ex);
                }

            }
            else
            {
                Response.Write("<script>alert('输入内容不可为空');</script>");
            }
        }

        protected void Button_cancle_Click(object sender, EventArgs e)
        {
            TextBox_name.Text = "";
            DropDownList_sex.SelectedItem.Selected = false;
            TextBox_birthday.Text = "";
            TextBox_password.Text = "";
            TextBox_tel.Text = "";
            TextBox_address.Text = "";
        }

        protected void Button_Search_Click(object sender, EventArgs e)
        {
            String text_search = TextBox_Search.Text.ToString();
            if (text_search == "")
            {
                Response.Write("<script>alert('内容不可为空');</script>");
            }
            else
            {
                ConnSql conn = new ConnSql();
                String sqlText = "select * from yonghu where uid='" + text_search + "'";
                try
                {
                    SqlDataReader reader = conn.selectRead(sqlText);
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            TextBox_name.Text = reader.GetString(1).ToString();
                            TextBox_birthday.Text = reader.GetDateTime(3).ToString();
                            TextBox_password.Text = reader.GetString(4);
                            TextBox_tel.Text = reader.GetString(5).ToString();
                            TextBox_address.Text = reader.GetString(6);
                            this.DropDownList_sex.Text = reader.GetString(2);
                        }
                        Label_uid.Text = text_search;
                    }
                    else
                    {
                        Response.Write("<script>alert('查询结果为空');</script>");
                    }
                    conn.Close();
                }
                catch 
                {
                    Response.Write("<script>alert('查询结果为空');</script>");
                }
            }
        }
    }
}
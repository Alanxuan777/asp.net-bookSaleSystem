using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 网上图书销售管理系统
{
    public partial class userLiuyan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String id = Session["id"].ToString();
                ConnSql conn = new ConnSql();
                String sql = "select * from admin_advice where uid='" + id + "'";
                String sqlText = "select uname from yonghu where uid='" + id + "'";
                try
                {
                    SqlDataReader read = conn.selectRead(sqlText);
                    while (read.Read())
                    {
                        Label_show.Text = read.GetString(0).ToString();
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

        protected void Button_liuyan_Click(object sender, EventArgs e)
        {
            String id = Session["id"].ToString();
            String text_liuyan = TextBox_liuyan.Text.ToString();
            ConnSql conn = new ConnSql();
            if (text_liuyan == "")
            {
                Response.Write("<script>alert('请输入内容');</script>");
            }
            else
            {
                String sqlText = "insert into advice(uid,advice_text) values('" + id + "','" + text_liuyan + "')";
                try
                {
                    conn.RunSql(sqlText);
                    Response.Write("<script>alert('留言成功');</script>");
                    TextBox_liuyan.Text = "";
                }
                catch
                {
                    Response.Write("<script>alert('留言失败');</script>");
                }
            }
        }
    }
}
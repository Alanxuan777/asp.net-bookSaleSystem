using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 网上图书销售管理系统
{
    public partial class userAllbook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String id = Session["id"].ToString();
                ConnSql conn = new ConnSql();
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
            }
        }
        protected void Button_Search_Click(object sender, EventArgs e)
        {
            String text_search = TextBox_search.Text.ToString();
            if (text_search == "")
            {
                Response.Write("<script>alert('请输入查询内容');</script>");
            }
            else
            {
                String sql = "select * from book where booktype='" + text_search + "'";
                SqlDataSource1.SelectCommand = sql;
                GridView1.DataSourceID = "SqlDataSource1";
                GridView1.DataBind();
            }
        }
    }
}
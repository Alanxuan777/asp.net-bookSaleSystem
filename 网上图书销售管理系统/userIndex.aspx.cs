using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 网上图书销售管理系统
{
    public partial class userIndex : System.Web.UI.Page
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
                if (text_search == "全部分类")
                {
                    Response.Redirect("~/userAllBook.aspx");
                }
                else if (text_search == "个人中心")
                {
                    Response.Redirect("~/userCenter.aspx");
                }
                else if (text_search == "留言")
                {
                    Response.Redirect("~/userLiuyan.aspx");
                }
                else if (text_search == "购物车")
                {
                    Response.Redirect("~/userBuyCar.aspx");
                }
                else
                {
                    Response.Write("<script>alert('查询结果为空');</script>");
                }
            }
        }
    }
}
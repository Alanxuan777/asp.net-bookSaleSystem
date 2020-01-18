using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 网上图书销售管理系统
{
    public partial class allBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
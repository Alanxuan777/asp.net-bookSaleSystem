using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 网上图书销售管理系统
{
    public partial class adminLookOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Search_Click(object sender, EventArgs e)
        {
            if (TextBox_search.Text == "")
            {
                Response.Write("<script>alert('请输入查询内容');</script>");
            }
            else
            {
                String sql = "select orders.* from orders,yonghu where yonghu.uname='"+TextBox_search.Text.ToString()+"' and yonghu.uid=orders.uid";
                SqlDataSource1.SelectCommand = sql;
                GridView1.DataSourceID = "SqlDataSource1";
                GridView1.DataBind();
                if (GridView1.Rows.Count == 0)
                {
                    Response.Write("<script>alert('查询结果为空');</script>");
                }
            }      
        }
    }
}
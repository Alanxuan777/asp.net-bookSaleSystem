using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace 网上图书销售管理系统
{
    public partial class adminCenter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String id = Session["id"].ToString();
                ConnSql conn = new ConnSql();
                String sqlText = "select aid,aname from admin where aid='" + id + "'";
                try
                {
                    SqlDataReader read = conn.selectRead(sqlText);
                    if (read.HasRows)
                    {
                        while (read.Read())
                        {
                            Label_id.Text = read.GetString(0);
                            Label_name.Text = read.GetString(1);
                        }
                        conn.Close();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                }
            }
            
        }
    }
}
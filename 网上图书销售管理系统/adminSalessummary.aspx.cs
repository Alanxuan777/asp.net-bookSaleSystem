using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;
using System.Web.SessionState;

namespace 网上图书销售管理系统
{
    public partial class adminSalessummary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String id = DropDownList1.SelectedItem.Value.ToString();
            HttpCookie cookies = new HttpCookie("bookid",id);
            Response.Cookies.Add(cookies);
        }
        public List<Model> SelectSales(int id)
        {
            List<Model> list = null;
            ConnSql conn = new ConnSql();
            String sqltext = "select quarter,sales from sales where bookid="+id+"";
            SqlDataReader reader = conn.selectRead(sqltext);
            if (reader.HasRows)
            {
                list = new List<Model>();
                while (reader.Read())
                {
                    Model data = new Model();
                    data.quarter = reader.GetString(0);
                    data.sales = reader.GetInt32(1);
                    list.Add(data);
                }
            }
            return list;
        }

    }
    public class Model
    {
        public String quarter { get; set; }
        public int sales { get; set; }
    }
}
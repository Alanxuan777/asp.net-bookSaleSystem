using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 网上图书销售管理系统
{
    public partial class adminBookCount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        public List<BookType> SelectType()
        {
            List<BookType> list = null;
            ConnSql conn = new ConnSql();
            String sqltext = "select distinct booktype,count(booktype) from book group by booktype";
            SqlDataReader reader = conn.selectRead(sqltext);
            if (reader.HasRows)
            {
                list = new List<BookType>();
                while (reader.Read())
                {
                    BookType data = new BookType();
                    data.type = reader.GetString(0);
                    data.count = reader.GetInt32(1);
                    list.Add(data);
                }
            }
            return list;
        }
    }
    public class BookType
    {
        public String type { get; set; }
        public int count { get; set; }
    }
}
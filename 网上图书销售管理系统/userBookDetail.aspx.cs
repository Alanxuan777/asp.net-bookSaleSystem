using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace 网上图书销售管理系统
{
    public partial class userBookDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String id = Request.QueryString["bookid"];
                ConnSql conn = new ConnSql();
                String sqlText = "select * from book where bookid='" + id + "'";
                try
                {
                    SqlDataReader read = conn.selectRead(sqlText);
                    while (read.Read())
                    {
                        Label_bookid.Text = read.GetInt32(0).ToString();
                        Label_bookname.Text = read.GetString(1);
                        Label_booktype.Text = read.GetString(2);
                        Label_bookprice.Text = read.GetDouble(3).ToString();
                        Label_publisher.Text = read.GetString(4);
                        Label_date.Text = read.GetDateTime(5).ToString();
                        Label_author.Text = read.GetString(6);
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                }
            }
        }

        protected void Button_buy_Click(object sender, EventArgs e)
        {
            int count= Convert.ToInt32(Request.Form["count"].ToString());
            double money = Convert.ToDouble(Label_bookprice.Text)*count;
            String uid = Session["id"].ToString();
            String sqlText2;
            int month=Convert.ToInt32(DateTime.Now.Month.ToString());
            if (month >= 1 && month <= 3)
            {
                sqlText2 = "update sales set sales=sales+" + count + " where bookid='" + Label_bookid.Text + "' " +
                    "and quarter='第一季度'";
            }
            else if (month >= 4 && month <= 6)
            {
                sqlText2 = "update sales set sales=sales+" + count + " where bookid='" + Label_bookid.Text + "' " +
                    "and quarter='第二季度'";
            }
            else if (month >= 7 && month <= 9)
            {
                sqlText2 = "update sales set sales=sales+" + count + " where bookid='" + Label_bookid.Text + "' " +
                    "and quarter='第三季度'";
            }
            else
            {
                sqlText2 = "update sales set sales=sales+" + count + " where bookid='" + Label_bookid.Text + "' " +
                    "and quarter='第四季度'";
            }
            ConnSql conn = new ConnSql();
            String sqlText = "insert into orders(bookid,uid,saledate,amount,money) values" +
                "('"+Label_bookid.Text+"','"+uid+"','"+ DateTime.Now + "',"+count+","+money+")";
            try
            {
                conn.RunSql(sqlText);
                conn.RunSql(sqlText2);
                Response.Write("<script>alert('购买成功');</script>");
            }
            catch(Exception ex)
            {
                Response.Write(ex);
            }
        }

        protected void Button_car_Click(object sender, EventArgs e)
        {
            String uid = Session["id"].ToString();
            String bookid = Label_bookid.Text.ToString();
            int amount = Convert.ToInt32(Request.Form["count"].ToString());
            String sqlText = "insert into buyCar values('" + uid + "','" + bookid + "'," + amount + ")";
            ConnSql conn = new ConnSql();
            try
            {
                conn.RunSql(sqlText);
                Response.Write("<script>alert('成功加入购物车');</script>");
            }
            catch
            {
                Response.Write("<script>alert('加入购物车失败');</script>");
            }
        }
    }
}
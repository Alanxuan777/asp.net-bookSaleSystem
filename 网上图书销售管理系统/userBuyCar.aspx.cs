using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace 网上图书销售管理系统
{
    public partial class userBuyCar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String id = Session["id"].ToString();
                String sql = "SELECT buyCar.*,bookname,bookprice,bookprice*buyCar.amount as 总价" +
                    " FROM [buyCar],book where book.bookid=buyCar.bookid and uid='" + id + "'";
                SqlDataSource1.SelectCommand = sql;
                GridView1.DataSourceID = "SqlDataSource1";
                GridView1.DataBind();
                selectAmount_Money();
            }          
        }

        protected void Button_delete_Click(object sender, EventArgs e)
        {
            ConnSql conn = new ConnSql();
            int sum = 0;
            try
            {
                for (int i = 0; i < this.GridView1.Rows.Count; i++)
                {
                    if ((this.GridView1.Rows[i].Cells[0].FindControl("CheckBox1") as CheckBox).Checked == true)
                    {
                        sum += 1;
                        String count = this.GridView1.DataKeys[i].Values[0].ToString();
                        String sqlText = "delete from buyCar where count='" + count + "'";
                        conn.RunSql(sqlText);
                    }
                }
                if (sum == 0)
                {
                    Response.Write("<script>alert('请选择要删除的项');</script>");
                }
                else
                {
                    Response.Write("<script>alert('删除成功');</script>");
                    String id = Session["id"].ToString();
                    String sql = "SELECT buyCar.*,bookname,bookprice,bookprice*buyCar.amount as 总价" +
                        " FROM [buyCar],book where book.bookid=buyCar.bookid and uid='" + id + "'";
                    SqlDataSource1.SelectCommand = sql;
                    GridView1.DataSourceID = "SqlDataSource1";
                    GridView1.DataBind();
                    selectAmount_Money();
                }
            }
            catch { }
        }

        protected void Button_buy_Click(object sender, EventArgs e)
        {
            String id = Session["id"].ToString();
            ConnSql conn = new ConnSql();
            int sum = 0;
            try
            {
                for (int i = 0; i < this.GridView1.Rows.Count; i++)
                {
                    if ((this.GridView1.Rows[i].Cells[0].FindControl("CheckBox1") as CheckBox).Checked == true)
                    {
                        sum += 1;
                        String count = this.GridView1.DataKeys[i].Values[0].ToString();
                        String sqlText = "delete from buyCar where count='" + count + "'";
                        String sqlText2 = "select buyCar.bookid,amount,amount*bookprice from book, buyCar " +
                            "where book.bookid = buyCar.bookid and count = '" + count + "'";
                        String sqlText3;
                        String sqlText4;
                        SqlDataReader reader = conn.selectRead(sqlText2);
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                sqlText3 = "insert into orders(bookid,uid,saledate,amount,money) values" +
                                     "('" + reader.GetInt32(0).ToString() + "','" + id + "','" + DateTime.Now + "'," +
                                     "" + reader.GetInt32(1) + "," + reader.GetDouble(2) + ")";
                                int month = Convert.ToInt32(DateTime.Now.Month.ToString());
                                if (month >= 1 && month <= 3)
                                {
                                    sqlText4 = "update sales set sales=sales+" + reader.GetInt32(1) + " where bookid='" + reader.GetInt32(0) + "' " +
                                        "and quarter='第一季度'";
                                }
                                else if (month >= 4 && month <= 6)
                                {
                                    sqlText4 = "update sales set sales=sales+" + reader.GetInt32(1) + " where bookid='" + reader.GetInt32(0) + "' " +
                                        "and quarter='第二季度'";
                                }
                                else if (month >= 7 && month <= 9)
                                {
                                    sqlText4 = "update sales set sales=sales+" + reader.GetInt32(1) + " where bookid='" + reader.GetInt32(0) + "' " +
                                        "and quarter='第三季度'";
                                }
                                else
                                {
                                    sqlText4 = "update sales set sales=sales+" + reader.GetInt32(1) + " where bookid='" + reader.GetInt32(0) + "' " +
                                        "and quarter='第四季度'";
                                }
                                conn.RunSql(sqlText3);
                                conn.RunSql(sqlText);
                                conn.RunSql(sqlText4);
                            }
                        }
                    }
                }
                if (sum == 0)
                {
                    Response.Write("<script>alert('请选择要购买的项');</script>");
                }
                else
                {
                    Response.Write("<script>alert('购买成功');</script>");
                    String sql = "SELECT buyCar.*,bookname,bookprice,bookprice*buyCar.amount as 总价" +
                        " FROM [buyCar],book where book.bookid=buyCar.bookid and uid='" + id + "'";
                    SqlDataSource1.SelectCommand = sql;
                    GridView1.DataSourceID = "SqlDataSource1";
                    GridView1.DataBind();
                    selectAmount_Money();
                }
            }
            catch { }
        }
        public void selectAmount_Money()
        {
            String id = Session["id"].ToString();
            ConnSql conn = new ConnSql();
            String sqlText = "select sum(amount),sum(bookprice*amount) from " +
                "buyCar,book where book.bookid=buyCar.bookid and uid='" + id + "'";
            SqlDataReader reader = conn.selectRead(sqlText);
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    if (reader.IsDBNull(0))
                    {
                        Label_count.Text = "0";
                        Label_money.Text = "0";
                    }
                    else
                    {
                        Label_count.Text = reader.GetInt32(0).ToString();
                        Label_money.Text = reader.GetDouble(1).ToString();
                    }
                }
            }
        }
    }
}
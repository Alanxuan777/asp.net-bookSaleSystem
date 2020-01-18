using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace 网上图书销售管理系统
{
    public partial class adminUpdateBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList_booktype.AppendDataBoundItems = true;
                ListItem li = new ListItem("请选择", "0");
                DropDownList_booktype.Items.Insert(0, li);
                String bookid =null;
                if (Request.QueryString.Count > 0)
                {
                    bookid = Request.QueryString["bookid"].ToString();
                }
                Label_bookid.Text = bookid;
                ConnSql conn = new ConnSql();
                String sqlText = "select * from book where bookid='"+bookid+"'";
                if (bookid != null)
                {
                    try
                    {
                        SqlDataReader read = conn.selectRead(sqlText);
                        while (read.Read())
                        {
                            TextBox_name.Text = read.GetString(1).ToString();
                            TextBox_price.Text = read.GetDouble(3).ToString();
                            TextBox_publisher.Text = read.GetString(4);
                            TextBox_publisherdate.Text = read.GetDateTime(5).ToString();
                            TextBox_author.Text = read.GetString(6);
                            this.DropDownList_booktype.Text = read.GetString(2);
                        }
                        conn.Close();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex);
                    }
                }
            }
        }

        protected void Button_update_Click(object sender, EventArgs e)
        {
            String text_search = TextBox_Search.Text.ToString();
            String bookid = null;
            if (Request.QueryString.Count > 0)
            {
                bookid = Request.QueryString["bookid"];
            }
            else
            {
                if (text_search == "")
                {
                    Response.Write("<script>alert('请输入编号查询');</script>");
                }
                else
                {
                    bookid = TextBox_Search.Text.ToString();
                }
            }
            String bookname = TextBox_name.Text.Trim().ToString();
            String booktype = DropDownList_booktype.SelectedItem.Text.Trim().ToString();
            String bookprice = TextBox_price.Text.Trim().ToString();
            String publisher = TextBox_publisher.Text.Trim().ToString();
            String publisherdate = TextBox_publisherdate.Text.Trim().ToString();
            String author = TextBox_author.Text.Trim().ToString();
            if (!TextBox_name.Text.Trim().Equals("")&& !TextBox_price.Text.Trim().Equals("")&& !TextBox_publisher.Text.Trim().Equals("")&&
                !TextBox_publisherdate.Text.Trim().Equals("")&& !TextBox_author.Text.Trim().Equals("")&&DropDownList_booktype.SelectedItem.Text!="请选择")
            {
                try
                {
                    String sqlText = "update book set bookname='" + bookname + "',booktype='" + booktype + "',bookprice=" + Convert.ToDouble(bookprice) + "," +
                    "publisher='" + publisher + "',publisherdate='" + Convert.ToDateTime(publisherdate) + "',author='" + author + "' where bookid='" + bookid + "'";
                    ConnSql conn = new ConnSql();
                    conn.RunSql(sqlText);
                    Response.Write("<script>alert('修改成功');</script>");

                }
                catch 
                {
                    Response.Write("<script>alert('修改失败');</script>");
                }
                
            }
            else
            {
                Response.Write("<script>alert('输入内容不可为空');</script>");
            }
        }

        protected void Button_cancle_Click(object sender, EventArgs e)
        {
            TextBox_name.Text = "";
            DropDownList_booktype.SelectedItem.Selected = false;
            TextBox_price.Text = "";
            TextBox_publisher.Text = "";
            TextBox_publisherdate.Text = "";
            TextBox_author.Text = "";
        }
        protected void Button_Search_Click(object sender, EventArgs e)
        {
            String text_search = TextBox_Search.Text.ToString();
            if (text_search == "")
            {
                Response.Write("<script>alert('内容不可为空');</script>");
            }
            else
            {
                ConnSql conn = new ConnSql();
                String sqlText = "select * from book where bookid='" + text_search + "'";
                try
                {
                    SqlDataReader reader = conn.selectRead(sqlText);
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            TextBox_name.Text = reader.GetString(1).ToString();
                            TextBox_price.Text = reader.GetDouble(3).ToString();
                            TextBox_publisher.Text = reader.GetString(4);
                            TextBox_publisherdate.Text = reader.GetDateTime(5).ToString();
                            TextBox_author.Text = reader.GetString(6);
                            this.DropDownList_booktype.Text = reader.GetString(2);
                        }
                        Label_bookid.Text = text_search;
                    }
                    else
                    {
                        Response.Write("<script>alert('查询结果为空');</script>");
                    }
                    conn.Close();
                }
                catch 
                {
                    Response.Write("<script>alert('查询结果为空');</script>");
                }
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 网上图书销售管理系统
{
    public partial class adminSearchBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList_booktype.AppendDataBoundItems = true;
                ListItem li = new ListItem("全部", "0");
                DropDownList_booktype.Items.Insert(0, li);
            }
        }

        protected void DropDownList_booktype_SelectedIndexChanged(object sender, EventArgs e)
        {
            String booktype = DropDownList_booktype.SelectedItem.Text.ToString();
            String sql = "select * from book where booktype='" + booktype + "'";
            if (booktype == "全部")
            {
                sql = "select * from book";
            }
            SqlDataSource1.SelectCommand = sql;
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
        }

        protected void Button_Search_Click(object sender, EventArgs e)
        {
            String choose = DropDownList_choose.SelectedItem.Text.ToString();
            String booktype = DropDownList_booktype.SelectedItem.Text.ToString();
            String sql="";
            String textbox_search = TextBox_search.Text.ToString();
            if (textbox_search == "")
            {
                Response.Write("<script>alert('请输入查询内容');</script>");
            }
            else
            {
                if(booktype== "全部")
                {
                    switch (choose)
                    {
                        case "-请选择-":
                            Response.Write("<script>alert('请选择查询内容');</script>");
                            sql = "select * from book";
                            break;
                        case "图书名称":
                            sql = "select * from book where bookname='" + textbox_search + "'";
                            break;
                        case "图书作者":
                            sql = "select * from book where author='" + textbox_search + "'";
                            break;
                        case "出版社":
                            sql = "select * from book where publisher='" + textbox_search + "'";
                            break;
                        case "图书编号":
                            sql = "select * from book where bookid='" + textbox_search + "'";
                            break;
                    }
                }
                else
                {
                    switch (choose)
                    {
                        case "-请选择-":
                            Response.Write("<script>alert('请选择查询内容');</script>");
                            sql = "select * from book where booktype='" + booktype + "'";
                            break;
                        case "图书名称":
                            sql = "select * from book where bookname='" + textbox_search + "' and booktype='"+booktype+"'";
                            break;
                        case "图书作者":
                            sql = "select * from book where author='" + textbox_search + "' and booktype='" + booktype + "'";
                            break;
                        case "出版社":
                            sql = "select * from book where publisher='" + textbox_search + "' and booktype='" + booktype + "'";
                            break;
                        case "图书编号":
                            sql = "select * from book where bookid='" + textbox_search + "' and booktype='" + booktype + "'";
                            break;
                    }
                }
               
            }
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
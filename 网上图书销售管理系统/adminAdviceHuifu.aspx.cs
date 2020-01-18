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
    public partial class adminAdviceHuifu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.Count > 0)
                {
                    Label_uid.Text = Request.QueryString["uid"].ToString();
                    Label_advice.Text = Request.QueryString["advice_text"].ToString();
                }
            }
        }

        protected void Button_cancle_Click(object sender, EventArgs e)
        {
            TextBox_huifu.Text = "";
        }

        protected void Button_huifu_Click(object sender, EventArgs e)
        {
            String text_huifu = TextBox_huifu.Text;
            String aid = Session["id"].ToString();
            String uid = Label_uid.Text;
            if (TextBox_huifu.Text == "")
            {
                Response.Write("<script>alert('请输入回复内容');</script>");
            }
            else
            {
                try
                {
                    String sqlText = "insert into admin_advice(uid,aid,huifu_text) values('"+uid+ "','" + aid + "','" + text_huifu + "') ";
                    ConnSql conn = new ConnSql();
                    conn.RunSql(sqlText);
                    Response.Write("<script>alert('回复成功');</script>");
                }
                catch
                {
                    Response.Write("<script>alert('回复失败');</script>");
                }
            }
        }
    }
}
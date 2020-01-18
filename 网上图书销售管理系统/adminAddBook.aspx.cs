using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 网上图书销售管理系统
{
    public partial class adminAddBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_add_Click(object sender, EventArgs e)
        {
            String bookid = TextBox_bookid.Text.Trim().ToString();
            String bookname = TextBox_name.Text.Trim().ToString();
            String booktype = TextBox_type.Text.Trim().ToString();
            String bookprice = TextBox_price.Text.Trim().ToString();
            String publisher = TextBox_publisher.Text.Trim().ToString();
            String publisherdate = TextBox_publisherdate.Text.Trim().ToString();
            String author = TextBox_author.Text.Trim().ToString();
            String url = "Images/" + bookid + ".jpg";
            if (!TextBox_name.Text.Trim().Equals("") && !TextBox_price.Text.Trim().Equals("") && !TextBox_publisher.Text.Trim().Equals("") &&
                 !TextBox_publisherdate.Text.Trim().Equals("") && !TextBox_author.Text.Trim().Equals("") &&
                 !TextBox_bookid.Text.Trim().Equals("")&& !TextBox_type.Text.Trim().Equals(""))
            {
                try
                {
                    String sqlText = "insert into book values('"+bookid+ "','" + bookname + "','" + booktype + "'," + Convert.ToDouble(bookprice) + "," +
                                                                  "'" + publisher + "','" + Convert.ToDateTime(publisherdate) + "','" + author + "','"+ url + "')";
                    String sqlText2 = "insert into sales values('" + bookid + "','第一季度',0),('" + bookid + "','第二季度',0)," +
                        "('" + bookid + "','第三季度',0),('" + bookid + "','第四季度',0)";
                    ConnSql conn = new ConnSql();
                    conn.RunSql(sqlText);
                    conn.RunSql(sqlText2);
                    Response.Write("<script>alert('添加成功');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('添加失败');</script>");
                    Response.Write(ex);
                }

            }
            else
            {
                Response.Write("<script>alert('输入内容不可为空');</script>");
            }
        }

        protected void Button_cancle_Click(object sender, EventArgs e)
        {
            TextBox_bookid.Text = "";
            TextBox_name.Text = "";
            TextBox_type.Text = "";
            TextBox_price.Text = "";
            TextBox_publisher.Text = "";
            TextBox_publisherdate.Text = "";
            TextBox_author.Text = "";
        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string filename = FileUpload1.FileName;
                //获取上传名字
                string fileext = ".jpg";
                //返回指定图片的后缀
                string filenamaes = TextBox_bookid.Text+ fileext;
                //获取当前时间
                FileUpload1.SaveAs(Server.MapPath(".") + "//Images//" + filenamaes);
                //上传到此项目根目录的images文件夹
                Response.Write("<script>alert('上传成功');</script>");

            }
            else
            {
                Response.Write("<script>alert('请选择图片');</script>");
            }

        }
    }
}
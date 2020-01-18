using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using System.Web.SessionState;

namespace 网上图书销售管理系统
{
    /// <summary>
    /// Handler 的摘要说明
    /// </summary>
    public class Handler : IHttpHandler 
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Charset = "utf-8";
            String id = "1";
            if (context.Request.Cookies["bookid"] != null)
            {
                id = context.Request.Cookies["bookid"].Value.ToString();
            }
            adminSalessummary conn = new adminSalessummary();
            string jsonData = JsonConvert.SerializeObject(conn.SelectSales(Convert.ToInt32(id)));
            context.Response.Write(jsonData);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;

namespace 网上图书销售管理系统
{
    public class ConnSql
    {
        private String constr = ConfigurationManager.ConnectionStrings["xqxcon"].ConnectionString;
        private SqlConnection con;
        private SqlCommand com;
        public void Open()
        {
            #region
            con = new SqlConnection(constr);
            con.Open();
            #endregion
        }
        public void Close()
        {
            #region
            if (con != null)
            {
                con.Close();
                con.Dispose();
            }
            #endregion
        }

        public void RunSql(String strSql)
        {
            #region
            Open();
            com = new SqlCommand(strSql, con);
            com.ExecuteNonQuery();
            Close();
            #endregion
        }
        public int selectSql(String StrSql)
        {
            #region
            Open();
            com = new SqlCommand(StrSql, con);
            int n = Convert.ToInt32(com.ExecuteScalar());
            Close();
            return n;
            #endregion
        }
        public SqlDataReader selectRead(String StrSql)
        {
            #region
            Open();
            com = new SqlCommand(StrSql, con);
            SqlDataReader reader = com.ExecuteReader();
            return reader;
            #endregion
        }
        
    }


}
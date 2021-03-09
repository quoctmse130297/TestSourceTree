using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace MarkReport
{
    class MyConnection
    {
        public static SqlConnection conn;
        public static SqlCommand cmd;
        public static SqlDataAdapter da;

        public SqlConnection GetConn()
        {
            // chuỗi connection
            conn = new SqlConnection(@"Server=SE130297\SQLEXPRESS;database=MarkReport;user id=sa;password=123456");
            return conn;
        }
        public static void OpenDB()
        {
            String sql = @"Server=SE130297\SQLEXPRESS;database=MarkReport;user id=sa;password=123456";
            try
            {
                conn = new SqlConnection(sql);
                conn.Open();
            }
            catch (SqlException e)
            {
          //      throw e;
            }
        }

        public static void Disconnect()
        {
            conn.Close();
            conn.Dispose();
            conn = null;
        }

        public static DataTable GetDataTable(string sql)
        {
            cmd = new SqlCommand(sql, conn);
            da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataTable table = new DataTable();
            da.Fill(table);

            da.Dispose();
            cmd.Dispose();

            return table;
        }

        public static void Execute(String sql)
        {
            cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();

        }
    }
}

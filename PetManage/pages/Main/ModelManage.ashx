<%@ WebHandler Language="C#" Class="ModelManage" %>

using System;
using System.Web;
using System.Text;

public class ModelManage : IHttpHandler {
    DataLayer sqlOperation = new DataLayer("sqlStr");
    public void ProcessRequest (HttpContext context) {
        String json = getInfo(context);
        context.Response.ContentType = "text/plain";
        sqlOperation.Close();
        sqlOperation.Dispose();
        context.Response.Write(json);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }
    public String getInfo(HttpContext context) {
        String countSql = "select count(*) from modelregist";
        String sql = "select id,name,amount from modelregist";
        int count = int.Parse(sqlOperation.ExecuteScalar(countSql));
        MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(sql);
        StringBuilder sb = new StringBuilder("{\"Item\":[");
        int temp = 0;
        while (reader.Read()) {
            sb.Append ( "{\"ID\":\""+reader["id"].ToString()+"\"," +
                "\"name\":\""+reader["name"].ToString()+"\"," +
                "\"amount\":\""+reader["amount"].ToString()+"\"}");
            if (temp < count - 1) {
                sb.Append(",");
            }
            temp++;
        }
        sb.Append("]}");
        return sb.ToString();
    }
}
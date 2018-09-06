<%@ WebHandler Language="C#" Class="AddPatientHisInit" %>

using System;
using System.Web;
using System.Text;
public class AddPatientHisInit : IHttpHandler {
    DataLayer sqlOperation = new DataLayer("sqlStr");
    public void ProcessRequest (HttpContext context) {
        String flag = init(context);
        context.Response.ContentType = "text/plain";
        context.Response.Write(flag);
        sqlOperation.Close();
        sqlOperation.Dispose();
    }

    public bool IsReusable {
        get {
            return false;
        }
    }
    public String init(HttpContext context) {
        String DrAdvNumber = context.Request["DrAdvNumber"];
        String source = context.Request["source"];
        String sqlStr = "";
        if (source.Equals("0"))
        {
            sqlStr = "select ID from patient where DrAdvId=@DrAdvId";
            sqlOperation.AddParameterWithValue("@DrAdvId", DrAdvNumber);
        }else
        {
            sqlStr = "select ID from patient where DrAdvIdHos=@DrAdvIdHos";
            sqlOperation.AddParameterWithValue("@DrAdvIdHos", DrAdvNumber);
        }
        int isSuccess = sqlOperation.ExecuteNonQuery(sqlStr);
        //if (isSuccess >= 1)
        //{
        //    return "exit";
        //}
        //else
        //{
        //    return "notExit";
        //}
        MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(sqlStr);
        if (reader.Read())
        {
            return "exit";
        }
        else
        {
            return "notExit";
        }
    }
}
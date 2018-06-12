<%@ WebHandler Language="C#" Class="deleteassets" %>

using System;
using System.Web;

public class deleteassets : IHttpHandler
{
    DataLayer sqlOperation = new DataLayer("sqljiuye");
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        context.Response.Write(delete(context));
        sqlOperation.Close();
        sqlOperation.Dispose();
        sqlOperation = null;
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    public string delete(HttpContext context)
    {
        string id = context.Request["Id"];
        string sqlCommand = "DELETE FROM intangibleassets WHERE Id=@id";
        sqlOperation.AddParameterWithValue("@id", id);
        int intSuccess = sqlOperation.ExecuteNonQuery(sqlCommand);
        return (intSuccess > 0) ? "suceess" : "fail";
    }
}
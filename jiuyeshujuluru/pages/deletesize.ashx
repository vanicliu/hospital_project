<%@ WebHandler Language="C#" Class="deletesize" %>

using System;
using System.Web;

public class deletesize : IHttpHandler {
    DataLayer sqlOperation = new DataLayer("sqljiuye");
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(delete(context));
        sqlOperation.Close();
        sqlOperation.Dispose();
        sqlOperation = null;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }
    public string delete(HttpContext context) {
        string id = context.Request.Form["ID"];
        string sqlCommand = "DELETE FROM size WHERE ID=@id";
        sqlOperation.AddParameterWithValue("@id", id);
        sqlOperation.ExecuteNonQuery(sqlCommand);
        return "success";
    }
}
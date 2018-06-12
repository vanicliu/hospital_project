<%@ WebHandler Language="C#" Class="deletehistory" %>

using System;
using System.Web;

public class deletehistory : IHttpHandler {
    DataLayer sqlOperation = new DataLayer("sqljiuye");
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(delete(context));
        sqlOperation.Dispose();
        sqlOperation.Close();
        sqlOperation = null;

    }

    public bool IsReusable {
        get {
            return false;
        }
    }
    public string delete(HttpContext context) {
        string id = context.Request["ID"];
        string deletecommand = "delete from history where ID=@id";
        sqlOperation.AddParameterWithValue("@id", id);
        sqlOperation.ExecuteNonQuery(deletecommand);
        return "success";
    }
}
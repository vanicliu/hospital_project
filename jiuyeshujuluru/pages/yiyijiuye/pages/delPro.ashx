<%@ WebHandler Language="C#" Class="delPro" %>

using System;
using System.Web;

public class delPro : IHttpHandler {
    
    DataLayer sqlOperation = new DataLayer("sqljiuye");
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(deletePro(context));
        sqlOperation.Close();
        sqlOperation.Dispose();
        sqlOperation = null;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

    public string deletePro(HttpContext context)
    {
        string id = context.Request["ID"];
        string sqlCommand = "DELETE FROM product WHERE ID=@id";
        sqlOperation.AddParameterWithValue("@id", id);
        sqlOperation.ExecuteNonQuery(sqlCommand);
        return "success";
    }
}
<%@ WebHandler Language="C#" Class="delRi" %>

using System;
using System.Web;

public class delRi : IHttpHandler {

    DataLayer sqlOperation = new DataLayer("sqljiuye");
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(deleteRi(context));
        sqlOperation.Close();
        sqlOperation.Dispose();
        sqlOperation = null;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

    public string deleteRi(HttpContext context)
    {
        string id = context.Request["ID"];
        string sqlCommand = "DELETE FROM researchinvestment WHERE ID=@id";
        sqlOperation.AddParameterWithValue("@id", id);
        sqlOperation.ExecuteNonQuery(sqlCommand);
        return "success";
    }
}
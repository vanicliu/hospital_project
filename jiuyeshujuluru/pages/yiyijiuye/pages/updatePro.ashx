<%@ WebHandler Language="C#" Class="updatePro" %>

using System;
using System.Web;
using System.Text;

public class updatePro : IHttpHandler {
    private DataLayer sqlOperation = new DataLayer("sqljiuye");
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(updPro(context));
        sqlOperation.Close();
        sqlOperation.Dispose();
        sqlOperation = null;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

    public string updPro(HttpContext context)
    {
        string id = context.Request["ID"];
        string enterprise = context.Request["enterprise"];
        string brand = context.Request["brand"];
        string degree = context.Request["degree"];
        string scent = context.Request["scent"];
        string other = context.Request["other"];
        string sqlCommand = "UPDATE product SET enterprise=@enterprise,brand=@brand,degree=@degree,scent=@scent,other=@other WHERE ID=@id";
        sqlOperation.AddParameterWithValue("@id", id);
        sqlOperation.AddParameterWithValue("@enterprise", enterprise);
        sqlOperation.AddParameterWithValue("@brand", brand);
        sqlOperation.AddParameterWithValue("@degree", degree);
        sqlOperation.AddParameterWithValue("@scent", scent);
        sqlOperation.AddParameterWithValue("@other", other);
        sqlOperation.ExecuteNonQuery(sqlCommand);
        return "success";
    }

}
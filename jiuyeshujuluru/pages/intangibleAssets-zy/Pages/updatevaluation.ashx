<%@ WebHandler Language="C#" Class="updatevaluation" %>

using System;
using System.Web;
using System.Text;
public class updatevaluation : IHttpHandler {
    private DataLayer sqlOperation = new DataLayer("sqljiuye");
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        context.Response.Write(update(context));
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
    public string update(HttpContext context)
    {
        string id = context.Request["Id"];
        string enterprise = context.Request["Enterprise"];
        string delphiMethod = context.Request["DelphiMethod"];
        string consumerSurvey = context.Request["ConsumerSurvey"];
        string sqlCommand = "update socialvaluation set enterprise=@enterprise,delphiMethod=@delphiMethod,consumerSurvey=@consumerSurvey where Id=@id";
        sqlOperation.AddParameterWithValue("@id", id);
        sqlOperation.AddParameterWithValue("@enterprise", enterprise);
        sqlOperation.AddParameterWithValue("@delphiMethod", delphiMethod);
        sqlOperation.AddParameterWithValue("@consumerSurvey", consumerSurvey);
        sqlOperation.ExecuteNonQuery(sqlCommand);
        return "success";

    }

}
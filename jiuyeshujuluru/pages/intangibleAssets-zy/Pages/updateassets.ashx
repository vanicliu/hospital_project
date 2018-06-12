<%@ WebHandler Language="C#" Class="updateassets" %>

using System;
using System.Web;
using System.Text;

public class updateassets : IHttpHandler {
    private DataLayer sqlOperation = new DataLayer("sqljiuye");
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        context.Response.Write(update(context));
        sqlOperation.Close();
        sqlOperation.Dispose();
        sqlOperation = null;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    public string update(HttpContext context)
    {
        string id = context.Request["Id"];
        string enterprise = context.Request["Enterprise"];
        string patentValue = context.Request["PatentValue"];
        string brandValue = context.Request["BrandValue"];
        string internationalAward = context.Request["InternationalAward"];
        string nationAward = context.Request["NationAward"];
        string provinceAward = context.Request["ProvinceAward"];
        string sqlCommand = "update intangibleassets set enterprise=@enterprise,patentValue=@patentValue,brandValue=@brandValue,internationalAward=@internationalAward,nationAward=@nationAward,provinceAward=@provinceAward where Id=@id";
        sqlOperation.AddParameterWithValue("@id", id);        
        sqlOperation.AddParameterWithValue("@enterprise", enterprise);
        sqlOperation.AddParameterWithValue("@patentValue", patentValue);
        sqlOperation.AddParameterWithValue("@brandValue", brandValue);
        sqlOperation.AddParameterWithValue("@internationalAward", internationalAward);
        sqlOperation.AddParameterWithValue("@nationAward", nationAward);
        sqlOperation.AddParameterWithValue("@provinceAward", provinceAward);
        sqlOperation.ExecuteNonQuery(sqlCommand);
        return "success";

    }

}
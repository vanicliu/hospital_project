<%@ WebHandler Language="C#" Class="addvaluation" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public class addvaluation : IHttpHandler {
    private DataLayer sqlOperation = new DataLayer("sqlyyjy");
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(AddValuation(context));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    public string AddValuation(HttpContext context)
    {
		string Enterprise = context.Request.Form["enterprise"];
        string DelphiMethod = context.Request.Form["professional"];
        string ConsumerSurvey = context.Request.Form["consumer"];
        
        //将信息写入数据库，并返回是否成功
        string strSqlCommand = "INSERT INTO socialvaluation(Enterprise,DelphiMethod,ConsumerSurvey) " +
                                "VALUES(@Enerprise,@DelphiMethod,@ConsumerSurvey)";
		sqlOperation.AddParameterWithValue("@Enterprise", Enterprise);
        sqlOperation.AddParameterWithValue("@DelphiMethod", DelphiMethod);
        sqlOperation.AddParameterWithValue("@ConsumerSurvey", ConsumerSurvey);    
        int intSuccess = sqlOperation.ExecuteNonQuery(strSqlCommand);


        return (intSuccess > 0) ? "true" : "false";
    }
}
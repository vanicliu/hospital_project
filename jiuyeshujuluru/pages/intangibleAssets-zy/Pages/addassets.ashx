<%@ WebHandler Language="C#" Class="addassets" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public class addassets : IHttpHandler {
    private DataLayer sqlOperation = new DataLayer("sqlyyjy");
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(AddAssets(context));
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    public string AddAssets(HttpContext context)
    {
		string Enterprise = context.Request.Form["enterprise"]
        string PatentValue = context.Request.Form["patent"];
        string BrandValue = context.Request.Form["brand"];
        string NationAward = context.Request.Form["nation"];
        string ProvinceAward = context.Request.Form["province"];
        //将信息写入数据库，并返回是否成功
        string strSqlCommand = "INSERT INTO intangibleassets(Enterprise,PatentValue,BrandValue,NationAward,ProvinceAward) " +
                                "VALUES(@Enterprise,@PatentValue,@BrandValue,@NationAward,@ProvinceAward)";
		sqlOperation.AddParameterWithValue("@Enterprise", Enterprise);
        sqlOperation.AddParameterWithValue("@PatentValue", PatentValue);
        sqlOperation.AddParameterWithValue("@BrandValue", BrandValue);
        sqlOperation.AddParameterWithValue("@NationAward", NationAward);
        sqlOperation.AddParameterWithValue("@ProvinceAward", ProvinceAward);
        int intSuccess = sqlOperation.ExecuteNonQuery(strSqlCommand);


        return (intSuccess > 0) ? "true" : "false";
    }
}
<%@ WebHandler Language="C#" Class="updatehistory" %>

using System;
using System.Web;

public class updatehistory : IHttpHandler {
   private DataLayer sqlOperation = new DataLayer("sqljiuye");
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(update(context));
        sqlOperation.Dispose();
        sqlOperation.Close();
        sqlOperation = null;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }
    public string update(HttpContext context) {
        string id = context.Request["ID"];
        string enterprise = context.Request["enterprise"];
        string buildTime = context.Request["buildTime"];
        string usedName = context.Request["usedName"];
        string nowName = context.Request["nowName"];
        string changeTime = context.Request["changeTime"];
        string usedName2 = context.Request["usedName2"];
        string nowName2 = context.Request["nowName2"];
        string changeTime2 = context.Request["changeTime2"];
        string usedName3 = context.Request["usedName3"];
        string nowName3 = context.Request["nowName3"];
        string changeTime3 = context.Request["changeTime3"];
        string remains = context.Request["remains"];
        string product = context.Request["product"];
        string sqlCommand = "UPDATE history SET enterprise=@enterprise,buildTime=@buildTime,usedName=@usedName,nowName=@nowName,changeTime=@changeTime,usedName2=@usedName2,nowName2=@nowName2,changeTime2=@changeTime2,usedName3=@usedName3,nowName3=@nowName3,changeTime3=@changeTime3,remains=@remains,product=@product where ID=@id";
        sqlOperation.AddParameterWithValue("@id", id);
        sqlOperation.AddParameterWithValue("@enterprise", enterprise);
        sqlOperation.AddParameterWithValue("@buildTime", buildTime);
        sqlOperation.AddParameterWithValue("@usedName", usedName);
        sqlOperation.AddParameterWithValue("@nowName", nowName);
        sqlOperation.AddParameterWithValue("@changeTime", changeTime);
        sqlOperation.AddParameterWithValue("@usedName2", usedName2);
        sqlOperation.AddParameterWithValue("@nowName2", nowName2);
        sqlOperation.AddParameterWithValue("@changeTime2", changeTime2);
        sqlOperation.AddParameterWithValue("@usedName3", usedName3);
        sqlOperation.AddParameterWithValue("@nowName3", nowName3);
        sqlOperation.AddParameterWithValue("@changeTime3", changeTime3);
        sqlOperation.AddParameterWithValue("@remains", remains);
        sqlOperation.AddParameterWithValue("@product", product);
        sqlOperation.ExecuteNonQuery(sqlCommand);
            return "success";
    }
}
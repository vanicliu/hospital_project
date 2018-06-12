<%@ WebHandler Language="C#" Class="updatesize" %>
using System;
using System.Web;
using System.Text;

public class updatesize : IHttpHandler {
    private DataLayer sqlOperation = new DataLayer("sqljiuye");
    public void ProcessRequest (HttpContext context) {
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
    public string update(HttpContext context) {
        string id = context.Request["ID"];
        string year = context.Request["year"];
        string enterprise = context.Request["enterprise"];
        string totalassets = context.Request["totalassets"];
        string area = context.Request["area"];
        string productoutput = context.Request["productoutput"];
        string employeesnumber = context.Request["employeesnumber"];
        string sqlCommand = "update size set year=@year,enterprise=@enterprise,totalassets=@totalassets,area=@area,productoutput=@productoutput,employeesnumber=@employeesnumber where ID=@id";
        sqlOperation.AddParameterWithValue("@id", id);
        sqlOperation.AddParameterWithValue("@year", year);
        sqlOperation.AddParameterWithValue("@enterprise", enterprise);
        sqlOperation.AddParameterWithValue("@totalassets", totalassets);
        sqlOperation.AddParameterWithValue("@area", area);
        sqlOperation.AddParameterWithValue("@productoutput", productoutput);
        sqlOperation.AddParameterWithValue("@employeesnumber", employeesnumber);
        sqlOperation.ExecuteNonQuery(sqlCommand);
        return "success";

    }
}
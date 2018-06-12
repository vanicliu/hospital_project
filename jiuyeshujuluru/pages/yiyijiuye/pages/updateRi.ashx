<%@ WebHandler Language="C#" Class="updateRi" %>

using System;
using System.Web;
using System.Text;

public class updateRi : IHttpHandler {
    private DataLayer sqlOperation = new DataLayer("sqljiuye");
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(updRi(context));
        sqlOperation.Close();
        sqlOperation.Dispose();
        sqlOperation = null;
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

    public string updRi(HttpContext context)
    {
        string id = context.Request["ID"];
        string enterprise = context.Request["enterprise"];
        string year = context.Request["year"];
        string techDevelopCost = context.Request["techDevelopCost"];
        string RdInvestment = context.Request["RdInvestment"];
        string RdOrgLevel = context.Request["RdOrgLevel"];
        string RderNum = context.Request["RderNum"];
        string RderSeniorNum = context.Request["RderSeniorNum"];
        string patentFilingNum = context.Request["patentFilingNum"];
        string patentLicNum = context.Request["patentLicNum"];
        string sqlCommand = "UPDATE researchinvestment SET enterprise=@enterprise,year=@year,techDevelopCost=@techDevelopCost,RdInvestment=@RdInvestment,RdOrgLevel=@RdOrgLevel,RderNum=@RderNum,RderSeniorNum=@RderSeniorNum,patentFilingNum=@patentFilingNum,patentLicNum=@patentLicNum WHERE ID=@id";
        sqlOperation.AddParameterWithValue("@id", id);
        sqlOperation.AddParameterWithValue("@enterprise", enterprise);
        sqlOperation.AddParameterWithValue("@year", year);
        sqlOperation.AddParameterWithValue("@techDevelopCost", techDevelopCost);
        sqlOperation.AddParameterWithValue("@RdInvestment", RdInvestment);
        sqlOperation.AddParameterWithValue("@RdOrgLevel", RdOrgLevel);
        sqlOperation.AddParameterWithValue("@RderNum", RderNum);
        sqlOperation.AddParameterWithValue("@RderSeniorNum", RderSeniorNum);
        sqlOperation.AddParameterWithValue("@patentFilingNum", patentFilingNum);
        sqlOperation.AddParameterWithValue("@patentLicNum", patentLicNum);
        sqlOperation.ExecuteNonQuery(sqlCommand);
        return "success";
    }
}
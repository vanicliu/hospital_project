<%@ WebHandler Language="C#" Class="UpdatepatientHIS" %>

using System;
using System.Web;

public class UpdatepatientHIS : IHttpHandler {
    private DataLayer sqlOperation = new DataLayer("sqlStr");
    private DataLayer sqlOperation1 = new DataLayer("sqlStr");

    private DataLayer sqlOperation3 = new DataLayer("sqlStr");

    private DataLayer sqlOperation5 = new DataLayer("sqlStr");
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            string json = UpdatepatentInfo(context);
            sqlOperation.Close();
            sqlOperation.Dispose();
            context.Response.Write(json);
        }
        catch (Exception ex)
        {
            MessageBox.Message(ex.Message);
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

    private string UpdatepatentInfo(HttpContext context)
    {

        int doctorid = Convert.ToInt32(context.Request.Form["doctor"]);
        String source = context.Request.Form["DrAdvSource"];
        DateTime datetime = Convert.ToDateTime(context.Request.Form["orddate"]);
        
        string strSqlCommand = "UPDATE patient SET  Department=@Department,Ward=@Ward,Bed=@Bed,DrAdvId=@DrAdvId,DrAdvName=@DrAdvName,DrAdvSource=@DrAdvSource,PatientIdentify=@PatientIdentify,Hospital_ID=@hospitalnumber,ApplyDoctor=@ApplyDoctor,RegisterTimeHos=@RegisterTimeHos where IdentificationNumber=@IdentificationNumber";
        string strSqlCommand2 = "UPDATE patient SET  Department=@Department,Ward=@Ward,Bed=@Bed,DrAdvIdHos=@DrAdvIdHos,DrAdvName=@DrAdvName,DrAdvSource=@DrAdvSource,PatientIdentify=@PatientIdentify,Hospital_ID=@hospitalnumber,ApplyDoctor=@ApplyDoctor,RegisterTimeHos=@RegisterTimeHos where IdentificationNumber=@IdentificationNumber";
        //各参数赋予实际值
        sqlOperation.AddParameterWithValue("@Department", context.Request.Form["Department"]);
        sqlOperation.AddParameterWithValue("@Ward", context.Request.Form["Ward"]);
        sqlOperation.AddParameterWithValue("@Bed", context.Request.Form["Bed"]);
        sqlOperation.AddParameterWithValue("@DrAdvName", context.Request.Form["DrAdvName"]);
        sqlOperation.AddParameterWithValue("@DrAdvSource", context.Request.Form["DrAdvSource"]);
        sqlOperation.AddParameterWithValue("@PatientIdentify", context.Request.Form["PatientIdentify"]);
        if (context.Request.Form["hospitalnumber"] != "")
        {
            sqlOperation.AddParameterWithValue("@hospitalnumber", context.Request.Form["hospitalnumber"]);
        }
        else
        {
            sqlOperation.AddParameterWithValue("@hospitalnumber", null);
        }
        sqlOperation.AddParameterWithValue("@ApplyDoctor", context.Request.Form["ApplyDoctor"]);
        sqlOperation.AddParameterWithValue("@IdentificationNumber", context.Request.Form["IDcardNumber"]);
        sqlOperation.AddParameterWithValue("@RegisterTimeHos", datetime);
        int Success = -1;
        if(source == "门诊")
        {
            sqlOperation.AddParameterWithValue("@DrAdvId", context.Request.Form["DrAdvNumber"]);
            Success = sqlOperation.ExecuteNonQuery(strSqlCommand);
        }else if(source == "住院"){
            sqlOperation.AddParameterWithValue("@DrAdvIdHos", context.Request.Form["DrAdvHosNumber"]);
            Success = sqlOperation.ExecuteNonQuery(strSqlCommand2);
        }
        //if (context.Request.Form["group"] != "allItem")
        //{
        //    string command = "update treatment set Group_ID=@group,Belongingdoctor=@doc where ID=@treat";
        //    sqlOperation.AddParameterWithValue("@group", Convert.ToInt32(context.Request.Form["group"]));
        //    sqlOperation.AddParameterWithValue("@treat", Convert.ToInt32(context.Request.Form["treatID"]));
        //    sqlOperation.AddParameterWithValue("@doc", doctorid);
        //    int success2 = sqlOperation.ExecuteNonQuery(command);
        //}
        if (Success > 0)
        {
            return "success";
        }
        else
        {
            return "failure";
        }


    }
}
<%@ WebHandler Language="C#" Class="AddPatientHIS" %>

using System;
using System.Web;

public class AddPatientHIS : IHttpHandler
{
    private DataLayer sqlOperation = new DataLayer("sqlStr");
    private DataLayer sqlOperation1 = new DataLayer("sqlStr");
    private DataLayer sqlOperation2 = new DataLayer("sqlStr");

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            string json = RecordPatientInformation(context);
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

    private string RecordPatientInformation(HttpContext context)
    {
        int hospitalnumber = 0;
        if(context.Request.Form["hospitalnumber"] != "")
        {
            hospitalnumber = Convert.ToInt32(context.Request.Form["hospitalnumber"]);
        }
        int doctorid = Convert.ToInt32(context.Request.Form["doctor"]);
        //int userID = Convert.ToInt32(context.Request.Form["userID"]);
        DateTime datetime = Convert.ToDateTime(context.Request.Form["orddate"]);


        //插入数据
        string strSqlCommand = "INSERT INTO patient(DiagInfo,DrAdvIdHos,Department,Ward,Bed,DrAdvId,DrAdvSource,ApplyDoctor,PatientIdentify,DrAdvName,newCardId,IdentificationNumber,Name,Gender,Age,Birthday,Nation,Address,Contact1,Contact2,RegisterDoctor,RegisterTime,Hospital_ID,Nameping,Radiotherapy_ID) VALUES("
         + "@DiagInfo,@DrAdvIdHos,@Department,@Ward,@Bed,@DrAdvId,@DrAdvSource,@ApplyDoctor,@PatientIdentify,@DrAdvName,@newCardId,@IdentificationNumber,@Name,@Gender,@Age,@Birthday,@Nation,@Address,@Contact1,@Contact2,@doctorid,@RegisterTime,@hospitalnumber,@Nameping,@Radiotherapy_ID)";

        //各参数赋予实际值
        sqlOperation.AddParameterWithValue("@DiagInfo", context.Request.Form["DiagInfo"]);
        sqlOperation.AddParameterWithValue("@DrAdvIdHos", context.Request.Form["DrAdvHosNumber"]);
        sqlOperation.AddParameterWithValue("@Department", context.Request.Form["Department"]);
        sqlOperation.AddParameterWithValue("@Ward", context.Request.Form["Ward"]);
        sqlOperation.AddParameterWithValue("@Bed", context.Request.Form["Bed"]);
        sqlOperation.AddParameterWithValue("@DrAdvId", context.Request.Form["DrAdvNumber"]);
        sqlOperation.AddParameterWithValue("@DrAdvSource", context.Request.Form["DrAdvSource"]);
        sqlOperation.AddParameterWithValue("@ApplyDoctor", context.Request.Form["ApplyDoctor"]);
        sqlOperation.AddParameterWithValue("@PatientIdentify", context.Request.Form["PatientIdentify"]);
        sqlOperation.AddParameterWithValue("@DrAdvName", context.Request.Form["DrAdvName"]);
        sqlOperation.AddParameterWithValue("@newCardId", context.Request.Form["CardID"]);
        sqlOperation.AddParameterWithValue("@IdentificationNumber", context.Request.Form["IDcardNumber"]);
        sqlOperation.AddParameterWithValue("@Name", context.Request.Form["userName"]);
        sqlOperation.AddParameterWithValue("@Gender", context.Request.Form["Gender"]);
        sqlOperation.AddParameterWithValue("@Birthday", context.Request.Form["Birthday"]);
        sqlOperation.AddParameterWithValue("@Age", Convert.ToInt32(DateTime.Now.Year.ToString()) - Convert.ToInt32(context.Request.Form["Birthday"].Substring(0, 4)));
        sqlOperation.AddParameterWithValue("@Nation", context.Request.Form["Nation"]);
        sqlOperation.AddParameterWithValue("@Address", context.Request.Form["Address"]);
        sqlOperation.AddParameterWithValue("@Contact1", context.Request.Form["Number1"]);
        sqlOperation.AddParameterWithValue("@Contact2", context.Request.Form["Number2"]);
        sqlOperation.AddParameterWithValue("@doctorid", doctorid);
        sqlOperation.AddParameterWithValue("@RegisterTime", datetime);
        sqlOperation.AddParameterWithValue("@Nameping", context.Request.Form["usernamepingyin"]);
        sqlOperation.AddParameterWithValue("@Radiotherapy_ID", context.Request.Form["radionumber"]);
        if (context.Request.Form["hospitalnumber"] != "")
        {
            sqlOperation.AddParameterWithValue("@hospitalnumber", hospitalnumber);
        }
        else
        {
            sqlOperation.AddParameterWithValue("@hospitalnumber", null);
        }
        int intSuccess = sqlOperation.ExecuteNonQuery(strSqlCommand);


        //每个病人注册成功后会先注册一条疗程信息
        string patientID = "select ID  from patient where Name=@Name and IdentificationNumber=@IdentificationNumber order by ID desc";
        sqlOperation1.AddParameterWithValue("@IdentificationNumber", context.Request.Form["IDcardNumber"]);
        sqlOperation1.AddParameterWithValue("@Name", context.Request.Form["userName"]);
        int patient = Convert.ToInt32(sqlOperation1.ExecuteScalar(patientID));
        int intSuccess2 = 0;
        if (intSuccess > 0)
        {
            if (context.Request.Form["group"] == "allItem")
            {
                //没有分组信息
                string treatinsert = "insert into treatment(TreatmentName,Patient_ID,Progress,State,Belongingdoctor,Treatmentdescribe) values(@ID,@PID,@progress,0,@doc,@Treatmentdescribe)";
                sqlOperation2.AddParameterWithValue("@progress", "0");
                sqlOperation2.AddParameterWithValue("@ID", 1);
                sqlOperation2.AddParameterWithValue("@PID", patient);
                sqlOperation2.AddParameterWithValue("@doc", doctorid);
                sqlOperation2.AddParameterWithValue("@Treatmentdescribe", "疗程1");
                intSuccess2 = sqlOperation2.ExecuteNonQuery(treatinsert);
            }
            else
            {
                //有分组信息
                string treatinsert = "insert into treatment(TreatmentName,Patient_ID,Progress,State,Group_ID,Belongingdoctor,Treatmentdescribe) values(@ID,@PID,@progress,0,@group,@doc,@Treatmentdescribe)";
                sqlOperation2.AddParameterWithValue("@progress", "0");
                sqlOperation2.AddParameterWithValue("@group", Convert.ToInt32(context.Request.Form["group"]));
                sqlOperation2.AddParameterWithValue("@ID", 1);
                sqlOperation2.AddParameterWithValue("@PID", patient);
                sqlOperation2.AddParameterWithValue("@doc", doctorid);
                sqlOperation2.AddParameterWithValue("@Treatmentdescribe", "疗程1");
                intSuccess2 = sqlOperation2.ExecuteNonQuery(treatinsert);

            }

        }
        if (intSuccess2 > 0)
        {
            return "success";
        }
        else
        {
            return "failure";
        }
    }

}
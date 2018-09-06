<%@ WebHandler Language="C#" Class="AddDia" %>

using System;
using System.Web;
using System.Text;
public class AddDia : IHttpHandler
{

    private DataLayer sqlOperation2 = new DataLayer("sqlStr");
    private DataLayer sqlOperation1 = new DataLayer("sqlStr");
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        try
        {
            string json = getfixrecordinfo(context);

            sqlOperation2.Close();
            sqlOperation2.Dispose();
            sqlOperation2 = null;
            sqlOperation1.Close();
            sqlOperation1.Dispose();
            sqlOperation1 = null;
            context.Response.Write(json);
        }
        catch (Exception ex)
        {
            MessageBox.Message(ex.Message);
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    private string getfixrecordinfo(HttpContext context)
    {
        string DocAdvId = context.Request.QueryString["DocAdvId"];
        string DocSource = context.Request.QueryString["Source"];
        string sqlCommand="";
        string sqlCommand1="";
        if (DocSource == "0")
        {
            sqlCommand = "select treatment.ID as treatid from patient,treatment where patient.DrAdvId=@DocAdvId and treatment.Patient_ID=patient.ID order by treatment.ID desc limit 1";   //获取诊疗号对应的医嘱号
            sqlOperation2.AddParameterWithValue("@DocAdvId", DocAdvId);
            sqlCommand1 = "select Belongingdoctor,treatment.Group_ID,diagnosisrecord.*,treataim.Aim as treatmentaim,user.Name as username,Treatmentname,Treatmentdescribe,Nameping from user,diagnosisrecord,treatment,treataim,patient where diagnosisrecord.TreatAim_ID=treataim.ID  and diagnosisrecord.Diagnosis_User_ID=user.ID and treatment.DiagnosisRecord_ID=diagnosisrecord.ID and treatment.ID=@treatID and  patient.DrAdvId=@DocAdvId";
        }
        else {
            sqlCommand = "select treatment.ID as treatid from patient,treatment where patient.DrAdvIdHos=@DocAdvId and treatment.Patient_ID=patient.ID order by treatment.ID desc limit 1";   //获取诊疗号对应的医嘱号
            sqlOperation2.AddParameterWithValue("@DocAdvId", DocAdvId);
            sqlCommand1 = "select Belongingdoctor,treatment.Group_ID,diagnosisrecord.*,treataim.Aim as treatmentaim,user.Name as username,Treatmentname,Treatmentdescribe,Nameping from user,diagnosisrecord,treatment,treataim,patient where diagnosisrecord.TreatAim_ID=treataim.ID  and diagnosisrecord.Diagnosis_User_ID=user.ID and treatment.DiagnosisRecord_ID=diagnosisrecord.ID and treatment.ID=@treatID and  patient.DrAdvIdHos=@DocAdvId";
        }
        int treatid;
        try
        {
            treatid = int.Parse(sqlOperation2.ExecuteScalar(sqlCommand));
        }
        catch
        {
            return "{\"diagnosisInfo\":\"notreatid\"}";
        }

        ;
        //string sqlCommand2 = "select ID from treatment where DrAdvId.ID=@DocAdvId";   //获取诊疗号对应的医嘱号
        //sqlOperation2.AddParameterWithValue("@DocAdvId", DocAdvId);
        //int patientid = int.Parse(sqlOperation2.ExecuteScalar(sqlCommand));
        string iscommon = "select iscommon from treatment where ID=@treatID";  //获取病人精普放
        sqlOperation2.AddParameterWithValue("@treatID", treatid);
        int iscommonnumber = int.Parse(sqlOperation2.ExecuteScalar(iscommon));
        string countCompute = "select count(diagnosisrecord.ID) from treatment,diagnosisrecord where treatment.ID=@treatID and treatment.DiagnosisRecord_ID is not null and diagnosisrecord.ID =treatment.DiagnosisRecord_ID";
        //sqlOperation2.AddParameterWithValue("@patient", patientid);
        int count = int.Parse(sqlOperation2.ExecuteScalar(countCompute));
        int i = 1;
        MySql.Data.MySqlClient.MySqlDataReader readerDocadv = sqlOperation2.ExecuteReader(sqlCommand1);
        StringBuilder backText = new StringBuilder("{\"diagnosisInfo\":[");
        while (readerDocadv.Read())
        {
            string icdcode = "select Group1,Group2,Chinese from icdcode where ID=@icdcodeid";
            sqlOperation1.AddParameterWithValue("@icdcodeid", readerDocadv["DiagnosisResult_ID"].ToString());
            MySql.Data.MySqlClient.MySqlDataReader reader1 = sqlOperation1.ExecuteReader(icdcode);
            string result1 = "";
            string result2 = "";
            if (reader1.Read())
            {
                result1 = reader1["Group1"].ToString() + "," + reader1["Group2"].ToString() + "," + reader1["Chinese"].ToString();
            }
            reader1.Close();
            string icdcode1 = "select Groupfirst,Groupsecond from morphol where ID=@morpholid";
            sqlOperation1.AddParameterWithValue("@morpholid", readerDocadv["PathologyResult"].ToString());
            reader1= sqlOperation1.ExecuteReader(icdcode1);
            if (reader1.Read())
            {
                result2 = reader1["Groupsecond"].ToString() + "," + reader1["Groupfirst"].ToString() ;
            }
            reader1.Close();
            string date = readerDocadv["Time"].ToString();
            DateTime dt1 = Convert.ToDateTime(date);
            string date1 = dt1.ToString("yyyy-MM-dd HH:mm");
            backText.Append("{\"Remarks\":\"" + readerDocadv["Remarks"].ToString() + "\",\"partname\":\"" + readerDocadv["Part_ID"] + "\",\"lightpartname\":\"" + readerDocadv["LightPart_ID"] + "\",\"Treatmentname\":\"" + readerDocadv["Treatmentname"] + "\",\"diagnosisresultName1\":\"" + result1 + "\",\"diagnosisresultName2\":\"" + result2 +
                 "\",\"diagnosisresultID\":\"" + readerDocadv["DiagnosisResult_ID"].ToString() + "\",\"treatmentaim\":\"" + readerDocadv["treatmentaim"].ToString() + "\",\"treatmentaimID\":\"" + readerDocadv["TreatAim_ID"].ToString() + "\",\"PathologyResult\":\"" + readerDocadv["PathologyResult"].ToString() + "\",\"username\":\"" + readerDocadv["username"].ToString() + "\",\"userID\":\"" + readerDocadv["Diagnosis_User_ID"].ToString() + "\",\"Treatmentdescribe\":\"" + readerDocadv["Treatmentdescribe"].ToString() +
                 "\",\"Time\":\"" + date1 + "\",\"iscommonnumber\":\"" + iscommonnumber + "\",\"nameping\":\"" + readerDocadv["Nameping"] + "\",\"group\":\"" + readerDocadv["Group_ID"] + "\",\"doctor\":\"" + readerDocadv["Belongingdoctor"] + "\"}");
            if (i < count)
            {
                backText.Append(",");
            }
            i++;
        }
        backText.Append("]}");
        readerDocadv.Close();
        return backText.ToString();
    }
}
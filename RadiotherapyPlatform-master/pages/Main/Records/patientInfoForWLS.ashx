﻿<%@ WebHandler Language="C#" Class="patientInfoForWLS" %>

using System;
using System.Web;
using System.Text;
public class patientInfoForWLS : IHttpHandler
{
    private DataLayer sqlOperation = new DataLayer("sqlStr");
    private DataLayer sqlOperation2 = new DataLayer("sqlStr");
    private DataLayer sqlOperation1 = new DataLayer("sqlStr");
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        try
        {
            string json = getfixrecordinfo(context);
            sqlOperation.Close();
            sqlOperation.Dispose();
            sqlOperation = null;
            sqlOperation1.Close();
            sqlOperation1.Dispose();
            sqlOperation1 = null;
            sqlOperation2.Close();
            sqlOperation2.Dispose();
            sqlOperation2 = null;
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
        string sqlCommand = "SELECT count(*) from treatment where Progress like '%8%'and Progress not in(select Progress from treatment where Progress like '%13%') and State=0";
        int count = int.Parse(sqlOperation.ExecuteScalar(sqlCommand));
        if (count == 0)
        {
            return "{\"PatientInfo\":false}";
        }

        int i = 1;
        string sqlCommand2 = "select treatment.State as treatstate,treatment.ID as treatid,patient.*,user.Name as doctor,Progress,iscommon,treatment.Treatmentdescribe,DiagnosisRecord_ID,Design_ID from treatment,patient,user where patient.ID=treatment.Patient_ID and treatment.Belongingdoctor=user.ID and Progress like '%8%'and Progress not in(select Progress from treatment where Progress like '%13%') and treatment.State=0 order by patient.ID desc";
        MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation2.ExecuteReader(sqlCommand2);
        StringBuilder backText = new StringBuilder("{\"PatientInfo\":[");

        while (reader.Read())
        {
            string result = "";
            if (reader["DiagnosisRecord_ID"] is DBNull)
            {
                result = "";
            }
            else
            {
                string sqlCommand3 = "select Chinese from diagnosisrecord,icdcode where diagnosisrecord.ID=@ID and diagnosisrecord.DiagnosisResult_ID =icdcode.ID";
                sqlOperation1.AddParameterWithValue("@ID", reader["DiagnosisRecord_ID"].ToString());
                result = sqlOperation1.ExecuteScalar(sqlCommand3);
            }
            string confirmTime = "";
            if (reader["Design_ID"] is DBNull)
            {
                confirmTime = DateTime.Now.ToString();
            }
            else
            {
                string sqlCommand3 = "select ConfirmTime from design where design.ID=@designID";
                sqlOperation1.AddParameterWithValue("@designID", reader["Design_ID"].ToString());
                confirmTime = sqlOperation1.ExecuteScalar(sqlCommand3);
            }
            backText.Append("{\"Name\":\"" + reader["Name"].ToString() + "\",\"diagnosisresult\":\"" + result + "\",\"Progress\":\"" + reader["Progress"].ToString() + "\",\"state\":\"" + reader["treatstate"].ToString() +
                    "\",\"Radiotherapy_ID\":\"" + reader["Radiotherapy_ID"].ToString() + "\",\"treat\":\"" + reader["Treatmentdescribe"].ToString()
                    + "\",\"doctor\":\"" + reader["doctor"].ToString() + "\",\"treatID\":\"" + reader["treatid"].ToString() + "\",\"confirmTime\":\"" + confirmTime+ "\",\"iscommon\":\"" + reader["iscommon"].ToString() + "\"}");

            if (i < count)
            {
                backText.Append(",");
            }
            i++;
        }
        reader.Close();
        // backText.Remove(backText.Length - 1, 1);                
        backText.Append("]}");
        return backText.ToString();
    }
}

    
    
    
    
    
    
    
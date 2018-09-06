﻿<%@ WebHandler Language="C#" Class="GetfinishedimportCT" %>

using System;
using System.Web;
using System.Text;
public class GetfinishedimportCT : IHttpHandler {

    private DataLayer sqlOperation = new DataLayer("sqlStr");
    private DataLayer sqlOperation1 = new DataLayer("sqlStr");
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        try
        {
            string json = patientimportCTInformation(context);
            sqlOperation.Close();
            sqlOperation.Dispose();
            sqlOperation = null;
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
    public string patientimportCTInformation(HttpContext context)
    {
        int treatid =Convert.ToInt32(context.Request["treatmentID"]);        
        string sqlCommand = "select Patient_ID from treatment where treatment.ID=@treatID";
        sqlOperation.AddParameterWithValue("@treatID", treatid);
        int patientid = int.Parse(sqlOperation.ExecuteScalar(sqlCommand));
        string sqlcommand2 = "select count(treatment.ID) from treatment,location where treatment.Patient_ID=@patient and treatment.Location_ID=location.ID and location.CT_ID is not null";
        sqlOperation.AddParameterWithValue("@patient", patientid);
        int count = Convert.ToInt32(sqlOperation.ExecuteScalar(sqlcommand2));
        int i = 1;
        string sqlCommand3 = "select ct.ID as ctid,Treatmentname,ct.Operate_User_ID as ctop,Treatmentdescribe,densityconversion.Name as dename,DensityConversion_ID,SequenceNaming,ct.Thickness as Thickness,ct.Number as Number,ct.ReferenceScale as ReferenceScale,ct.MultimodalImage as MultimodalImage,ct.OperateTime as  OperateTime,ct.Remarks as remarks from densityconversion,location,ct,treatment where densityconversion.ID=ct.DensityConversion_ID and treatment.Patient_ID=@patient and treatment.Location_ID=location.ID and location.CT_ID=ct.ID";
        MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(sqlCommand3);
        StringBuilder backText = new StringBuilder("{\"info\":[");
        while (reader.Read())
        {
            string date2 = reader["OperateTime"].ToString();
            DateTime dt2 = Convert.ToDateTime(date2);
            string date3 = dt2.ToString("yyyy-MM-dd HH:mm");
            string operate = null;
            if (reader["ctop"] is DBNull)
            {
                operate = "";
            }
            else
            {
                string sqlCommand4 = "select user.Name from ct,user where ct.ID=@ctid and ct.Operate_User_ID =user.ID";
                sqlOperation1.AddParameterWithValue("@ctid", Convert.ToInt32(reader["ctid"].ToString()));              
                operate = sqlOperation1.ExecuteScalar(sqlCommand4);

            }
            backText.Append("{\"DensityConversion_ID\":\"" + reader["DensityConversion_ID"].ToString() + "\",\"SequenceNaming\":\"" + reader["SequenceNaming"] + "\",\"DensityConversionName\":\"" + reader["dename"] + "\",\"Treatmentname\":\"" + reader["Treatmentname"] +
                 "\",\"Thickness\":\"" + reader["Thickness"].ToString() + "\",\"Number\":\"" + reader["Number"].ToString() + "\",\"ReferenceScale\":\"" + reader["ReferenceScale"].ToString() + "\",\"CTID\":\"" + reader["ctid"].ToString() + "\",\"Treatmentdescribe\":\"" + reader["Treatmentdescribe"] +
                 "\",\"MultimodalImage\":\"" + reader["MultimodalImage"].ToString() + "\",\"Remarks\":\"" + reader["remarks"].ToString() + "\",\"OperateTime\":\"" + date3 + "\",\"username\":\"" + operate + "\",\"userID\":\"" + reader["ctop"].ToString() + "\"}");
            if (i < count)
            {
                backText.Append(",");
            }
            i++;
        }
        backText.Append("]}");
        reader.Close();
        return backText.ToString();

    }

}
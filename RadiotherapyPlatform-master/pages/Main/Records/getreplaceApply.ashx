﻿<%@ WebHandler Language="C#" Class="getreplaceApply" %>

using System;
using System.Web;
using System.Text;


public class getreplaceApply : IHttpHandler {
    private DataLayer sqlOperation = new DataLayer("sqlStr");
    private DataLayer sqlOperation1 = new DataLayer("sqlStr");
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        try
        {
            string json = getreplaceapplydinfo(context);
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
    private string getreplaceapplydinfo(HttpContext context)
    {
        String treat = context.Request.QueryString["treatmentID"];
        int treatID = Convert.ToInt32(treat);
        string desgin = "select PDF1 from treatment,review where treatment.Review_ID=review.ID and treatment.ID=@treatid";
        sqlOperation.AddParameterWithValue("@treatid", treatID); 
        string pdf = sqlOperation.ExecuteScalar(desgin);
        string desgin2 = "select CTPictures from treatment,location where treatment.Location_ID=location.ID and treatment.ID=@treatid";
        string picture = sqlOperation.ExecuteScalar(desgin2);
        string sqlCommand2 = "select ReferenceCenter,TreatmentCenter,Movement from review,treatment where treatment.Review_ID=review.ID and treatment.ID=@treatid";
        sqlOperation1.AddParameterWithValue("@treatid", treatID);
        MySql.Data.MySqlClient.MySqlDataReader reader1 = sqlOperation1.ExecuteReader(sqlCommand2);
        string data = "";
        if (reader1.Read())
        {
            data = data + reader1["ReferenceCenter"].ToString() + "," + reader1["TreatmentCenter"].ToString() + "," + reader1["Movement"].ToString();
        }
        reader1.Close();
        string sqlCommand = "select replacementrequirements.Requirements as replacerequire,replacementrequirements.ID as requireID,user.Name as doctor,replacement.ApplicationTime as ApplicationTime from treatment,user,replacement,replacementrequirements where treatment.ID=@treatid and replacement.Application_User_ID=user.ID and treatment.Replacement_ID=replacement.ID and replacement.ReplacementRequirements_ID=replacementrequirements.ID ";
        sqlOperation.AddParameterWithValue("@treatid", treatID);
        MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(sqlCommand);

        StringBuilder backText = new StringBuilder("{\"replace\":[");
        while (reader.Read())
        {
            backText.Append("{\"replacerequire\":\"" + reader["replacerequire"].ToString() + "\",\"picture\":\"" + picture + "\",\"requireID\":\"" + reader["requireID"].ToString() + "\",\"pdf\":\"" + pdf.ToString() + "\",\"data\":\"" + data + "\",\"ApplicationUser\":\"" + reader["doctor"].ToString() + "\",\"ApplicationTime\":\"" + reader["ApplicationTime"].ToString()
                     + "\"}");
        }
        reader.Close();
        backText.Append("]}");
        return backText.ToString();
    }
   
          

}
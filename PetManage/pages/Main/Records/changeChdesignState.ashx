﻿<%@ WebHandler Language="C#" Class="changeChdesignState" %>

using System;
using System.Web;
using System.Collections;

public class changeChdesignState : IHttpHandler {
    DataLayer sqlOperation = new DataLayer("sqlStr");
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        changestate(context);
        sqlOperation.Close();
        sqlOperation.Dispose();
        sqlOperation = null;
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    private void changestate(HttpContext context)
    {
        string type = context.Request["type"];
        string state = context.Request["state"];
        string chid = context.Request["childdesignid"];
        string user = context.Request["userid"];
        if (type == "0")
        {
            string command = "update childdesign set State=0 where ID=@chid";
            sqlOperation.AddParameterWithValue("@chid", chid);
            sqlOperation.ExecuteNonQuery(command);

            string selectcommand = "select treatmentrecord.Appointment_ID as appointid,treatmentrecord.ID as treatmentrecordid from treatmentrecord,appointment_accelerate where treatmentrecord.Appointment_ID=appointment_accelerate.ID and ChildDesign_ID=@chid and Treat_User_ID is NULL and Date>=@nowdate";
            sqlOperation.AddParameterWithValue("@chid", chid);
            sqlOperation.AddParameterWithValue("@nowdate", DateTime.Now.Date.ToString());
            sqlOperation.AddParameterWithValue("@nowbegin", DateTime.Now.Hour * 60 + DateTime.Now.Minute);
            MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(selectcommand);
            ArrayList arrayforapp = new ArrayList();
            ArrayList arrayforapp2 = new ArrayList();
            ArrayList treatmentarray = new ArrayList();
            while (reader.Read())
            {
                arrayforapp.Add(reader["appointid"].ToString());
                treatmentarray.Add(reader["treatmentrecordid"].ToString());
            }
            reader.Close();
            for (int i = 0; i < arrayforapp.Count; i++)
            {
                string isexists = "select count(*) from treatmentrecord where ChildDesign_ID<>@chid and Appointment_ID=@appoint";
                sqlOperation.AddParameterWithValue("@chid", chid);
                sqlOperation.AddParameterWithValue("@appoint", arrayforapp[i]);
                int count = int.Parse(sqlOperation.ExecuteScalar(isexists));
                if (count == 0)
                {
                    arrayforapp2.Add(arrayforapp[i]);
                } 
            }
            for(int i=0;i< arrayforapp2.Count;i++)
            {
                string deletecommand = "delete from appointment_accelerate where ID=@appoint";
                sqlOperation.AddParameterWithValue("@appoint", arrayforapp2[i]);
                sqlOperation.ExecuteNonQuery(deletecommand);
            }
            for (int i = 0; i < treatmentarray.Count; i++)
            {
                string deletecommand2 = "delete from treatmentrecord where ID=@tretmentid";
                sqlOperation.AddParameterWithValue("@tretmentid", treatmentarray[i]);
                sqlOperation.ExecuteNonQuery(deletecommand2);
            }
            string childnamecommand = "SELECT DesignName from childdesign where ID=@chid";
            sqlOperation.AddParameterWithValue("@chid", chid);
            string childname = sqlOperation.ExecuteScalar(childnamecommand);
            string treatnamecommand = "SELECT treatment.Treatmentdescribe as treatname from childdesign,treatment where childdesign.Treatment_ID=treatment.ID and childdesign.ID=@chid";
            string tretmentname = sqlOperation.ExecuteScalar(treatnamecommand);
            string patientnamecommand = "SELECT patient.Name as patientname from patient,treatment,childdesign where treatment.Patient_ID=patient.ID and childdesign.Treatment_ID=treatment.ID and childdesign.ID=@chid";
            string patientname = sqlOperation.ExecuteScalar(patientnamecommand);
            string logininfo = "暂停病人" + patientname + "的计划" + tretmentname + "," + childname;
            string insertcommand = "INSERT into loginfo(userID,logInformation,Date) VALUES(@userid,@login,@date)";
            sqlOperation.AddParameterWithValue("@userid", user);
            sqlOperation.AddParameterWithValue("@login", logininfo);
            sqlOperation.AddParameterWithValue("@date", DateTime.Now);
            sqlOperation.ExecuteNonQuery(insertcommand);
        }
        if (type == "1")
        {
            string command = "update childdesign set State=@state where ID=@chid";
            sqlOperation.AddParameterWithValue("@chid", chid);
            if (state == "true")
            {
                sqlOperation.AddParameterWithValue("@state", 3);

            }
            else
            {
                sqlOperation.AddParameterWithValue("@state", 2);
            }
            sqlOperation.ExecuteNonQuery(command);
            string childnamecommand = "SELECT DesignName from childdesign where ID=@chid";
            sqlOperation.AddParameterWithValue("@chid", chid);
            string childname = sqlOperation.ExecuteScalar(childnamecommand);
            string treatnamecommand = "SELECT treatment.Treatmentdescribe as treatname from childdesign,treatment where childdesign.Treatment_ID=treatment.ID and childdesign.ID=@chid";
            string tretmentname = sqlOperation.ExecuteScalar(treatnamecommand);
            string patientnamecommand = "SELECT patient.Name as patientname from patient,treatment,childdesign where treatment.Patient_ID=patient.ID and childdesign.Treatment_ID=treatment.ID and childdesign.ID=@chid";
            string patientname = sqlOperation.ExecuteScalar(patientnamecommand);
            string logininfo = "恢复病人" + patientname + "的计划" + tretmentname + "," + childname;
            string insertcommand = "INSERT into loginfo(userID,logInformation,Date) VALUES(@userid,@login,@date)";
            sqlOperation.AddParameterWithValue("@userid", user);
            sqlOperation.AddParameterWithValue("@login", logininfo);
            sqlOperation.AddParameterWithValue("@date", DateTime.Now);
            sqlOperation.ExecuteNonQuery(insertcommand);
            
        }
    }

}
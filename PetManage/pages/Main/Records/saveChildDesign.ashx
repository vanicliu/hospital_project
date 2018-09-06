﻿<%@ WebHandler Language="C#" Class="saveChildDesign" %>

using System;
using System.Web;
using System.Collections;

public class saveChildDesign : IHttpHandler {
    DataLayer sqlOperation = new DataLayer("sqlStr");
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string result = savechidesign(context);
        sqlOperation.Close();
        sqlOperation.Dispose();
        sqlOperation = null;
        context.Response.Write(result);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    private string savechidesign(HttpContext context)
    {
        string chid = context.Request["chid"];
        string totalnumber = context.Request["totalnumber"];
        string tianchongnumber = context.Request["tianchongnumber"];
        string username = context.Request["username"];
        string splitway = context.Request["splitway"];
        string user = context.Request["user"];
        string remarks=context.Request["remarks"];
        string checktreatedtotalnumber = "select count(*) from treatmentrecord where Treat_User_ID is not null  and ChildDesign_ID=@chid";
        sqlOperation.AddParameterWithValue("@chid", chid);
        int treatedtimes=int.Parse(sqlOperation.ExecuteScalar(checktreatedtotalnumber));
        int totalnum = int.Parse(totalnumber) - int.Parse(tianchongnumber);
        if (treatedtimes > totalnum)
        {
            return "不能缩减次数";
        }
        string totalnumbercommand = "select Totalnumber from childdesign where ID=@chid";
        sqlOperation.AddParameterWithValue("@chid", chid);
        string total = sqlOperation.ExecuteScalar(totalnumbercommand);
        string fillnumbercommand = "select fillNumber from childdesign where ID=@chid";
        sqlOperation.AddParameterWithValue("@chid", chid);
        string fillnum = sqlOperation.ExecuteScalar(fillnumbercommand);
        
        int newtotal = 0;
        if (total != "")
        {
            newtotal = Convert.ToInt16(total);
            if (int.Parse(totalnumber) != int.Parse(total) + int.Parse(fillnum))
            {
                string childnamecommand = "SELECT DesignName from childdesign where ID=@chid";
                sqlOperation.AddParameterWithValue("@chid", chid);
                string childname = sqlOperation.ExecuteScalar(childnamecommand);
                string treatnamecommand = "SELECT treatment.Treatmentdescribe as treatname from childdesign,treatment where childdesign.Treatment_ID=treatment.ID and childdesign.ID=@chid";
                string tretmentname = sqlOperation.ExecuteScalar(treatnamecommand);
                string patientnamecommand = "SELECT patient.Name as patientname from patient,treatment,childdesign where treatment.Patient_ID=patient.ID and childdesign.Treatment_ID=treatment.ID and childdesign.ID=@chid";
                string patientname = sqlOperation.ExecuteScalar(patientnamecommand);
                string logininfo = "修改病人" + patientname + "的计划，" + tretmentname + "," + childname + "，总次数从" + (int.Parse(total) + int.Parse(fillnum)) + "改为" + int.Parse(totalnumber);
                string insertcommand = "INSERT into loginfo(userID,logInformation,Date) VALUES(@userid,@login,@date)";
                sqlOperation.AddParameterWithValue("@userid", user);
                sqlOperation.AddParameterWithValue("@login", logininfo);
                sqlOperation.AddParameterWithValue("@date", DateTime.Now);
                sqlOperation.ExecuteNonQuery(insertcommand);

            }
        }
        else
        {
            string command1 = "select Singledose,Totaldose from fieldinfomation where ChildDesign_ID=@chid";
            sqlOperation.AddParameterWithValue("@chid", chid);
            MySql.Data.MySqlClient.MySqlDataReader reader2 = sqlOperation.ExecuteReader(command1);
            int inputtotal=0;
            if (reader2.Read())
            {
                int totaldose = int.Parse(reader2["Totaldose"].ToString());
                int singledose = int.Parse(reader2["Singledose"].ToString());
                inputtotal = totaldose / singledose;
            }
            reader2.Close();
            if (inputtotal != int.Parse(totalnumber))
            {
                string childnamecommand = "SELECT DesignName from childdesign where ID=@chid";
                sqlOperation.AddParameterWithValue("@chid", chid);
                string childname = sqlOperation.ExecuteScalar(childnamecommand);
                string treatnamecommand = "SELECT treatment.Treatmentdescribe as treatname from childdesign,treatment where childdesign.Treatment_ID=treatment.ID and childdesign.ID=@chid";
                string tretmentname = sqlOperation.ExecuteScalar(treatnamecommand);
                string patientnamecommand = "SELECT patient.Name as patientname from patient,treatment,childdesign where treatment.Patient_ID=patient.ID and childdesign.Treatment_ID=treatment.ID and childdesign.ID=@chid";
                string patientname = sqlOperation.ExecuteScalar(patientnamecommand);
                string logininfo = "病人" + patientname + "的计划，" + tretmentname + "," + childname + "，总次数制定与计划导入不符";
                string insertcommand = "INSERT into loginfo(userID,logInformation,Date) VALUES(@userid,@login,@date)";
                sqlOperation.AddParameterWithValue("@userid", user);
                sqlOperation.AddParameterWithValue("@login", logininfo);
                sqlOperation.AddParameterWithValue("@date", DateTime.Now);
                sqlOperation.ExecuteNonQuery(insertcommand);

            }
            //else
            //{
            //    string childnamecommand = "SELECT DesignName from childdesign where ID=@chid";
            //    sqlOperation.AddParameterWithValue("@chid", chid);
            //    string childname = sqlOperation.ExecuteScalar(childnamecommand);
            //    string treatnamecommand = "SELECT treatment.Treatmentdescribe as treatname from childdesign,treatment where childdesign.Treatment_ID=treatment.ID and childdesign.ID=@chid";
            //    string tretmentname = sqlOperation.ExecuteScalar(treatnamecommand);
            //    string patientnamecommand = "SELECT patient.Name as patientname from patient,treatment,childdesign where treatment.Patient_ID=patient.ID and childdesign.Treatment_ID=treatment.ID and childdesign.ID=@chid";
            //    string patientname = sqlOperation.ExecuteScalar(patientnamecommand);
            //    string logininfo = "病人" + patientname + "的计划，" + tretmentname + "," + childname + "，总次数制定为" + int.Parse(totalnumber);
            //    string insertcommand = "INSERT into loginfo(userID,logInformation,Date) VALUES(@userid,@login,@date)";
            //    sqlOperation.AddParameterWithValue("@userid", user);
            //    sqlOperation.AddParameterWithValue("@login", logininfo);
            //    sqlOperation.AddParameterWithValue("@date", DateTime.Now);
            //    sqlOperation.ExecuteNonQuery(insertcommand);
            //}
            
        }
        if (newtotal != totalnum)
        {
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
            for (int i = 0; i < arrayforapp2.Count; i++)
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

          
        }

        
        string select = "select ChangeLog from childdesign where ID=@chid";
        sqlOperation.AddParameterWithValue("@chid", chid);
        string log = sqlOperation.ExecuteScalar(select);
        string updatecommand = "update childdesign set State=3,Changelog=@log,Totalnumber=@totalnumber,SpecialEnjoin=@special,Splitway_ID=@splitway,fillNumber=@fillnum where ID=@chid";
        sqlOperation.AddParameterWithValue("@totalnumber", totalnum);
        sqlOperation.AddParameterWithValue("@fillnum", tianchongnumber);
        sqlOperation.AddParameterWithValue("@special", remarks);
        sqlOperation.AddParameterWithValue("@splitway", splitway);
        sqlOperation.AddParameterWithValue("@log", log + ";" + username + "," + DateTime.Now + "," + totalnumber);
        int num = sqlOperation.ExecuteNonQuery(updatecommand);
        if (num == 0)
        {
            return "failure";
        }
        else
        {
            return "success";
        }
        
    }
    
    
    
    
    }
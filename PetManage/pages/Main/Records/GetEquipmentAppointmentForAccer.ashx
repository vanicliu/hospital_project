﻿<%@ WebHandler Language="C#" Class="GetEquipmentAppointmentForAccer" %>

using System;
using System.Web;
using System.Text;

public class GetEquipmentAppointmentForAccer : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string backString = getInformation(context);
        context.Response.Write(backString);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

    private string getInformation(HttpContext context)
    {
        DataLayer sqlOperation = new DataLayer("sqlStr");
        DataLayer sqlOperation2 = new DataLayer("sqlStr");
        string dateorigin = context.Request["date"];
        string equipmentID = context.Request["equipmentID"];
        string alltotal = context.Request["times"];
        int alltotalnumber = int.Parse(alltotal);
        DateTime datefirst = Convert.ToDateTime(dateorigin);
        string date = ""; 
       StringBuilder backString = new StringBuilder("{\"equipmentinfo\":[");
       StringBuilder backString2 = new StringBuilder("\"timeinfo\":[");
        for (int k = 0; k < alltotalnumber; k++)
        {
            date = datefirst.AddDays(k).ToShortDateString();
            string sqlCommand = "SELECT COUNT(ID) FROM Appointment WHERE Date=@date AND Equipment_ID=@id";
            sqlOperation.AddParameterWithValue("@date", date);
            sqlOperation.AddParameterWithValue("@id", equipmentID);
            int count = int.Parse(sqlOperation.ExecuteScalar(sqlCommand));
            MySql.Data.MySqlClient.MySqlDataReader reader = null;
            if (count == 0)//没有先生成
            {
                sqlCommand = "SELECT * FROM equipment WHERE ID=@id";
                reader = sqlOperation.ExecuteReader(sqlCommand);
                string Oncetime, Ambeg, AmEnd, PMBeg, PMEnd, treatmentItem;
                if (reader.Read())
                {
                    if (reader["State"].ToString() == "1")
                    {
                        Oncetime = reader["Timelength"].ToString();
                        Ambeg = reader["BeginTimeAM"].ToString();
                        AmEnd = reader["EndTimeAM"].ToString();
                        PMBeg = reader["BegTimePM"].ToString();
                        PMEnd = reader["EndTimeTPM"].ToString();
                        treatmentItem = reader["TreatmentItem"].ToString();
                        CreateAppointment(equipmentID, Oncetime, Ambeg, AmEnd, PMBeg, PMEnd, treatmentItem, date);
                    }
                    else
                    {
                        return "false";//生成不了
                    }
                }
                reader.Close();
            }
            string commandfirstID = "select MIN(ID) from appointment where date=@date and Equipment_ID=@id";
            string firstID = sqlOperation.ExecuteScalar(commandfirstID);
            string commandbusygroup = "select count(ID) from appointment where date=@date and Equipment_ID=@id and State=1";
            int countbusy = int.Parse(sqlOperation.ExecuteScalar(commandbusygroup));
            int m = 0;
            string commandgroup = "select ID from appointment where date=@date and Equipment_ID=@id and State=1";
            reader = sqlOperation.ExecuteReader(commandgroup);
            StringBuilder backString3 = new StringBuilder("[");
            while(reader.Read())
            {
                backString3.Append(reader["ID"].ToString());
                if(m<countbusy-1)
                {
                    backString3.Append(",");
                }
                
            }
            backString3.Append("]");
            backString.Append("{\"date\":\"" + date + "\",\"firstid\":\"" + firstID + "\",\"busygroup\":" + backString3 + "}");
            reader.Close();
            if (k < alltotalnumber-1)
            {
                backString.Append(",");
            }
        }
        string commandcount = "SELECT count(ID) From Appointment WHERE Date=@date AND Equipment_ID=@id";
        sqlOperation2.AddParameterWithValue("@date", dateorigin);
        sqlOperation2.AddParameterWithValue("@id", equipmentID);
        int times = int.Parse(sqlOperation2.ExecuteScalar(commandcount));
        int currentTimes = 1;
        string commandtime = "SELECT * FROM Appointment WHERE Date=@date AND Equipment_ID=@id";
        MySql.Data.MySqlClient.MySqlDataReader readertime = sqlOperation2.ExecuteReader(commandtime);
        while (readertime.Read())
        {
            backString2.Append("{\"Begin\":\"" + readertime["Begin"].ToString() + "\",\"End\":\"" + readertime["End"].ToString() + "\"}");
            if (currentTimes < times)
            {
                backString2.Append(",");
                currentTimes++;
            }
            
        }

           backString2.Append("]");
            backString.Append("],");
            backString.Append(backString2);
            backString.Append("}");
            sqlOperation.Close();
            sqlOperation.Dispose();
            return backString.ToString();
       
    }

    private void CreateAppointment(string id, string OnceTime, string AMbeg, string AMEnd, string PMBeg, string PMEnd, string treatmentItem, string date)
    {
        DataLayer sqlOperation = new DataLayer("sqlStr");
        sqlOperation.clearParameter();

        int intAMBeg = int.Parse(AMbeg);
        int intAMEnd = int.Parse(AMEnd);
        int intPMBeg = int.Parse(PMBeg);
        int intPMEnd = int.Parse(PMEnd);

        int AMTime = intAMEnd - intAMBeg;
        int PMTime = intPMEnd - intPMBeg;

        int AMFrequency = AMTime / int.Parse(OnceTime);
        int PMFrequency = PMTime / int.Parse(OnceTime);

        string sqlCommand = "INSERT INTO appointment(Task,Date,Equipment_ID,Begin,End,State) VALUES(@task,@date,@id,@begin,@end,0)";
        sqlOperation.AddParameterWithValue("@task", treatmentItem);
        sqlOperation.AddParameterWithValue("@id", id);

        sqlOperation.AddParameterWithValue("@date", date);
        for (int j = 0; j < AMFrequency; j++)
        {
            int begin = intAMBeg + (j * int.Parse(OnceTime));
            int end = begin + int.Parse(OnceTime);
            sqlOperation.AddParameterWithValue("@begin", begin);
            sqlOperation.AddParameterWithValue("@end", end);
            sqlOperation.ExecuteNonQuery(sqlCommand);
        }

        for (int k = 0; k < PMFrequency; k++)
        {
            int Pbegin = intPMBeg + (k * int.Parse(OnceTime));
            int PEnd = Pbegin + int.Parse(OnceTime);
            sqlOperation.AddParameterWithValue("@begin", Pbegin);
            sqlOperation.AddParameterWithValue("@end", PEnd);
            sqlOperation.ExecuteNonQuery(sqlCommand);
        }
        sqlOperation.Close();
        sqlOperation.Dispose();
    }

}
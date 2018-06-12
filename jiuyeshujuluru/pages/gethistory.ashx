<%@ WebHandler Language="C#" Class="gethistory" %>
using System;
using System.Web;
using System.Text;


public class gethistory : IHttpHandler {
    private DataLayer sqlOperation = new DataLayer("sqljiuye");
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string backString = getprintItem();
        sqlOperation.Close();
        sqlOperation.Dispose();
        context.Response.Write(backString);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }
    public String getprintItem() {
        string countcommand = "select count(*) from history";
        int count = int.Parse(sqlOperation.ExecuteScalar(countcommand));

        string historycommand = "UPDATE history SET Remains = REPLACE(REPLACE(Remains, CHAR(10), ''), CHAR(13), '');" +
            " select ID,Enterprise,buildTime,usedName,nowName,changeTime,usedName2,nowName2,changeTime2,usedName3,nowName3,changeTime3,Remains,Product,releaseTime from history order by releaseTime desc";
        MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(historycommand);
        StringBuilder backtext = new StringBuilder("{\"Item\":[");
        int temp = 0;
        while (reader.Read()) {
            backtext.Append("{ \"ID\":\"" + reader["ID"].ToString() + "\"," +
               "\"Enterprise\":\"" + reader["Enterprise"].ToString() + "\", " +
               "\"buildTime\":\"" + reader["buildTime"].ToString() + "\"," +
               "\"usedName\":\"" + reader["usedName"].ToString() + "\"," +
               "\"nowName\":\"" + reader["nowName"].ToString() + "\"," +
               "\"changeTime\":\"" + reader["changeTime"].ToString() + "\"," +
               "\"usedName2\":\"" + reader["usedName2"].ToString() + "\"," +
               "\"nowName2\":\"" + reader["nowName2"].ToString() + "\"," +
               "\"changeTime2\":\"" + reader["changeTime2"].ToString() + "\"," +
               "\"usedName3\":\"" + reader["usedName3"].ToString() + "\"," +
               "\"nowName3\":\"" + reader["nowName3"].ToString() + "\"," +
               "\"changeTime3\":\"" + reader["changeTime3"].ToString() + "\"," +
               "\"Remains\":\"" + reader["Remains"].ToString() + "\"," +
               "\"Product\":\"" + reader["Product"].ToString() + "\"," +
               "\"releaseTime\":\"" + reader["releaseTime"].ToString()+ "\"}");
            if (temp < count-1)
            {
                backtext.Append(",");
            }
            temp = temp + 1;
        }
        backtext.Append("]}");
        return backtext.ToString();
    }
}
<%@ WebHandler Language="C#" Class="getvaluation" %>

using System;
using System.Web;
using System.Text;

public class getvaluation : IHttpHandler {

    DataLayer sqlOperation = new DataLayer("sqljiuye");
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string backString = getprinItem();
        sqlOperation.Close();
        sqlOperation.Dispose();
        context.Response.Write(backString);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    private string getprinItem()
    {
        string countcommand = "select count(*) from socialvaluation";
        int count = int.Parse(sqlOperation.ExecuteScalar(countcommand));
		string switchCommand = "UPDATE socialvaluation SET delphiMethod = REPLACE(delphiMethod,CHAR(34), '“');UPDATE socialvaluation SET consumerSurvey = REPLACE(consumerSurvey,CHAR(34), '“')";
        sqlOperation.ExecuteNonQuery(switchCommand);
        string valuationcommand = "UPDATE socialvaluation SET delphiMethod = REPLACE(REPLACE(delphiMethod, CHAR(10), ''), CHAR(13), '');UPDATE socialvaluation SET consumerSurvey = REPLACE(REPLACE(consumerSurvey, CHAR(10), ''), CHAR(13), '');select Id,Enterprise,DelphiMethod,ConsumerSurvey,Releasetime from socialvaluation order by Releasetime desc";
        MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(valuationcommand);
        StringBuilder backText = new StringBuilder("{\"Item\":[");
        int temp = 0;
        while (reader.Read())
        {
            backText.Append("{ \"Id\":\"" + reader["Id"].ToString() + "\"," +
                "\"Enterprise\":\"" + reader["Enterprise"].ToString() + "\"," +
                "\"DelphiMethod\":\"" + reader["DelphiMethod"].ToString() + "\"," + "\"ConsumerSurvey\":\"" + reader["ConsumerSurvey"].ToString() + "\"," + "\"Releasetime\":\"" + reader["Releasetime"].ToString() + "\"}");
                
            if (temp < count - 1)
            {
                backText.Append(",");
            }
            temp = temp + 1;

        }

        backText.Append("]}");
        return backText.ToString();
    }
}
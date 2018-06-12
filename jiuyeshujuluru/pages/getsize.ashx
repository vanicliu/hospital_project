<%@ WebHandler Language="C#" Class="getsize" %>

using System;
using System.Web;
using System.Text;

public class getsize : IHttpHandler {
    DataLayer sqlOperation = new DataLayer("sqljiuye");
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string backString = getprinItem();
        sqlOperation.Close();
        sqlOperation.Dispose();
        context.Response.Write(backString);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }
    private string getprinItem() {
        string countcommand = "select count(*) from size";
        int count = int.Parse(sqlOperation.ExecuteScalar(countcommand));
        string sizecommand = "select ID,Enterprise,Totalassets,Area,Productoutput,Employeesnumber,Year,Releasetime from size order by Releasetime desc";
        MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(sizecommand);
        StringBuilder backText = new StringBuilder("{\"Item\":[");
        int temp = 0;
        while(reader.Read())
        {
            backText.Append("{ \"ID\":\"" + reader["ID"].ToString() +"\","+
                "\"Enterprise\":\"" + reader["Enterprise"].ToString() + "\"," +
                "\"Totalassets\":\"" + reader["Totalassets"].ToString() + "\",\"Area\":\"" +  reader["Area"].ToString() + "\"," +
                "\"Productoutput\":\"" + reader["Productoutput"].ToString() + "\"," +
                "\"Employeesnumber\":\"" + reader["Employeesnumber"].ToString() + "\",\"Year\":\"" + reader["Year"].ToString() + "\"," +
                "\"Releasetime\":\"" + reader["Releasetime"].ToString()+ "\"}");

            if (temp < count-1)
            {
                backText.Append(",");
            }
            temp = temp + 1;

        }

        backText.Append("]}");
        return backText.ToString();
    }
}
<%@ WebHandler Language="C#" Class="getassets" %>

using System;
using System.Web;
using System.Text;

public class getassets : IHttpHandler
{
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
        string countcommand = "select count(*) from intangibleassets";
        int count = int.Parse(sqlOperation.ExecuteScalar(countcommand));
		string switchCommand = "UPDATE intangibleassets SET internationalAward = REPLACE(internationalAward,CHAR(34), '“');UPDATE intangibleassets SET nationAward = REPLACE(nationAward,CHAR(34), '“');UPDATE intangibleassets SET provinceAward = REPLACE(provinceAward,CHAR(34), '“')";
        sqlOperation.ExecuteNonQuery(switchCommand);
        string assetscommand = "UPDATE intangibleassets SET internationalAward = REPLACE(REPLACE(internationalAward, CHAR(10), ''), CHAR(13), '');UPDATE intangibleassets SET nationAward = REPLACE(REPLACE(nationAward, CHAR(10), ''), CHAR(13), '');UPDATE intangibleassets SET provinceAward = REPLACE(REPLACE(provinceAward, CHAR(10), ''), CHAR(13), '');select Id,Enterprise,PatentValue,BrandValue,InternationalAward,NationAward,ProvinceAward,Releasetime from intangibleassets order by Releasetime desc";
        MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(assetscommand);
        StringBuilder backText = new StringBuilder("{\"Item\":[");
        int temp = 0;
        while (reader.Read())
        {
            backText.Append("{ \"Id\":\"" + reader["Id"].ToString() + "\"," +          
                "\"Enterprise\":\"" + reader["Enterprise"].ToString() + "\"," +
                "\"PatentValue\":\"" + reader["PatentValue"].ToString() + "\"," + "\"BrandValue\":\"" + reader["BrandValue"].ToString() + "\"," +
                "\"InternationalAward\":\"" + reader["InternationalAward"].ToString() + "\"," + "\"NationAward\":\"" + reader["NationAward"].ToString() + "\"," +
                "\"ProvinceAward\":\"" + reader["ProvinceAward"].ToString() + "\"," +
                "\"Releasetime\":\"" + reader["Releasetime"].ToString() + "\"}");

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
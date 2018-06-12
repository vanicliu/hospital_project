<%@ WebHandler Language="C#" Class="riMan" %>

using System;
using System.Web;
using System.Text;

public class riMan : IHttpHandler {
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

    private string getprinItem()
    {

        string countcommand = "select count(*) from researchinvestment";
        int count = int.Parse(sqlOperation.ExecuteScalar(countcommand));
        string ricommand = "SELECT id,enterprise,year,techDevelopCost,RdInvestment,RdOrgLevel,RderNum,RderSeniorNum,patentFilingNum,patentLicNum,Releasetime from researchinvestment";
        MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(ricommand);
        StringBuilder backText = new StringBuilder("{\"Item\":[");
        int temp = 0;
        while(reader.Read())
        {
            backText.Append("{\"id\":\"" + reader["id"].ToString() + "\",\"enterprise\":\"" + reader["enterprise"].ToString() + "\",\"year\":\"" + reader["year"].ToString() + "\",\"techDevelopCost\":\"" + reader["techDevelopCost"].ToString()
                           + "\",\"RdInvestment\":\"" + reader["RdInvestment"].ToString() + "\",\"RdOrgLevel\":\"" + reader["RdOrgLevel"].ToString() + "\",\"RderNum\":\"" + reader["RderNum"].ToString() 
                           + "\",\"RderSeniorNum\":\"" + reader["RderSeniorNum"].ToString() + "\",\"patentFilingNum\":\"" + reader["patentFilingNum"].ToString() + "\",\"patentLicNum\":\"" + reader["patentLicNum"].ToString() + "\",\"Releasetime\":\"" + reader["Releasetime"].ToString() + "\"}");

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
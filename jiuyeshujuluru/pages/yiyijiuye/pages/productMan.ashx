<%@ WebHandler Language="C#" Class="productMan" %>

using System;
using System.Web;
using System.Text;

public class productMan : IHttpHandler {
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

        string countcommand = "select count(*) from product";
        int count = int.Parse(sqlOperation.ExecuteScalar(countcommand));
        string procommand = "SELECT id,enterprise,brand,degree,scent,other,Releasetime from product";
        MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(procommand);
        StringBuilder backText = new StringBuilder("{\"Item\":[");
        int temp = 0;
        while(reader.Read())
        {
            backText.Append("{\"id\":\"" + reader["id"].ToString() + "\",\"enterprise\":\"" + reader["enterprise"].ToString() + "\",\"brand\":\"" + reader["brand"].ToString() + "\",\"degree\":\"" + reader["degree"].ToString()
                           + "\",\"scent\":\"" + reader["scent"].ToString() + "\",\"other\":\"" + reader["other"].ToString() + "\",\"Releasetime\":\"" + reader["Releasetime"].ToString() + "\"}");

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
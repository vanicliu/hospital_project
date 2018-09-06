﻿<%@ WebHandler Language="C#" Class="GetConcreteInspectionResult" %>

using System;
using System.Web;
using System.Text;

public class GetConcreteInspectionResult : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string backString = InspectionResult(context);
        context.Response.Write(backString);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

    private string InspectionResult(HttpContext context)
    {
        DataLayer sqlOperation = new DataLayer("sqlStr");
        string id = context.Request.QueryString["id"];
        string people = context.Request.QueryString["people"];

        string sqlCommand = "SELECT inspections.MainItem,inspections.ChildItem,checkresults.RealValue,checkresults.FunctionStatus FROM checkresults LEFT JOIN inspections ON checkresults.Inspections_ID=inspections.ID WHERE Record_ID=@id";
        sqlOperation.AddParameterWithValue("@id", id);
        MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(sqlCommand);


        StringBuilder result = new StringBuilder("{\"result\":[");
        while (reader.Read())
        {
            result.Append("{\"MainItem\":\"").Append(reader["MainItem"].ToString())
                  .Append("\",\"ChildItem\":\"").Append(reader["ChildItem"].ToString())
                  .Append("\",\"RealValue\":\"").Append(reader["RealValue"].ToString())
                  .Append("\",\"FunctionStatus\":\"").Append(reader["FunctionStatus"].ToString())
                  .Append("\"},");
        }
        reader.Close();

        sqlCommand = "SELECT Name FROM user WHERE ID=@pid";
        sqlOperation.AddParameterWithValue("@pid", people);
        string name = sqlOperation.ExecuteScalar(sqlCommand);
        
        result.Remove(result.Length - 1, 1).Append("],").Append("\"other\":[{\"people\":\"").Append(name).Append("\",\"");

        sqlCommand = "SELECT checkrecord.result FROM checkrecord WHERE ID=@id";
        sqlOperation.AddParameterWithValue("@id", id);
        string state = sqlOperation.ExecuteScalar(sqlCommand);
        result.Append("state\":\"").Append(state).Append("\"}]}");

        sqlOperation.Close();
        sqlOperation.Dispose();
        sqlOperation = null;
        return result.ToString();
        
        //DataLayer sqlOperation = new DataLayer("sqlStr");
        //DataLayer sqlOperation2 = new DataLayer("sqlStr");
        //string id = context.Request.QueryString["id"];
        //string people = context.Request.QueryString["people"];
        
        //string sqlCommand = "SELECT * FROM checkresults WHERE Record_ID=@id";
        //string sqlCommand2 = "";
        //string temp = "SELECT result FROM checkrecord WHERE ID=@id";
        //sqlOperation.AddParameterWithValue("@id", id);
        //string functionAll = sqlOperation.ExecuteScalar(temp);
        //int count = int.Parse(sqlOperation.ExecuteScalar(sqlCommand));
        //if (count == 0)
        //    return "[{\"MainItem\":\"null\"}]";
        //sqlCommand = "SELECT * FROM checkresult WHERE Record_ID=@id";
        //MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(sqlCommand);
        //MySql.Data.MySqlClient.MySqlDataReader reader2;
        //StringBuilder backString = new StringBuilder("[");
        //sqlCommand2 = "SELECT Name From user WHERE ID=@uid";
        //sqlOperation2.AddParameterWithValue("@uid", context.Request.QueryString["people"]);
        //backString.Append("{\"name\":\"");        
        //string name = sqlOperation2.ExecuteScalar(sqlCommand2);
        //backString.Append(name + "\"").Append(",\"functionAll\":\"").Append(functionAll).Append("\"},"); 
        //int n = 1;
        //while (reader.Read())
        //{
        //    backString.Append("{\"MainItem\":\"");
        //    sqlCommand2 = "SELECT MainItem,ChildItem FROM Inspection WHERE ID=@InsID";
        //    sqlOperation2.AddParameterWithValue("@InsID", reader["Inspection_ID"].ToString());
        //    reader2 = sqlOperation2.ExecuteReader(sqlCommand2);
        //    if (reader2.Read())
        //    {
        //        backString.Append(reader2["MainItem"].ToString());
        //        backString.Append("\",\"ChildItem\":\"");
        //        backString.Append(reader2["ChildItem"].ToString());
        //    }
        //    reader2.Close();
        //    backString.Append("\",\"UIMRTRealValue\":\"");
        //    backString.Append(reader["UIMRTRealValue"].ToString());
        //    backString.Append("\",\"UIMRTState\":\"");
        //    backString.Append(reader["UIMRTState"].ToString());
        //    backString.Append("\",\"IMRTRealValue\":\"");
        //    backString.Append(reader["IMRTRealValue"].ToString());
        //    backString.Append("\",\"IMRTState\":\"");
        //    backString.Append(reader["IMRTState"].ToString());
        //    backString.Append("\",\"SRSRealValue\":\"");
        //    backString.Append(reader["SRSRealValue"].ToString());
        //    backString.Append("\",\"SRSState\":\"");
        //    backString.Append(reader["SRSState"].ToString());
        //    backString.Append("\",\"FunctionalStatus\":\"");
        //    backString.Append(reader["FunctionalStatus"].ToString());
        //    backString.Append("\"}");
        //    if (n < count)
        //    {
        //        backString.Append(",");
        //    }
        //    ++n;
        //}
        //reader.Close();
        //backString.Append("]");
        //sqlOperation.Close();
        //sqlOperation.Dispose(); 
        //sqlOperation2.Close();
        //sqlOperation2.Dispose();
        //return backString.ToString();
    }
    
}
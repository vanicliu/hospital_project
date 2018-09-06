﻿<%@ WebHandler Language="C#" Class="getmodel" %>

using System;
using System.Web;
using System.Text;
/* ***********************************************************
 * FileName:getmodel.ashx
 * Writer: xubxiao
 * create Date: 2017-5-5
 * ReWriter:
 * Rewrite Date:
 * impact :
 * 获取数据库中模具参考值
 * **********************************************************/

public class getmodel : IHttpHandler {
    DataLayer sqlOperation = new DataLayer("sqlStr");
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string backString = getmodelItem();
        sqlOperation.Close();
        sqlOperation.Dispose();
        sqlOperation = null;
        context.Response.Write(backString);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    private string getmodelItem()
    {
        string countItem = "SELECT count(*) FROM material ";
        int count = int.Parse(sqlOperation.ExecuteScalar(countItem));

        string sqlCommand = "SELECT * FROM material order by Orders ";
        MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(sqlCommand);
        StringBuilder backText = new StringBuilder("{\"Item\":[");
        int i = 1;
        while (reader.Read())
        {
            backText.Append("{\"ID\":\"" + reader["ID"].ToString() + "\",\"Name\":\"" + reader["Name"].ToString() + "\"}");
            if (i < count)
            {

                backText.Append(",");
            }
            i++;
        }
        reader.Close();
        backText.Append("],\"defaultItem\":");
        string defaultpart = "SELECT ID,Name FROM material where IsDefault=0";
        MySql.Data.MySqlClient.MySqlDataReader reader1 = sqlOperation.ExecuteReader(defaultpart);
        if (reader1.Read())
        {
            backText.Append("{\"ID\":\"" + reader1["ID"].ToString() + "\",\"Name\":\"" + reader1["Name"].ToString() + "\"}");

        }
        else
        {
            backText.Append("\"\"");
        }
        backText.Append("}");
        return backText.ToString();
    }

}
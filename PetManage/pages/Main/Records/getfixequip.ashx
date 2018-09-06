﻿<%@ WebHandler Language="C#" Class="getfixequip" %>

using System;
using System.Web;
using System.Text;
/* ***********************************************************
 * FileName:getfixequip.ashx
 * Writer: xubxiao
 * create Date: 2017-5-9
 * ReWriter:
 * Rewrite Date:
 * impact :
 * 获取数据库中固定装置参考表数据
 * **********************************************************/

public class getfixequip : IHttpHandler {
    DataLayer sqlOperation = new DataLayer("sqlStr");
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string backString = getfixequipItem();
        sqlOperation.Close();
        sqlOperation.Dispose();
        context.Response.Write(backString);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    private string getfixequipItem()
    {
        string countItem = "SELECT count(*) FROM FixedEquipment";
        int count = int.Parse(sqlOperation.ExecuteScalar(countItem));

        string sqlCommand = "SELECT ID,Name FROM FixedEquipment order by Orders";
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
        string defaultpart = "SELECT ID,Name FROM FixedEquipment where IsDefault=0";
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
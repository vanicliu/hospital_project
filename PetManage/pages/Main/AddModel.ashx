<%@ WebHandler Language="C#" Class="AddModel" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Text;
public class AddModel : IHttpHandler
{
    DataLayer sqlOperation = new DataLayer("sqlStr");
    public void ProcessRequest(HttpContext context)
    {
        String JSON = add(context);
        context.Response.ContentType = "text/plain";
        sqlOperation.Close();
        sqlOperation.Dispose();
        context.Response.Write(JSON);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    public String add(HttpContext context)
    {
        String number = context.Request["number"];
        String str = number.Substring(1, number.Length - 2);
        String[] arr = str.Split(',');
        String sqlStr = "update modelregist set amount=case id when 1 then "+arr[0]+" " +
                                                              "when 2 then "+arr[1]+" " +
                                                              "when 3 then "+arr[2]+" " +
                                                              "when 4 then "+arr[3]+" " +
                                                              "when 5 then "+arr[4]+" " +
                                                              "when 6 then "+arr[5]+" " +
                                                              "when 7 then "+arr[6]+" " +
                                                              "end " +
                                                              "where id in(1,2,3,4,5,6,7)";//批量更新多条数据
        int count= sqlOperation.ExecuteNonQuery(sqlStr);
        string result = "";
        if (count < 0)
        {
            result = "fail";
        }
        else {
            result = "success";
        }
        return result;
    }
}
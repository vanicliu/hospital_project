﻿<%@ WebHandler Language="C#" Class="rankPS" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data;

public class rankPS : IHttpHandler {
    private string rank;
    public void ProcessRequest (HttpContext context) {
        DataTable dt = GetPS();
        rank = DataTableToJson(dt);
        context.Response.ContentType = "text/plain";
        context.Response.Write(rank);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }
    public DataTable GetPS() {
        string strConn="User Id=root;password=root;database=db_jiuye;server=localhost";
        MySqlConnection connSql=new MySqlConnection (strConn);
        connSql.Open();
        string getCommand = "select company,persale from operatingconditions where year='2016'";
        MySqlCommand sqlcommand = new MySqlCommand(getCommand,connSql);
        MySqlDataAdapter sda = new MySqlDataAdapter(sqlcommand);
        DataTable TA = new DataTable();
        TA.Columns.Add("company", typeof(string));
        TA.Columns.Add("persale", typeof(double));
        sda.Fill(TA);
        connSql.Close();
        Object max = TA.Compute("Max(persale)",null);
        double maxD = (double)max;
        Object  min = TA.Compute("Min(persale)", null);
        double minD = (double)min;
        for (int i = 0; i < TA.Rows.Count; i++)
        {
            double totalassets = (double)TA.Rows[i]["persale"];
            double new_ta = (totalassets - minD) / (maxD - minD);
            double new_taD = Math.Round(new_ta, 4);
            TA.Rows[i]["persale"] = new_taD*100;
        }
        DataView dv = TA.DefaultView;
        dv.Sort = "persale desc";
        dv.ToTable();
        return TA;
    }
    public string DataTableToJson(DataTable table)
    {
        var JsonString = new StringBuilder();
        if (table.Rows.Count > 0)
        {
            JsonString.Append("[");
            for (int i = 0; i < table.Rows.Count; i++)
            {
                JsonString.Append("{");
                for (int j = 0; j < table.Columns.Count; j++)
                {
                    if (j < table.Columns.Count - 1)
                    {
                        JsonString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                    }
                    else if (j == table.Columns.Count - 1)
                    {
                        JsonString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                    }
                }
                if (i == table.Rows.Count - 1)
                {
                    JsonString.Append("}");
                }
                else
                {
                    JsonString.Append("},");
                }
            }
            JsonString.Append("]");
        }
        return JsonString.ToString();
    }
}
﻿<%@ WebHandler Language="C#" Class="rankRI" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data;

public class rankRI : IHttpHandler {
    private string rank;
    public void ProcessRequest (HttpContext context) {
        DataTable dt = GetRI();
        rank = DataTableToJson(dt);
        context.Response.ContentType = "text/plain";
        context.Response.Write(rank);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }
    public DataTable GetRI() {
        string strConn="User Id=root;password=root;database=db_jiuye;server=localhost";
        MySqlConnection connSql=new MySqlConnection (strConn);
        connSql.Open();
        string getCommand = "select enterprise,RdInvestment from researchinvestment where year='2016'";
        MySqlCommand sqlcommand = new MySqlCommand(getCommand,connSql);
        MySqlDataAdapter sda = new MySqlDataAdapter(sqlcommand);
        DataTable TA = new DataTable();
        TA.Columns.Add("enterprise", typeof(string));
        TA.Columns.Add("RdInvestment", typeof(double));
        sda.Fill(TA);
        connSql.Close();
        Object max = TA.Compute("Max(RdInvestment)",null);
        double maxD = (double)max;
        Object  min = TA.Compute("Min(RdInvestment)", null);
        double minD = (double)min;
        for (int i = 0; i < TA.Rows.Count; i++)
        {
            double totalassets = (double)TA.Rows[i]["RdInvestment"];
            double new_ta = (totalassets - minD) / (maxD - minD);
            double new_taD = Math.Round(new_ta, 4);
            TA.Rows[i]["RdInvestment"] = new_taD*100;
        }
        DataView dv = TA.DefaultView;
        dv.Sort = "RdInvestment desc";
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
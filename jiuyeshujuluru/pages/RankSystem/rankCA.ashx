<%@ WebHandler Language="C#" Class="rankCA" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data;

public class rankCA : IHttpHandler {
    private string rank;
    public void ProcessRequest (HttpContext context) {
        DataTable dt = GetCA();
        rank = DataTableToJson(dt);
        context.Response.ContentType = "text/plain";
        context.Response.Write(rank);//将json数组输出
    }

    public bool IsReusable {
        get {
            return false;
        }
    }
    public DataTable GetCA() {
        string strConn="User Id=root;password=root;database=db_jiuye;server=localhost";
        MySqlConnection connSql=new MySqlConnection (strConn);//建立数据库连接
        connSql.Open();
        string getCommand = "select company,currentassets from operatingconditions where year='2016'";
        MySqlCommand sqlcommand = new MySqlCommand(getCommand,connSql);//实例化
        MySqlDataAdapter sda = new MySqlDataAdapter(sqlcommand);
        DataTable TA = new DataTable();
        TA.Columns.Add("company", typeof(string));
        TA.Columns.Add("currentassets", typeof(double));
        sda.Fill(TA);//新建datatable并插入查询语句
        connSql.Close();
        Object max = TA.Compute("Max(currentassets)",null);
        double maxD = (double)max;//获取最大值
        Object  min = TA.Compute("Min(currentassets)", null);
        double minD = (double)min;//获取最小值
        for (int i = 0; i < TA.Rows.Count; i++)
        {
            double totalassets = (double)TA.Rows[i]["currentassets"];
            double new_ta = (totalassets - minD) / (maxD - minD);
            double new_taD = Math.Round(new_ta, 4);
            TA.Rows[i]["currentassets"] = new_taD*100;
        }//对字段数据进行归一化
        DataView dv = TA.DefaultView;
        dv.Sort = "currentassets desc";
        dv.ToTable();//排序
        return TA;
    }
        /*将datatable转成json数组*/
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
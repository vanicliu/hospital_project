using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_productMan : System.Web.UI.Page
{
    //private DataLayer sqlOperation = new DataLayer("sqlyiyi");
    protected void Page_Load(object sender, EventArgs e)
    {
        //string id = Request.QueryString["ID"];
        //string countcommand = "select count(*) from product";
        //int count = int.Parse(sqlOperation.ExecuteScalar(countcommand));
        //string sqlCommand = "SELECT Enterprise,Brand,Degree,Scent,Other from product";
        //sqlOperation.AddParameterWithValue("@id", id);
        //MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(sqlCommand);
        //StringBuilder backText = new StringBuilder("{\"Item\":[");
        //int temp = 0;

        //while (reader.Read())
        //{
        //    this.Label1.Text = reader["Enterprise"].ToString();
        //    this.Label2.Text = reader["Brand"].ToString();
        //    this.Label3.Text = reader["Degree"].ToString();
        //    this.Label4.Text = reader["Scent"].ToString();
        //    this.Label5.Text = reader["Other"].ToString();
        //    DateTime date = Convert.ToDateTime(reader["Releasetime"].ToString());
        //    string day = date.Year.ToString() + "-" + date.Month.ToString() + "-" + date.Day.ToString();
        //    this.Label3.Text = reader["Title"].ToString();
        //    this.Label2.Text = "发布时间:" + day + "&nbsp;&nbsp;&nbsp;&nbsp";
        //    this.Label1.Text = reader["Content"].ToString();
        //    backText.Append("{\"ID\":\"" + reader["ID"].ToString() + "\",\"Title\":\"" + reader["Title"].ToString() + "\",\"Releasetime\":\"" + Convert.ToDateTime(reader["Releasetime"].ToString()).ToString("yyyy-MM-dd") + "\"}");

        //    if (temp < count - 1)
        //    {
        //        backText.Append(",");
        //    }
        //    temp = temp + 1;
        //}
    }
}
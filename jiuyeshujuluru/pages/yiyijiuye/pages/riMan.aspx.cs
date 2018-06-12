using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_riMan : System.Web.UI.Page
{
    //private DataLayer sqlOperation = new DataLayer("sqlyiyi");
    protected void Page_Load(object sender, EventArgs e)
    {
        //string id = Request.QueryString["ID"];
        //string sqlCommand = "SELECT enterprise,year,techDevelopCost,RdInvestment,RdOrgLevel,RderNum,RderSeniorNum,patentFilingNum,patentLicNum from researchinvestment";
        //sqlOperation.AddParameterWithValue("@id", id);
        //MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(sqlCommand);

        //if (reader.Read())
        //{
        //    this.Label1.Text = reader["enterprise"].ToString();
        //    this.Label2.Text = reader["year"].ToString();
        //    this.Label3.Text = reader["techDevelopCost"].ToString();
        //    this.Label4.Text = reader["RdInvestment"].ToString();
        //    this.Label5.Text = reader["RdOrgLevel"].ToString();
        //    this.Label6.Text = reader["RderNum"].ToString();
        //    this.Label7.Text = reader["RderSeniorNum"].ToString();
        //    this.Label8.Text = reader["patentFilingNum"].ToString();
        //    this.Label9.Text = reader["patentLicNum"].ToString();
        //    DateTime date = Convert.ToDateTime(reader["Releasetime"].ToString());
        //    string day = date.Year.ToString() + "-" + date.Month.ToString() + "-" + date.Day.ToString();
        //    this.Label3.Text = reader["Title"].ToString();
        //    this.Label2.Text = "发布时间:" + day + "&nbsp;&nbsp;&nbsp;&nbsp";
        //    this.Label1.Text = reader["Content"].ToString();
        //}
    }
}
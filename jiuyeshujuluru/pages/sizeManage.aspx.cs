using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_sizeManage : System.Web.UI.Page
{
    //private DataLayer sqlOperation = new DataLayer("sqljiuye");//数据库操作类
    protected void Page_Load(object sender, EventArgs e)
    {   
        //string id = Request.QueryString["ID"];
       // string sqlCommand = "SELECT enterprise,totalassets,area,productoutput,employeesnumber,year from size";
         //sqlOperation.AddParameterWithValue("@id", id);
        //MySql.Data.MySqlClient.MySqlDataReader reader = sqlOperation.ExecuteReader(sqlCommand);
        //if (reader.Read())
        //{
        //    this.year.Value = reader["year"].ToString();
        //    this.enterpriseName.Value = reader["enterprise"].ToString();
        //    this.totalAssets.Value = reader["totalassets"].ToString();
        //    this.area.Value = reader["area"].ToString();
        //    this.productNumber.Value = reader["productoutput"].ToString();
        //    this.employeesNumber.Value = reader["employeesnumber"].ToString();
        //}
    }
}
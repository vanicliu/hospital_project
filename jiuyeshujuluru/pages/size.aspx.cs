using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_size : System.Web.UI.Page
{
    private DataLayer sqlOperation = new DataLayer("sqljiuye");
    protected void Page_Load(object sender, EventArgs e)
    {
        string ispostback = Request.Form["postSize"];
        if (IsPostBack && ispostback != null && ispostback =="true") {
            
            if (AddNews())
            {
                MessageBox.Message("录入成功");
                
            }
        }
    }
    private Boolean AddNews() {
        string enterprise = Request.Form["enterprise"];
        string totalassets = Request.Form["totalAssets"];
        string area = Request.Form["area"];
        string productoutput = Request.Form["productOutput"];
        string employeesnumber = Request.Form["employeesNumber"];
        string year = Request.Form["year"];
        string strSqlCommand = "INSERT INTO size(enterprise,totalassets,area,productoutput,employeesnumber,year,releasetime)" +
                              "VALUES(@enterprise,@totalassets,@area,@productoutput,@employeesnumber,@year,@releasetime)";
        sqlOperation.AddParameterWithValue("@enterprise", enterprise);
        sqlOperation.AddParameterWithValue("@totalassets", totalassets);
        sqlOperation.AddParameterWithValue("@area", area);
        sqlOperation.AddParameterWithValue("@productoutput", productoutput);
        sqlOperation.AddParameterWithValue("@employeesnumber", employeesnumber);
        sqlOperation.AddParameterWithValue("@year", year);
        sqlOperation.AddParameterWithValue("@Releasetime", DateTime.Now);
        int intSuccess = sqlOperation.ExecuteNonQuery(strSqlCommand);
        return (intSuccess > 0) ? true : false;
    }
}
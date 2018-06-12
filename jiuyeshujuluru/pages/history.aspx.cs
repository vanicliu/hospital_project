using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

public partial class pages_history : System.Web.UI.Page
{
    private DataLayer sqlOperation = new DataLayer("sqljiuye");
    protected void Page_Load(object sender, EventArgs e)
    {
        string ispostback = Request.Form["postHistory"];//判断是否有传值
        if (IsPostBack && ispostback != null && ispostback == "true")
        {
            if (AddNews())
            {
                MessageBox.Message("录入成功！");
            }

        }
    }
    /*将数据传入数据库*/
    private Boolean AddNews()
    {
        string enterprise = Request.Form["enterprise"];
        string buildtime = Request.Form["buildTime"];
        string usedname = Request.Form["usedName"];
        string nowname = Request.Form["nowName"];
        string changetime = Request.Form["changeTime"];
        string usedname2 = Request.Form["usedName2"];
        string nowname2 = Request.Form["nowName2"];
        string changetime2 = Request.Form["changeTime2"];
        string usedname3 = Request.Form["usedName3"];
        string nowname3 = Request.Form["nowName3"];
        string changetime3 = Request.Form["changeTime3"];
        string remains = Request.Form["remains"];
        string product = Request.Form["product"];
        string strsqlCommand = "INSERT INTO history(enterprise,buildtime,usedname,nowname,changetime,usedname2,nowname2,changetime2,usedname3,nowname3,changetime3,remains,product,releasetime)" +
                                "VALUES(@enterprise,@buildtime,@usedname,@nowname,@changetime,@usedname2,@nowname2,@changetime2,@usedname3,@nowname3,@changetime3,remains,@product,@releasetime)";
        sqlOperation.AddParameterWithValue("@enterprise", enterprise);
        sqlOperation.AddParameterWithValue("@buildtime", buildtime);
        sqlOperation.AddParameterWithValue("@usedname", usedname);
        sqlOperation.AddParameterWithValue("@nowname", nowname);
        sqlOperation.AddParameterWithValue("@changetime", changetime);
        sqlOperation.AddParameterWithValue("@usedname2", usedname2);
        sqlOperation.AddParameterWithValue("@nowname2", nowname2);
        sqlOperation.AddParameterWithValue("@changetime2", changetime2);
        sqlOperation.AddParameterWithValue("@usedname3", usedname3);
        sqlOperation.AddParameterWithValue("@nowname3", nowname3);
        sqlOperation.AddParameterWithValue("@changetime3", changetime3);
        sqlOperation.AddParameterWithValue("@remains",remains);
        sqlOperation.AddParameterWithValue("@product", product);
        sqlOperation.AddParameterWithValue("@releasetime", DateTime.Now);
        int intSuccess = sqlOperation.ExecuteNonQuery(strsqlCommand);
        return (intSuccess > 0) ? true : false;
    }
}
//[System.Web.Services.WebMethod()]
//public static string AjaxMethod(List<string> olist)
//{
//    string sb = "(";
//    foreach (var item in olist)
//    {
//        sb = sb + "\"" + item + "\",";
//    }
//    for (int i = 0; i < 8; i++)
//        sb = sb + "\"\",";
//    sb = sb.Substring(0, sb.Length - 1);
//    sb = sb + ")";
//    //string sb = "(";
//    //foreach (var item in olist)
//    //{
//    //    sb = sb + "\"" + item + "\",";
//    //}
//    //sb = sb.Substring(0, sb.Length - 1);
//    //sb = sb + ")";

//    MySqlConnection _sqlConnect;//Mysql连接对象

//    MySqlCommand _sqlCommand;//Mysql命令对象
//    string _strConnectString;//连接字符串

//    _strConnectString = System.Configuration.ConfigurationManager.ConnectionStrings["sqljiuye"].ToString();//！！！数据库名需要修改

//    _sqlConnect = new MySqlConnection(_strConnectString);

//    _sqlCommand = new MySqlCommand("", _sqlConnect);
//    _sqlConnect.Open();
//    _sqlCommand.CommandText = "insert into history values " + sb.ToString();
//    if (_sqlCommand.Connection == null)
//    {

//        _sqlCommand.Connection = _sqlConnect;

//    }
//    try
//    {
//        _sqlCommand.ExecuteScalar();
//    }
//    catch
//    {
//        _sqlConnect.Close();
//        return "0";
//    }
//    _sqlConnect.Close();
//    return "1";
//}

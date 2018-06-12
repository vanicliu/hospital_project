using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

public partial class product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [System.Web.Services.WebMethod()]
    public static string AjaxMethod(List<string> olist)
    {
        string sb="(";
        foreach (var item in olist)
        {
            sb=sb+"\""+item+"\",";
        }
        for (int i = 0; i < 8; i++)
            sb = sb + "\"\",";
        sb = sb + "\""+DateTime.Now+"\"";
        sb = sb + ")";

        MySqlConnection _sqlConnect;//Mysql连接对象

        MySqlCommand _sqlCommand;//Mysql命令对象
        string _strConnectString;//连接字符串

        _strConnectString = System.Configuration.ConfigurationManager.ConnectionStrings["sqljiuye"].ToString();//！！！数据库名需要修改

        _sqlConnect = new MySqlConnection(_strConnectString);

        _sqlCommand = new MySqlCommand("", _sqlConnect);
        _sqlConnect.Open();
        _sqlCommand.CommandText = "insert into operatingconditions values " + sb.ToString() ;
        if (_sqlCommand.Connection == null)
        {

            _sqlCommand.Connection = _sqlConnect;

        }
        try
        {
             _sqlCommand.ExecuteScalar();
        }
        catch
        {
            _sqlConnect.Close();
            return "0";
        }
        _sqlConnect.Close();
        return "1";

    }
}
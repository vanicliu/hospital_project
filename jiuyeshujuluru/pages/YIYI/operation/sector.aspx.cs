using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

public partial class sector : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [System.Web.Services.WebMethod()]
    public static string AjaxMethodse(List<string> olistse)
    {
        string sb = "(";
        foreach (var item in olistse)
        {
            sb = sb + "\"" + item + "\",";
        }
        sb = sb + "\""+DateTime.Now+"\"";
        sb = sb + ")";

        MySqlConnection _sqlConnect;//Mysql连接对象

        MySqlCommand _sqlCommand;//Mysql命令对象
        string _strConnectString;//连接字符串

        _strConnectString = System.Configuration.ConfigurationManager.ConnectionStrings["sqljiuye"].ToString();//数据库名需要修改！！！

        _sqlConnect = new MySqlConnection(_strConnectString);

        _sqlCommand = new MySqlCommand("", _sqlConnect);
        _sqlConnect.Open();
        _sqlCommand.CommandText = "insert into sector_data values " + sb.ToString();
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
	
	    [System.Web.Services.WebMethod()]
    public static string AjaxMethod1()
    {
        //List<string> olist = new List<string>();
        String str = "{\"olist\":[";

        MySqlConnection _sqlConnect;//Mysql连接对象

        MySqlCommand _sqlCommand;//Mysql命令对象
        string _strConnectString;//连接字符串

        _strConnectString = System.Configuration.ConfigurationManager.ConnectionStrings["sqljiuye"].ToString();//！！！数据库名需要修改

        _sqlConnect = new MySqlConnection(_strConnectString);

        _sqlCommand = new MySqlCommand("", _sqlConnect);
        _sqlConnect.Open();
        _sqlCommand.CommandText = "select distinct company from operatingconditions";
        if (_sqlCommand.Connection == null)
        {

            _sqlCommand.Connection = _sqlConnect;

        }
        MySqlDataReader reader = _sqlCommand.ExecuteReader();

        try
        {
            while (reader.Read())
            {
                str = str + "\"" + reader.GetString(0) + "\",";
            }
            str = str.Substring(0, str.Length - 1) + "]}";
            reader.Close();
            reader.Dispose();
        }
        catch
        {
            _sqlConnect.Close();
            _sqlConnect.Dispose();
            return "{\"olist\":[\"error \"]}"; ;
        }
        _sqlConnect.Close();
        _sqlConnect.Dispose();
        return str;

    }
}
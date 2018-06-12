using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;


public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    [System.Web.Services.WebMethod()]
    public static string AjaxMethod(string admin, string password)
    {
        MySqlConnection _sqlConnect;//Mysql连接对象

        MySqlCommand _sqlCommand;//Mysql命令对象
        string _strConnectString;//连接字符串

        _strConnectString = System.Configuration.ConfigurationManager.ConnectionStrings["sqljiuye"].ToString();

        _sqlConnect = new MySqlConnection(_strConnectString);

        _sqlCommand = new MySqlCommand("", _sqlConnect);
        _sqlConnect.Open();
        _sqlCommand.Parameters.AddWithValue("@admin", admin);
        _sqlCommand.Parameters.AddWithValue("@password", password);
        _sqlCommand.CommandText = "SELECT * FROM t_haadmin WHERE admin_id=@admin AND admin_password=@password";
        if (_sqlCommand.Connection == null)
        {

            _sqlCommand.Connection = _sqlConnect;

        }
        try
        {
            string strResult = _sqlCommand.ExecuteScalar().ToString();
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
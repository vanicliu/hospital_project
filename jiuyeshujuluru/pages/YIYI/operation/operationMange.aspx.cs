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
    public static string AjaxMethod()
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
             while(reader.Read())
             {
                 str=str+"\""+reader.GetString(0)+"\",";
             }
             str = str.Substring(0, str.Length - 1)+"]}";
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

    [System.Web.Services.WebMethod()]
    public static string AjaxMethod1(String company,String year)
    {
        String str1 = "{\"olist\":[";
        MySqlConnection _sqlConnect1;//Mysql连接对象

        MySqlCommand _sqlCommand1;//Mysql命令对象
        string _strConnectString1;//连接字符串

        _strConnectString1 = System.Configuration.ConfigurationManager.ConnectionStrings["sqljiuye"].ToString();//！！！数据库名需要修改

        _sqlConnect1 = new MySqlConnection(_strConnectString1);

        _sqlCommand1 = new MySqlCommand("", _sqlConnect1);
         _sqlConnect1.Open();
        _sqlCommand1.Parameters.AddWithValue("@company", company);
        _sqlCommand1.Parameters.AddWithValue("@year", year);
        _sqlCommand1.CommandText = "SELECT * FROM operatingconditions WHERE company=@company AND year=@year";
        if (_sqlCommand1.Connection == null)
        {

            _sqlCommand1.Connection = _sqlConnect1;

        }      
        MySqlDataReader reader1 = _sqlCommand1.ExecuteReader();

        try
        {
            if(reader1.Read())
            {
                for (int i = 0; i < 44; i++)
                {
                    str1 = str1 + "\"" + reader1.GetString(i) + "\",";
                }
            }
            str1 = str1.Substring(0, str1.Length - 1) + "]}";
        }
        catch
        {
            _sqlConnect1.Close();
            _sqlConnect1.Dispose();
            return "{\"olist\":[\"error \"]}"; ;
        }
        _sqlConnect1.Close();
        _sqlConnect1.Dispose();
        return str1;

    }

    [System.Web.Services.WebMethod()]
    public static string AjaxMethod2(String sltCompany)
    {
        String str = "{\"olist\":[";
        MySqlConnection _sqlConnect1;//Mysql连接对象

        MySqlCommand _sqlCommand1;//Mysql命令对象
        string _strConnectString1;//连接字符串

        _strConnectString1 = System.Configuration.ConfigurationManager.ConnectionStrings["sqljiuye"].ToString();//！！！数据库名需要修改

        _sqlConnect1 = new MySqlConnection(_strConnectString1);

        _sqlCommand1 = new MySqlCommand("", _sqlConnect1);
        _sqlConnect1.Open();
        _sqlCommand1.Parameters.AddWithValue("@sltCompany", sltCompany);
        _sqlCommand1.CommandText = "SELECT year FROM operatingconditions WHERE company=@sltCompany";
        if (_sqlCommand1.Connection == null)
        {

            _sqlCommand1.Connection = _sqlConnect1;

        }
        MySqlDataReader reader = _sqlCommand1.ExecuteReader();

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
            _sqlConnect1.Close();
            _sqlConnect1.Dispose();
            return "{\"olist\":[\"error \"]}"; ;
        }
        _sqlConnect1.Close();
        _sqlConnect1.Dispose();
        return str;

    }

    [System.Web.Services.WebMethod()]
    public static string AjaxMethod3(List<string> olist,string companydom,string yeardom)
    {
        string sb = "(";
        foreach (var item in olist)
        {
            sb = sb + "\"" + item + "\",";
        }
        sb = sb.Substring(0, sb.Length - 1);
        sb = sb + ")";
        MySqlConnection _sqlConnect;//Mysql连接对象

        MySqlCommand _sqlCommand;//Mysql命令对象
        string _strConnectString;//连接字符串

        _strConnectString = System.Configuration.ConfigurationManager.ConnectionStrings["sqljiuye"].ToString();//！！！数据库名需要修改

        _sqlConnect = new MySqlConnection(_strConnectString);

        _sqlCommand = new MySqlCommand("", _sqlConnect);
        _sqlConnect.Open();
        _sqlCommand.Parameters.AddWithValue("@Companynow", olist[0]);
        _sqlCommand.Parameters.AddWithValue("@Yearnow", olist[1]);
        _sqlCommand.Parameters.AddWithValue("@Companydom", companydom);
        _sqlCommand.Parameters.AddWithValue("@Yeardom", yeardom);
        _sqlCommand.CommandText = "SELECT * FROM operatingconditions WHERE company=@Companynow AND year=@Yearnow";
        if (_sqlCommand.Connection == null)
        {

            _sqlCommand.Connection = _sqlConnect;

        }
        if (olist[0] != companydom || olist[1] != yeardom)
        {
            MySqlDataReader reader = _sqlCommand.ExecuteReader();
            if (reader.HasRows == true)
            {
                reader.Close();
                reader.Dispose();
                _sqlConnect.Close();
                _sqlConnect.Dispose();
                return "0";//插入的数据已经存在
            }
            reader.Close();
            reader.Dispose();
        }

        try
        {
            _sqlCommand.CommandText = "DELETE FROM operatingconditions WHERE company=@Companydom AND year=@Yeardom";
            if (_sqlCommand.ExecuteNonQuery() > 0)
            {
                _sqlCommand.CommandText = "insert into operatingconditions values " + sb.ToString();
                _sqlCommand.ExecuteScalar();
            }
            else
            {
                _sqlConnect.Close();
                _sqlConnect.Dispose();
                return "2";
            }

        }
        catch
        {
        
            _sqlConnect.Close();
            _sqlConnect.Dispose();
            return "2";  //发生未知错误！
        }
        _sqlConnect.Close();
        _sqlConnect.Dispose();
        return "1";//更新数据成功！

    }

    [System.Web.Services.WebMethod()]
    public static string AjaxMethod4(String company, String year)
    {
        MySqlConnection _sqlConnect1;//Mysql连接对象

        MySqlCommand _sqlCommand1;//Mysql命令对象
        string _strConnectString1;//连接字符串

        _strConnectString1 = System.Configuration.ConfigurationManager.ConnectionStrings["sqljiuye"].ToString();//！！！数据库名需要修改

        _sqlConnect1 = new MySqlConnection(_strConnectString1);

        _sqlCommand1 = new MySqlCommand("", _sqlConnect1);
        _sqlConnect1.Open();
        _sqlCommand1.Parameters.AddWithValue("@company", company);
        _sqlCommand1.Parameters.AddWithValue("@year", year);
        _sqlCommand1.CommandText = "DELETE FROM operatingconditions WHERE company=@company AND year=@year";
        if (_sqlCommand1.Connection == null)
        {

            _sqlCommand1.Connection = _sqlConnect1;

        }

        try
        {
            if (_sqlCommand1.ExecuteNonQuery()<=0)
            {
                _sqlConnect1.Close();
                _sqlConnect1.Dispose();
                return "0";
            }
        }
        catch
        {
            _sqlConnect1.Close();
            _sqlConnect1.Dispose();
            return "1"; ;
        }
        _sqlConnect1.Close();
        _sqlConnect1.Dispose();
        return "2";

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_intangibleassets : System.Web.UI.Page
{
    private DataLayer sqlOperation = new DataLayer("sqljiuye");
    protected void Page_Load(object sender, EventArgs e)
    {
        string ispostback = Request.Form["postAssets"];
        if (IsPostBack && ispostback != null && ispostback == "true")
        {
            if (AddNews())
            {
                MessageBox.Message("录入成功！");
            }
        }


    }
    /// <summary>
    /// 消息发布到数据库
    /// </summary>
    /// <returns></returns>
    private Boolean AddNews()
    {
		string Enterprise = Request.Form["enterprise"];
        string PatentValue = Request.Form["patent"];
        string BrandValue = Request.Form["brand"];
		string InternationalAward = Request.Form["international"];
        string NationAward = Request.Form["nation"];
        string ProvinceAward = Request.Form["province"];
        //将信息写入数据库，并返回是否成功
        string strSqlCommand = "INSERT INTO intangibleassets(Enterprise,PatentValue,BrandValue,InternationalAward,NationAward,ProvinceAward,Releasetime) " +
                                "VALUES(@Enterprise,@PatentValue,@BrandValue,@InternationalAward,@NationAward,@ProvinceAward,@Releasetime)";
        sqlOperation.AddParameterWithValue("@Enterprise", Enterprise);
 	sqlOperation.AddParameterWithValue("@PatentValue", PatentValue);
        sqlOperation.AddParameterWithValue("@BrandValue", BrandValue);
		sqlOperation.AddParameterWithValue("@InternationalAward", InternationalAward);
        sqlOperation.AddParameterWithValue("@NationAward", NationAward);
        sqlOperation.AddParameterWithValue("@ProvinceAward", ProvinceAward);
	sqlOperation.AddParameterWithValue("@Releasetime", DateTime.Now);
        int intSuccess = sqlOperation.ExecuteNonQuery(strSqlCommand);
        return (intSuccess > 0) ? true : false;
    }
}
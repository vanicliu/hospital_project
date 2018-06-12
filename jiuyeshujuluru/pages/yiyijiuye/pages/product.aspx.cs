using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_product : System.Web.UI.Page
{
    private DataLayer sqlOperation = new DataLayer("sqljiuye");
    protected void Page_Load(object sender, EventArgs e)
    {
        string ispostback = Request.Form["postProduct"];
        if(IsPostBack && ispostback != null && ispostback == "true")
        {
            if (AddProduct())
            {
                MessageBox.Message("提交成功！");
            }
        }
    }

    /// <summary>
    /// 消息发布到数据库
    /// </summary>
    /// <returns></returns>
    private Boolean AddProduct()
    {

        string Enterprise = Request.Form["enterprise"];
        string Brand = Request.Form["brand"];
        string Degree = Request.Form["degree"];
        string Scent = Request.Form["scent"];
        string Other = Request.Form["other"];
        //将信息写入数据库，并返回是否成功
        string strSqlCommand = "INSERT INTO product(Enterprise,Brand,Degree,Scent,Other,Releasetime)" +
                                "VALUES(@Enterprise,@Brand,@Degree,@Scent,@Other,@Releasetime)";
        sqlOperation.AddParameterWithValue("@Enterprise", Enterprise);
        sqlOperation.AddParameterWithValue("@Brand", Brand);
        sqlOperation.AddParameterWithValue("@Degree", Degree);
        sqlOperation.AddParameterWithValue("@Scent", Scent);
        sqlOperation.AddParameterWithValue("@Other", Other);
	sqlOperation.AddParameterWithValue("@Releasetime", DateTime.Now);
        int intSuccess = sqlOperation.ExecuteNonQuery(strSqlCommand);

        return (intSuccess > 0) ? true : false;
    }
}
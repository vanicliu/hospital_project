using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_socialvaluation : System.Web.UI.Page
{
    private DataLayer sqlOperation = new DataLayer("sqljiuye");
    protected void Page_Load(object sender, EventArgs e)
    {
        string ispostback = Request.Form["postValuation"];
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
        string DelphiMethod = Request.Form["professional"];
        string ConsumerSurvey = Request.Form["consumer"];
        //将信息写入数据库，并返回是否成功
        string strSqlCommand = "INSERT INTO socialvaluation(Enterprise,DelphiMethod,ConsumerSurvey,Releasetime) " +
                                "VALUES(@Enterprise,@DelphiMethod,@ConsumerSurvey,@Releasetime)";
		sqlOperation.AddParameterWithValue("@Enterprise", Enterprise);
        sqlOperation.AddParameterWithValue("@DelphiMethod", DelphiMethod);
        sqlOperation.AddParameterWithValue("@ConsumerSurvey", ConsumerSurvey);
        sqlOperation.AddParameterWithValue("@Releasetime", DateTime.Now);
        int intSuccess = sqlOperation.ExecuteNonQuery(strSqlCommand);
        return (intSuccess > 0) ? true : false;
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_ri : System.Web.UI.Page
{
    private DataLayer sqlOperation = new DataLayer("sqljiuye");
    protected void Page_Load(object sender, EventArgs e)
    {
        string ispostback = Request.Form["postRi"];
        if (IsPostBack && ispostback != null && ispostback == "true")
        {
            if (AddRi())
            {
                MessageBox.Message("提交成功！");
            }
        }
    }

    /// <summary>
    /// 消息发布到数据库
    /// </summary>
    /// <returns></returns>
    private Boolean AddRi()
    {

        string Enterprise = Request.Form["enterprise"];
        string Year = Request.Form["year"];
        string TechDevelopCost = Request.Form["techDevelopCost"];
        string RdInvestment = Request.Form["RdInvestment"];
        string RdOrgLevel = Request.Form["RdOrgLevel"];
        string RderNum = Request.Form["RderNum"];
        string RderSeniorNum = Request.Form["RderSeniorNum"];
        string PatentFilingNum = Request.Form["patentFilingNum"];
        string PatentLicNum = Request.Form["patentLicNum"];
        //将信息写入数据库，并返回是否成功
        string strSqlCommand = "INSERT INTO researchinvestment(enterprise,year,techDevelopCost,RdInvestment,RdOrgLevel,RderNum,RderSeniorNum,patentFilingNum,patentLicNum,Releasetime)" +
                                "VALUES(@Enterprise,@Year,@TechDevelopCost,@RdInvestment,@RdOrgLevel,@RderNum,@RderSeniorNum,@PatentFilingNum,@PatentLicNum,@Releasetime)";
        sqlOperation.AddParameterWithValue("@Enterprise", Enterprise);
        sqlOperation.AddParameterWithValue("@Year", Year);
        sqlOperation.AddParameterWithValue("@TechDevelopCost", TechDevelopCost);
        sqlOperation.AddParameterWithValue("@RdInvestment", RdInvestment);
        sqlOperation.AddParameterWithValue("@RdOrgLevel", RdOrgLevel);
        sqlOperation.AddParameterWithValue("@RderNum", RderNum);
        sqlOperation.AddParameterWithValue("@RderSeniorNum", RderSeniorNum);
        sqlOperation.AddParameterWithValue("@PatentFilingNum", PatentFilingNum);
        sqlOperation.AddParameterWithValue("@PatentLicNum", PatentLicNum);
	sqlOperation.AddParameterWithValue("@Releasetime", DateTime.Now);
        int intSuccess = sqlOperation.ExecuteNonQuery(strSqlCommand);

        return (intSuccess > 0) ? true : false;
    }
}
﻿<%@ WebHandler Language="C#" Class="designReviewRecord" %>

using System;
using System.Web;
using System.Text;
using System.Collections;
public class designReviewRecord : IHttpHandler {
  private DataLayer sqlOperation = new DataLayer("sqlStr");
    private DataLayer sqlOperation1 = new DataLayer("sqlStr");
    private DataLayer sqlOperation2 = new DataLayer("sqlStr");
    private DataLayer sqlOperation3 = new DataLayer("sqlStr");
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        try
        {
            string json = RecordPatientInformation(context);
            sqlOperation.Close();
            sqlOperation.Dispose();
            sqlOperation = null;
            sqlOperation1.Close();
            sqlOperation1.Dispose();
            sqlOperation1 = null;
            sqlOperation2.Close();
            sqlOperation2.Dispose();
            sqlOperation2 = null;
            sqlOperation3.Close();
            sqlOperation3.Dispose();
            sqlOperation3 = null;
            context.Response.Write(json);
        }
        catch (Exception ex)
        {
            MessageBox.Message(ex.Message);
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
     private string RecordPatientInformation(HttpContext context)
    {
        string savePath = "";
        string savepath1 = "";
        string savePath2 = "";
        string savepath3 = "";
        string item = context.Request.Form["item"];
        int itemitem = Convert.ToInt32(item);
        HttpFileCollection files = context.Request.Files;
        savePath = System.Web.HttpContext.Current.Server.MapPath("~/upload/DesignPDF");
        if (!System.IO.Directory.Exists(savePath))
        {
            System.IO.Directory.CreateDirectory(savePath);
        }
        savePath = savePath + "\\";
        try
        {

            System.Web.HttpPostedFile postedFile = files[itemitem*2];
            string fileName = postedFile.FileName;//完整的路径
            if (fileName == "")
            {
                savepath1 = "";
            }
            else
            {
                fileName = System.IO.Path.GetFileName(postedFile.FileName); //获取到名称
                string fileExtension = System.IO.Path.GetExtension(fileName);//文件的扩展名称
                string type = fileName.Substring(fileName.LastIndexOf(".") + 1);    //类型  
                files[itemitem * 2].SaveAs(savePath + DateTime.Now.ToString("yyyyMMdd") + fileName);
                savepath1 = "../../../upload/DesignPDF/" + DateTime.Now.ToString("yyyyMMdd") + fileName;
            }       
        }
        catch (System.Exception Ex)
        {
            context.Response.Write(Ex);
        }
        savePath2 = System.Web.HttpContext.Current.Server.MapPath("~/upload/PDF");
        if (!System.IO.Directory.Exists(savePath2))
        {
            System.IO.Directory.CreateDirectory(savePath2);
        }
        savePath2 = savePath2 + "\\";
        try
        {

            System.Web.HttpPostedFile postedFile1 = files[itemitem*2+1];
            string fileName = postedFile1.FileName;//完整的路径
            if (fileName == "")
            {
                savepath3 = "";
            }
            else
            {
                fileName = System.IO.Path.GetFileName(postedFile1.FileName); //获取到名称
                string fileExtension = System.IO.Path.GetExtension(fileName);//文件的扩展名称
                string type = fileName.Substring(fileName.LastIndexOf(".") + 1);    //类型  
                files[itemitem * 2 + 1].SaveAs(savePath2 + DateTime.Now.ToString("yyyyMMdd") + fileName);
                savepath3 = "../../../upload/PDF/" + DateTime.Now.ToString("yyyyMMdd") + fileName;
            }
        }
        catch (System.Exception Ex)
        {
            context.Response.Write(Ex);
        }

             string treatid = context.Request.Form["hidetreatID"];
            int treatID = Convert.ToInt32(treatid);
            //string userID = "1";
            string userID = context.Request.Form["userID"];
            
            string ggg = "";
            if (item != "0")
            {
                ggg = "_" + item;
            }
            int userid = Convert.ToInt32(userID);
            DateTime datetime = DateTime.Now;
            DateTime datetime1 = datetime;
            string maxnumber = "select max(ID) from review";

            string count = sqlOperation1.ExecuteScalar(maxnumber);

            int Count;
            if (count == "")
            {
                Count = 1;
            }
            else
            {
                Count = Convert.ToInt32(count) + 1;
            }
         
            
            string select1 = "select Progress from treatment where ID=@treat";
            sqlOperation.AddParameterWithValue("@treat", treatID);
            string progress = sqlOperation.ExecuteScalar(select1);
            string[] group = progress.Split(',');
            bool exists = ((IList)group).Contains("12");
            string have = "select count(*) from review where ChildDesign_ID=@ChildDesign_ID and Treatment_ID=@Treatment_ID";
            sqlOperation.AddParameterWithValue("@ChildDesign_ID", context.Request.Form["childdesign" + ggg]);
            sqlOperation.AddParameterWithValue("@Treatment_ID", treatID);
            int ishave = int.Parse(sqlOperation.ExecuteScalar(have));
            int intSuccess = 0;
            if (ishave > 0)
            {
                string delete = "update review set PlanQA=@PlanQA,Remark=@Remark,Percent=@Percent,SelectDose=@SelectDose where ChildDesign_ID=@ChildDesign_ID and Treatment_ID=@Treatment_ID";
                sqlOperation2.AddParameterWithValue("@ChildDesign_ID", context.Request.Form["childdesign" + ggg]);
                sqlOperation2.AddParameterWithValue("@Treatment_ID", treatID);
                sqlOperation2.AddParameterWithValue("@PlanQA", Convert.ToInt32(context.Request.Form["PlanQA" + ggg]));
                sqlOperation2.AddParameterWithValue("@Remark", context.Request.Form["Remark" + ggg]);
                sqlOperation2.AddParameterWithValue("@SelectDose", context.Request.Form["selectdose"]);
                sqlOperation2.AddParameterWithValue("@Percent", context.Request.Form["degree" + ggg]);
                intSuccess = sqlOperation2.ExecuteNonQuery(delete);
                if (savepath1 != "")
                {
                    string save1 = "update review set PDF1=@PDF1 where ChildDesign_ID=@ChildDesign_ID and Treatment_ID=@Treatment_ID";
                    sqlOperation2.AddParameterWithValue("@PDF1", savepath1);
                    sqlOperation2.ExecuteNonQuery(save1);
                }
                if (savepath3 != "")
                {
                    string save2 = "update review set PDF2=@PDF2 where ChildDesign_ID=@ChildDesign_ID and Treatment_ID=@Treatment_ID";
                    sqlOperation2.AddParameterWithValue("@PDF2", savepath3);
                    sqlOperation2.ExecuteNonQuery(save2);
                }
            }
            else
            {
                string strSqlCommand = "INSERT INTO review(ID,PlanQA,_User_ID,ReviewTime,Remark,PDF1,PDF2,SUM,Percent,ChildDesign_ID,Treatment_ID,SelectDose) " +
                                           "VALUES(@ID,@PlanQA,@User_ID,@ReviewTime,@Remark,@PDF1,@PDF2,@SUM,@Percent,@ChildDesign_ID,@Treatment_ID,@SelectDose)";
                sqlOperation.AddParameterWithValue("@ID", Count);
                sqlOperation.AddParameterWithValue("@PlanQA", Convert.ToInt32(context.Request.Form["PlanQA" + ggg]));
                sqlOperation.AddParameterWithValue("@Remark", context.Request.Form["Remark" + ggg]);
                sqlOperation.AddParameterWithValue("@SelectDose", context.Request.Form["selectdose"]);
                sqlOperation.AddParameterWithValue("@SUM", 1);
                sqlOperation.AddParameterWithValue("@Percent", context.Request.Form["degree" + ggg]);
                sqlOperation.AddParameterWithValue("@ChildDesign_ID", context.Request.Form["childdesign" + ggg]);
                sqlOperation.AddParameterWithValue("@ReviewTime", datetime1);
                sqlOperation.AddParameterWithValue("@User_ID", userid);
                sqlOperation.AddParameterWithValue("@PDF1", savepath1);
                sqlOperation.AddParameterWithValue("@PDF2", savepath3);
                sqlOperation.AddParameterWithValue("@Treatment_ID", treatID);
                intSuccess = sqlOperation.ExecuteNonQuery(strSqlCommand);
                string doseselect = context.Request.Form["selectdose"];
                string[] dosegroup = doseselect.Split(new char[] { '/' });
                string single="";
                string total="";
                int totalnum=0;
                if (dosegroup.Length == 2)
                {

                    single = dosegroup[0];
                    total = dosegroup[1];
                }
                if (single != "" && total != "")
                {
                    int count1 = int.Parse(single);
                    int count2 = int.Parse(total);
                    totalnum = count2 / count1;
                }
                string update111 = "update childdesign set state=3,Totalnumber=@total where ID=@childdesign_ID";
                //sqlOperation2.AddParameterWithValue("@Design_ID", Count);
                sqlOperation2.AddParameterWithValue("@childdesign_ID", context.Request.Form["childdesign" + ggg]);
                sqlOperation2.AddParameterWithValue("@total", totalnum);
                sqlOperation2.ExecuteNonQuery(update111);    
            }
            int Success = 0;
                  
            if (!exists)
            {
                string inserttreat = "update treatment set Progress=@progress where ID=@treat";
                sqlOperation2.AddParameterWithValue("@progress", progress + ",12");
                //sqlOperation2.AddParameterWithValue("@Design_ID", Count);
                sqlOperation2.AddParameterWithValue("@treat", treatID);
                Success = sqlOperation2.ExecuteNonQuery(inserttreat);              
            }
            else
            {               
                Success = 1;
            }
            if (intSuccess > 0 && Success > 0)
            {
                return "success";
            }
            else
            {
                return "failure";
            }




    }
}
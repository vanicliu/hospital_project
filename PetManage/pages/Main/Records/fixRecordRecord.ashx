﻿<%@ WebHandler Language="C#" Class="fixRecordRecord" %>

using System;
using System.Web;
using System.Text;
using System.Collections;
public class fixRecordRecord : IHttpHandler {
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

        HttpFileCollection files = HttpContext.Current.Request.Files;
        savePath = System.Web.HttpContext.Current.Server.MapPath("~/upload/FixRecord");

        if (!System.IO.Directory.Exists(savePath))
        {
            System.IO.Directory.CreateDirectory(savePath);
        }
        savePath = savePath + "\\";
        try
        {
            for (int i = 0; i < files.Count; i++)
            {
                System.Web.HttpPostedFile postedFile = files[i];
                string fileName = postedFile.FileName;//完整的路径
                fileName = System.IO.Path.GetFileName(postedFile.FileName); //获取到名称
                string fileExtension = System.IO.Path.GetExtension(fileName);//文件的扩展名称
                string type = fileName.Substring(fileName.LastIndexOf(".") + 1);    //类型  
                if (files[i].ContentLength > 0)
                {
                    files[i].SaveAs(savePath + DateTime.Now.ToString("yyyyMMdd") + fileName);
                    savepath1 = savepath1 + "," + "/RadiotherapyPlatform/upload/FixRecord/" + DateTime.Now.ToString("yyyyMMdd") + fileName;

                }
            }
        }
        catch (System.Exception Ex)
        {
            context.Response.Write(Ex);
        }

        try
        {
            string treatid = context.Request.Form["hidetreatID"];
            int treatID = Convert.ToInt32(treatid);
            string fixedid = "select Fixed_ID from treatment where treatment.ID=@treatid";
            sqlOperation1.AddParameterWithValue("@treatid", treatID);
            int FixedID = int.Parse(sqlOperation1.ExecuteScalar(fixedid));
            string userID = context.Request.Form["userID"];
            int userid = Convert.ToInt32(userID);
            DateTime datetime = DateTime.Now;
            bool state = true;
            string select1 = "select Progress from treatment where ID=@treatid";
            sqlOperation.AddParameterWithValue("@treatid", treatID);
            string progress = sqlOperation.ExecuteScalar(select1);
            string[] group = progress.Split(',');
            bool exists = ((IList)group).Contains("4");

            if (!exists)
            {

                string strSqlCommand = "UPDATE  fixed  SET place=@place,Pictures=@picture,BodyPosition=@detail,Model_ID=@modelID,HeadRest_ID=@HeadRest_ID,FixedRequirements_ID=@FixedRequirements_ID,FixedEquipment_ID=@FixedEquipment_ID,Remarks=@remarks,OperateTime=@datetime,Operate_User_ID=@userid where fixed.ID=@fixedID";
                //各参数赋予实际值
                sqlOperation.AddParameterWithValue("@fixedID", FixedID);
                sqlOperation.AddParameterWithValue("@detail", context.Request.Form["bodypost"]);
                sqlOperation.AddParameterWithValue("@place", context.Request.Form["place"]);
                sqlOperation.AddParameterWithValue("@modelID", Convert.ToInt32(context.Request.Form["modelselect"]));
                sqlOperation.AddParameterWithValue("@HeadRest_ID",context.Request.Form["Head"]);
                sqlOperation.AddParameterWithValue("@FixedRequirements_ID", Convert.ToInt32(context.Request.Form["specialrequest"]));
                sqlOperation.AddParameterWithValue("@FixedEquipment_ID", Convert.ToInt32(context.Request.Form["fixEquip"]));
                sqlOperation.AddParameterWithValue("@remarks", context.Request.Form["Remarks"]);
                sqlOperation.AddParameterWithValue("@datetime", datetime);
                sqlOperation.AddParameterWithValue("@userid", userid);
                sqlOperation.AddParameterWithValue("@picture", savepath1);
                int intSuccess = sqlOperation.ExecuteNonQuery(strSqlCommand);
                string strSqlCommand1 = "UPDATE  appointment  SET Completed=@state where Treatment_ID=@treatid and Task='体位固定'";
                sqlOperation3.AddParameterWithValue("@state", state);
                sqlOperation3.AddParameterWithValue("@treatid", treatID);
                int ss = sqlOperation3.ExecuteNonQuery(strSqlCommand1);

                string fID = "UPDATE treatment SET Progress=@fixedID where ID=@treatid";

                sqlOperation2.AddParameterWithValue("@treatid", treatID);

                sqlOperation2.AddParameterWithValue("@fixedID", progress + ",4");
                int Success = sqlOperation2.ExecuteNonQuery(fID);

                if (intSuccess > 0 && Success > 0 && ss > 0)
                {
                    return "success";
                }
                else
                {
                    return "failure";
                }
            }
            else
            {
                string strSqlCommand = "UPDATE  fixed  SET place=@place,BodyPosition=@detail,Model_ID=@modelID,HeadRest_ID=@HeadRest_ID,FixedRequirements_ID=@FixedRequirements_ID,FixedEquipment_ID=@FixedEquipment_ID,Remarks=@remarks,OperateTime=@datetime,Operate_User_ID=@userid where fixed.ID=@fixedID";
                //各参数赋予实际值
                sqlOperation.AddParameterWithValue("@fixedID", FixedID);
                sqlOperation.AddParameterWithValue("@place", context.Request.Form["place"]);
                sqlOperation.AddParameterWithValue("@detail", context.Request.Form["bodypost"]);
                sqlOperation.AddParameterWithValue("@modelID", Convert.ToInt32(context.Request.Form["modelselect"]));
                sqlOperation.AddParameterWithValue("@HeadRest_ID",context.Request.Form["Head"]);
                sqlOperation.AddParameterWithValue("@FixedRequirements_ID", Convert.ToInt32(context.Request.Form["specialrequest"]));
                sqlOperation.AddParameterWithValue("@FixedEquipment_ID", Convert.ToInt32(context.Request.Form["fixEquip"]));
                sqlOperation.AddParameterWithValue("@remarks", context.Request.Form["Remarks"]);
                sqlOperation.AddParameterWithValue("@datetime", datetime);
                sqlOperation.AddParameterWithValue("@userid", userid);              
                int intSuccess = sqlOperation.ExecuteNonQuery(strSqlCommand);
                if (intSuccess > 0)
                {
                    return "success";
                }
                else
                {
                    return "failure";
                }
            }


        }
        catch (System.Exception Ex1)
        {
            return "error";
        }

   
}
}
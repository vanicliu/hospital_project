﻿<%@ WebHandler Language="C#" Class="Addpatient" %>
/* ***********************************************************
 * FileName: Addpatient.ashx
 * Writer: xubixiao
 * create Date: --
 * ReWriter:xubixiao
 * Rewrite Date:--
 * impact :
 * 病人信息注册的后台
 * **********************************************************/
using System;
using System.Web;
 using System.Text;

public class Addpatient : IHttpHandler {
     //数据层操作类
    private DataLayer sqlOperation = new DataLayer("sqlStr");
    private DataLayer sqlOperation1 = new DataLayer("sqlStr");
    private DataLayer sqlOperation2 = new DataLayer("sqlStr");
    private DataLayer sqlOperation3 = new DataLayer("sqlStr");
    private DataLayer sqlOperation4 = new DataLayer("sqlStr");
    private DataLayer sqlOperation5 = new DataLayer("sqlStr");
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        try
        {
            string json = RecordPatientInformation(context);
            sqlOperation.Close();
            sqlOperation.Dispose();
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
        //string savePath = "";
        //string savepath1 = "";
        
        //获取基本信息
        int hospitalnumber = 0;
        if (context.Request.Form["hospitalnumber"] != "")
        {
            hospitalnumber = Convert.ToInt32(context.Request.Form["hospitalnumber"]);
        }
        //HttpFileCollection files = context.Request.Files;
        //savePath = System.Web.HttpContext.Current.Server.MapPath("~/upload/PatientPicture");
        //if (!System.IO.Directory.Exists(savePath))
        //{
        //    System.IO.Directory.CreateDirectory(savePath);
        //}
        //savePath = savePath + "\\";
        //try
        //{

        //    System.Web.HttpPostedFile postedFile = files[0];
        //    string fileName = postedFile.FileName;//完整的路径
        //    if (fileName == "")
        //    {
        //        savepath1 = "";
        //    }
        //    else
        //    {
        //        fileName = System.IO.Path.GetFileName(postedFile.FileName); //获取到名称
        //        string fileExtension = System.IO.Path.GetExtension(fileName);//文件的扩展名称
        //        string type = fileName.Substring(fileName.LastIndexOf(".") + 1);    //类型  
        //        files[0].SaveAs(savePath + DateTime.Now.ToString("yyyyMMdd") + fileName);
        //        savepath1 = "../../../upload/PatientPicture/" + DateTime.Now.ToString("yyyyMMdd") + fileName;
        //    }
        //}
        //catch (System.Exception Ex)
        //{
        //    context.Response.Write(Ex);
        //}
      
            int doctorid = Convert.ToInt32(context.Request.Form["doctor"]);
            int userID = Convert.ToInt32(context.Request.Form["userID"]);
            DateTime datetime = DateTime.Now;


            //插入数据
            string strSqlCommand = "INSERT INTO patient(IdentificationNumber,Hospital,RecordNumber,Picture,Name,Gender,Age,Birthday,Nation,Address,Contact1,Contact2,Height,RegisterDoctor,Weight,Register_User_ID,RegisterTime,SubCenterPrincipal_ID,Radiotherapy_ID,Principal_User_ID,Hospital_ID,Ishospital,Nameping) VALUES("
             + "@IdentificationNumber,@Hospital,@RecordNumber,@Picture,@Name,@Gender,@Age,@Birthday,@Nation,@Address,@Contact1,@Contact2,@Height,@doctorid,@Weight,@Register_User_ID,@RegisterTime,@SubCenterPrincipal_ID,@Radiotherapy_ID,@Principal_User_ID,@hospitalnumber,@Ishospital,@Nameping)";
            
           //各参数赋予实际值
            sqlOperation.AddParameterWithValue("@IdentificationNumber", context.Request.Form["IDcardNumber"]);
            sqlOperation.AddParameterWithValue("@Hospital", context.Request.Form["Hospital"]);
            sqlOperation.AddParameterWithValue("@RecordNumber", context.Request.Form["RecordNumber"]);
            sqlOperation.AddParameterWithValue("@Picture", context.Request.Form["pic"]);
            sqlOperation.AddParameterWithValue("@Name", context.Request.Form["userName"]);
            sqlOperation.AddParameterWithValue("@Gender", context.Request.Form["Gender"]);
            sqlOperation.AddParameterWithValue("@Birthday", context.Request.Form["Birthday"]);
            sqlOperation.AddParameterWithValue("@Age", Convert.ToInt32(DateTime.Now.Year.ToString()) - Convert.ToInt32(context.Request.Form["Birthday"].Substring(0, 4)));
            sqlOperation.AddParameterWithValue("@Nation", context.Request.Form["Nation"]);
            sqlOperation.AddParameterWithValue("@Address", context.Request.Form["Address"]);
            sqlOperation.AddParameterWithValue("@Contact1", context.Request.Form["Number1"]);
            sqlOperation.AddParameterWithValue("@Contact2", context.Request.Form["Number2"]);
            sqlOperation.AddParameterWithValue("@Height", context.Request.Form["height"]);
            sqlOperation.AddParameterWithValue("@Weight", context.Request.Form["weight"]);
            sqlOperation.AddParameterWithValue("@Radiotherapy_ID", context.Request.Form["radionumber"]);
            sqlOperation.AddParameterWithValue("@doctorid", doctorid);
            sqlOperation.AddParameterWithValue("@SubCenterPrincipal_ID", context.Request.Form["Sub"]);
            sqlOperation.AddParameterWithValue("@Principal_User_ID", 1);
            sqlOperation.AddParameterWithValue("@Register_User_ID", userID);
            sqlOperation.AddParameterWithValue("@RegisterTime", datetime);
            sqlOperation.AddParameterWithValue("@Ishospital", context.Request.Form["RecordNumber"]);
            sqlOperation.AddParameterWithValue("@Nameping", context.Request.Form["usernamepingyin"]);
            if (context.Request.Form["hospitalnumber"] != "")
            {
                sqlOperation.AddParameterWithValue("@hospitalnumber", hospitalnumber);
            }
            else
            {
                sqlOperation.AddParameterWithValue("@hospitalnumber", null);
            }
            int intSuccess = sqlOperation.ExecuteNonQuery(strSqlCommand);
           
        
           //每个病人注册成功后会先注册一条疗程信息
           string patientID = "select ID  from patient where Name=@Name and IdentificationNumber=@IdentificationNumber order by ID desc";
            sqlOperation1.AddParameterWithValue("@IdentificationNumber", context.Request.Form["IDcardNumber"]);
            sqlOperation1.AddParameterWithValue("@Name", context.Request.Form["userName"]);
            int patient = Convert.ToInt32(sqlOperation1.ExecuteScalar(patientID));
            int intSuccess2 = 0;
            if (intSuccess > 0)
            {
                if (context.Request.Form["group"] == "allItem")
                {
                    //没有分组信息
                    string treatinsert = "insert into treatment(TreatmentName,Patient_ID,Progress,State,Belongingdoctor,Treatmentdescribe) values(@ID,@PID,@progress,0,@doc,@Treatmentdescribe)";
                    sqlOperation2.AddParameterWithValue("@progress", "0");
                    sqlOperation2.AddParameterWithValue("@ID", 1);
                    sqlOperation2.AddParameterWithValue("@PID", patient);
                    sqlOperation2.AddParameterWithValue("@doc", doctorid);
                    sqlOperation2.AddParameterWithValue("@Treatmentdescribe", "疗程1");
                    intSuccess2 = sqlOperation2.ExecuteNonQuery(treatinsert);
                }
                else
                {
                    //有分组信息
                    string treatinsert = "insert into treatment(TreatmentName,Patient_ID,Progress,State,Group_ID,Belongingdoctor,Treatmentdescribe) values(@ID,@PID,@progress,0,@group,@doc,@Treatmentdescribe)";
                    sqlOperation2.AddParameterWithValue("@progress", "0");
                    sqlOperation2.AddParameterWithValue("@group", Convert.ToInt32(context.Request.Form["group"]));
                    sqlOperation2.AddParameterWithValue("@ID", 1);
                    sqlOperation2.AddParameterWithValue("@PID", patient);
                    sqlOperation2.AddParameterWithValue("@doc", doctorid);
                    sqlOperation2.AddParameterWithValue("@Treatmentdescribe", "疗程1");
                    intSuccess2 = sqlOperation2.ExecuteNonQuery(treatinsert);

                }

            }
            if (intSuccess2 > 0)
            {
                return "success";
            }
            else
            {
                return "failure";
            }
        }

    }

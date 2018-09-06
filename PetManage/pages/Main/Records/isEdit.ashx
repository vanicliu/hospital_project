<%@ WebHandler Language="C#" Class="isEdit" %>

using System;
using System.Web;
using System.Xml;
using System.Text;

public class isEdit : IHttpHandler {
     private DataLayer sqlOperation1 = new DataLayer("sqlStr");
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(GetEditInfo(context));
        sqlOperation1.Close();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
    
    public String GetEditInfo(HttpContext context)
    {
        string patientid = context.Request["patientid"];
        DrAdv.Service1 patiservice = new DrAdv.Service1();
        string patistring = "";
        XmlDocument xmldoc = new XmlDocument();


        string sqlId = "select DrAdvIdHos,DrAdvId,DrAdvSource from patient where ID=@patientid";
        sqlOperation1.AddParameterWithValue("@patientid", patientid);
        MySql.Data.MySqlClient.MySqlDataReader readerIsedit = sqlOperation1.ExecuteReader(sqlId);
        if (!readerIsedit.HasRows)
        {
            readerIsedit.Close();
            return "nofind";
        }
        string DrAdvIdHos="";
        string DrAdvId="";
        string DrAdvSource="";
        while (readerIsedit.Read())
        {
            DrAdvIdHos = readerIsedit["DrAdvIdHos"].ToString();
            DrAdvId = readerIsedit["DrAdvId"].ToString();
            DrAdvSource = readerIsedit["DrAdvSource"].ToString();
        }
        readerIsedit.Close();
        if (DrAdvSource == "门诊")
        {
            patistring = patiservice.Patiinfobasic(DrAdvId, "0");
             xmldoc.LoadXml(patistring);
             XmlNode ordstatus = xmldoc.SelectSingleNode("/xml/items/item/ORDSTATUSID");
            XmlNode endempid = xmldoc.SelectSingleNode("/xml/items/item/ENDEMPID");
            if (ordstatus == null || endempid == null)
            {
                return "HISerror";
            }
            if((ordstatus.InnerText=="0"||ordstatus.InnerText=="8")&&endempid.InnerText=="")
            {
                return "true";
            }
            else
            {
                return "false";
            }
        }
        else if (DrAdvSource == "住院")
        {
            patistring = patiservice.Patiinfobasic(DrAdvIdHos, "1");
            xmldoc.LoadXml(patistring);
            XmlNode ordstatus = xmldoc.SelectSingleNode("/xml/items/item/ORDSTATUSID");
            XmlNode endempid = xmldoc.SelectSingleNode("/xml/items/item/ENDEMPID");
            if (ordstatus == null || endempid == null)
            {
                return "HISerror";
            }
            if ((ordstatus.InnerText == "0") && endempid.InnerText == "")
            {
                return "true";
            }
            else
            {
                return "false";
            }

        }
        else {
            return "empty";
        }
       
        
        
   
    
        
        
    }

}



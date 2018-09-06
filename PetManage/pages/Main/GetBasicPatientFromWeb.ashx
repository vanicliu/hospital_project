<%@ WebHandler Language="C#" Class="GetBasicPatientFromWeb" %>

using System;
using System.Web;
using System.Xml;
using System.Text;

public class GetBasicPatientFromWeb : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write(GetBasicInfo(context));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }
    public String GetBasicInfo(HttpContext context)
    {
        string card = context.Request["info"];
        //string xmlstring = "<?xml version=\"1.0\" encoding=\"utf-8\"?><NewDataSet><Table><PATINAME>张俊东</PATINAME><SEXID>1</SEXID><BIRTHDATE>2008-10-7</BIRTHDATE><TELENUM>183252316621</TELENUM><FAMILYADDR>溧阳市赖江花园1区4栋3号门</FAMILYADDR></Table></NewDataSet>";
        //string xmlstring2 = "<?xml version=\"1.0\" encoding=\"utf-8\"?><NewDataSet><Table><NATIONALITYNAME>汉族</NATIONALITYNAME><CONTACTORTELENUM>18372328322</CONTACTORTELENUM><NATIVEPLACENAME>江苏省常州市溧阳市</NATIVEPLACENAME></Table></NewDataSet>";  
        //string xmlstring3 = "<?xml version="1.0\" encoding=\"UTF-8\"?><string xmlns=\"http://tempuri.org/\">0005200540,张三,女,321322198809210261,汉族,1980/8/21 0:00:00,江宁区,15250506060,15250506060,122207</string>";
        HIS.Service1 service = new HIS.Service1();
        string xmlstring = service.Patiinfobasic(card);
        string xmlstring2 = service.Patiinfobasic(card);
        //string[] split = { "," };
        string[] s = xmlstring.Split(',');
        String name = s[1];
        if(name=="不详"||name=="-")
        {
            name="";
        }
        String sex = s[2];
        String sexid = "1";
        if (sex == "不详" || sex == "-")
        {
            sexid="";
        }
        if (sex == "女")
        {
            sexid="0";
        }
        String idcard = s[3];
        if (idcard == "不详" || idcard == "-")
        {
            idcard = "";
        }
        String nation = s[4];
        if (nation == "不详" || nation == "-")
        {
            nation="";
        }
        String birthdate = s[5];
        if (birthdate == "不详" || birthdate == "-")
        {
            birthdate="";
        }
        String address = s[6];
        if (address == "不详" || address == "-")
        {
            address="";
        }
        String telenumber = s[7];
        if (telenumber == "不详" || telenumber == "-")
        {
            telenumber="";
        }
        String telenumber2 = s[8];
        if (telenumber2 == "不详" || telenumber2 == "-")
        {
            telenumber2 = "";
        }
        String hospital = s[9];

        StringBuilder backText = new StringBuilder("{\"Item\":");
        backText.Append("{\"name\":\"" + name + "\",\"sexid\":\"" + sexid + "\",\"idcard\":\"" + idcard + "\",\"nation\":\"" + nation + "\",\"birthdate\":\"" + birthdate + "\",\"simpleaddress\":\"" + address  + "\",\"telenumber\":\"" + telenumber + "\",\"telenumber2\":\"" + telenumber2 + "\",\"hospital\":\"" + hospital + "\"}");
        backText.Append("}");

        return backText.ToString();




    }

}
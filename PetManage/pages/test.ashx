<%@ WebHandler Language="C#" Class="test" %>

using System;
using System.Web;
using System.Xml;
using System.Text;

public class test : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
        context.Response.Write("Hello World");
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
        HIS.Service1 service = new HIS.Service1();
        string xmlstring = service.Patiinfobasic("0005200542");
        string xmlstring2 = service.Patiinfobasic(card);
        XmlDocument xmldoc = new XmlDocument();
        xmldoc.LoadXml(xmlstring);
        Console.WriteLine(xmldoc);
        return xmldoc.ToString();
    }
}
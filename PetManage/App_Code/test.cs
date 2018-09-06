using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;
using System.Text;

/// <summary>
/// test 的摘要说明
/// </summary>
public class test
{
    public test()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
        HIS.Service1 service = new HIS.Service1();
        string xmlstring = service.Patiinfobasic("0005200542");
        //string xmlstring2 = service.Patiinfobasic(card);
        XmlDocument xmldoc = new XmlDocument();
        xmldoc.LoadXml(xmlstring);
        Console.WriteLine(xmldoc);
    }
}
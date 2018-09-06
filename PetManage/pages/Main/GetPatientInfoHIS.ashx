<%@ WebHandler Language="C#" Class="GetPatientInfoHIS" %>

using System;
using System.Web;
using System.Xml;
using System.Text;
using System.Collections.Generic;

public class GetPatientInfoHIS : IHttpHandler {

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
        string source = context.Request["source"];
        //string xmlstring = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><string xmlns=\"http://tempuri.org/\"><xml><items><item><CARDNO>0003828336</CARDNO><PATIID>170826140133004155</PATIID><INPATIID>223715</INPATIID><PATINAME>吴继平</PATINAME><IDCARD>320723194707032635</IDCARD><NATIONALITYNAME>汉族</NATIONALITYNAME><BIRTHDATE>1947/7/3 0:00:00</BIRTHDATE><BLOODTYPE>AB+</BLOODTYPE><SEX>男</SEX><FAMILYADDRESS>灌云县鲁河乡后腰村颜刘庄27号</FAMILYADDRESS><MOBILENUM>-</MOBILENUM><TELENUM>15861268706</TELENUM><DEPT>二院血液科II病区</DEPT><ORDSTATUSID>0</ORDSTATUSID><BEDNO>32床</BEDNO><ORDID>1806210004130E02326944</ORDID><ORDDES /><SERIALNUMBER>0101E02322018062100001</SERIALNUMBER><DIAG /><DIAGORGID>010801010104</DIAGORGID><PATIPAYTYPEID>01000B</PATIPAYTYPEID><CODENAME>新异地医保</CODENAME><STOPCAUSEID /><ENDEMPID /><ENDDATE>3000/1/1 0:00:00</ENDDATE><ORDDATE>2018/6/21 0:04:13</ORDDATE><EMPID_INPUT>E0232</EMPID_INPUT><EMPNAME>王朝阳</EMPNAME></item></items></xml></string>";
        DrAdv.Service1 service = new DrAdv.Service1();
        string xmlstring = service.Patiinfobasic(card, source);
        /*非法xml格式重新拼接
        string[] array = xmlstring.Split('>');
        int i = array.Length;
        for (int j = 0; j < i; j++)
        {
            array[j] = array[j] + '>';
        }
        Console.WriteLine(array);
        List<string> list = new List<string>(array);
        list.RemoveAt(1);
        list.RemoveAt(i - 2);
        String xmlStr = "";
        for (int n = 0; n < list.Count - 1; n++)
        {
            xmlStr = xmlStr + list[n];
        }*/
        XmlDocument xmldoc = new XmlDocument();
        xmldoc.LoadXml(xmlstring);
        //xmldoc.LoadXml(xmlstring);
        XmlNode username = xmldoc.SelectSingleNode("/xml/items/item/PATINAME");
        String name = username.InnerText;
        if(name=="不详"||name=="-")
        {
            name="";
        }
        XmlNode xsex = xmldoc.SelectSingleNode("/xml/items/item/SEX");
        String sex = xsex.InnerText;
        String sexid = "1";
        if (sex == "不详" || sex == "-")
        {
            sexid="";
        }
        if (sex == "女")
        {
            sexid="0";
        }
        XmlNode xnewCardId = xmldoc.SelectSingleNode("/xml/items/item/CARDNO");
        //就诊卡号
        String newCardId = xnewCardId.InnerText;
        //身份证号码
        XmlNode xidcard = xmldoc.SelectSingleNode("/xml/items/item/IDCARD");
        String idcard = xidcard.InnerText;
        if (idcard == "不详" || idcard == "-")
        {
            idcard = "";
        }
        XmlNode xnation = xmldoc.SelectSingleNode("/xml/items/item/NATIONALITYNAME");
        String nation = xnation.InnerText;
        if (nation == "不详" || nation == "-")
        {
            nation="";
        }
        XmlNode xbirthdate = xmldoc.SelectSingleNode("/xml/items/item/BIRTHDATE");
        String birthdate = xbirthdate.InnerText;
        char[] bir = birthdate.ToCharArray();
        if (bir[6] == '/')
        {
            birthdate = birthdate.Substring(0, 9);
        }
        else {
            birthdate = birthdate.Substring(0, 10);
        }
        if (birthdate == "不详" || birthdate == "-")
        {
            birthdate="";
        }
        XmlNode xaddress = xmldoc.SelectSingleNode("/xml/items/item/FAMILYADDRESS");
        String address = xaddress.InnerText;
        if (address == "不详" || address == "-")
        {
            address="";
        }
        XmlNode xtelenumber = xmldoc.SelectSingleNode("/xml/items/item/TELENUM");
        String telenumber = xtelenumber.InnerText;
        if (telenumber == "不详" || telenumber == "-")
        {
            telenumber="";
        }
        XmlNode xtelenumber2 = xmldoc.SelectSingleNode("/xml/items/item/MOBILENUM");
        String telenumber2 = xtelenumber2.InnerText;
        if (telenumber2 == "不详" || telenumber2 == "-")
        {
            telenumber2 = "";
        }
        XmlNode xhospital = xmldoc.SelectSingleNode("/xml/items/item/INPATIID");
        //住院号
        String hospital = xhospital.InnerText;
        String DrAdvSource = "";
        if(source == "0")
        {
            DrAdvSource = "门诊";
        }else if(source == "1")
        {
            DrAdvSource = "住院";
        }
        String DrAdvName = DrAdvSource;
        XmlNode xPatientIdentify = xmldoc.SelectSingleNode("/xml/items/item/CODENAME");
        //患者身份
        String PatientIdentify = xPatientIdentify.InnerText;
        XmlNode xDepartment = xmldoc.SelectSingleNode("/xml/items/item/DIAGORGID");
        //就诊科室
        String Department = xDepartment.InnerText;
        XmlNode xWard = xmldoc.SelectSingleNode("/xml/items/item/DEPT");
        //就诊病区
        String Ward = xWard.InnerText;
        XmlNode xBed = xmldoc.SelectSingleNode("/xml/items/item/BEDNO");
        //床位
        String Bed = xBed.InnerText;
        XmlNode xApplyDoctor = xmldoc.SelectSingleNode("/xml/items/item/EMPNAME");
        //申请医生
        String ApplyDoctor = xApplyDoctor.InnerText;
        XmlNode xDiag = xmldoc.SelectSingleNode("/xml/items/item/DIAG");
        //诊断
        String Diag = xDiag.InnerText;
        XmlNode xorddate = xmldoc.SelectSingleNode("/xml/items/item/ORDDATE");
        //医嘱开立时间
        String orddate = xorddate.InnerText;
        StringBuilder backText = new StringBuilder("{\"Item\":");
        backText.Append("{\"name\":\"" + name + "\",\"newCardId\":\"" + newCardId +"\",\"sexid\":\"" + sexid + "\",\"idcard\":\"" + idcard + "\",\"nation\":\"" + nation + "\",\"birthdate\":\"" + birthdate + "\",\"simpleaddress\":\"" + address  + "\",\"telenumber\":\"" + telenumber + "\",\"telenumber2\":\"" + telenumber2 + "\",\"hospital\":\"" + hospital + "\",\"DrAdvName\":\"" + DrAdvName + "\",\"DrAdvSource\":\"" + DrAdvSource + "\",\"PatientIdentify\":\"" + PatientIdentify + "\",\"Department\":\"" + Department + "\",\"Ward\":\"" + Ward + "\",\"Bed\":\"" + Bed + "\",\"ApplyDoctor\":\"" + ApplyDoctor + "\",\"Diag\":\"" + Diag + "\",\"orddate\":\"" + orddate + "\"}");
        backText.Append("}");

        return backText.ToString();




    }

}
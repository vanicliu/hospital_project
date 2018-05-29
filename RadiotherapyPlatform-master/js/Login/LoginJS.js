﻿var isAllGood;
var xmlHttp;

window.addEventListener("load", InitAll, false);
window.onkeydown = function (evt) {
    var ketnum;
    if (window.event) // IE
    {
        keynum = evt.keyCode
    }
    else if (e.which) // Netscape/Firefox/Opera
    {
        keynum = evt.which
    }
    if (keynum == 13) {
        if (document.getElementById("loginDiv").style.display == "none")
            TransferMain();
        else
            checkAll();
    }
        
};

function InitAll() {
    document.getElementById("login").addEventListener("click", checkAll, false);//点击登陆进行是否填写验证
    document.getElementById("registration").addEventListener("click", TransferRegedit, false);//转到注册界面
    document.getElementById("login2").addEventListener("click", TransferMain, false);//多角色登陆
    //readUserIDCookie();//读取cookie的用户名
    if (readUserIDCookie()) {//读取cookie的用户密码
        document.getElementById("saveUserKey").checked = true;
    } else {
        document.getElementById("saveUserKey").checked = false;
    }
}

function checkAll() {
    isAllGood = true;
    document.getElementById("error").innerHTML = "";//提示字段初始置空
    document.getElementById("error").style.display = "none";
    var allElements = document.forms[0].getElementsByTagName('*');//所有元素
    for (var i = 0; i < allElements.length; i++) {
        if (!checkEmpty(allElements[i])) {
            isAllGood = false;
        }
    }
    //所有信息填写后保存用户名到cookie
    if (isAllGood == true) {
        //setUserIDCookie();
        if (document.getElementById("saveUserKey").checked == true) {
            // setUserKeyCookie();
            setUserIDCookie();
        } else {
            DeleteCookie("userID");
        }
    }
    if (isAllGood) {
        postInformation();//全部填写则ajax发送数据到一般处理程序
    }
}

function checkEmpty(thisElement) {
    var strOutClassName = "";
    var thisClassName = thisElement.className.split(" ");
    for (var i = 0; i < thisClassName.length; i++) {
        strOutClassName += CheckClassName(thisClassName[i], thisElement) + " ";
    }

    thisElement.className = strOutClassName;

    if (strOutClassName.indexOf("invalid") > -1) {
        if (thisElement.nodeName == "INPUT") {
            thisElement.select();
            if (thisElement.className.indexOf("userName") > -1) {
                document.getElementById("error").innerHTML = "用户名不能为空";
            }
            if (thisElement.className.indexOf("userKey") > -1) {
                document.getElementById("error").innerHTML = "密码不能为空";
            }
        }
        document.getElementById("error").style.display = "block";
        return false;
    }
    return true;
}

function CheckClassName(thisClassName, thisElement) {
    var strReturnClassName = "";
    switch (thisClassName) {
        case "":
            break;
        case "invalid":
            break;
        case "isEmpty":
            if (isAllGood && thisElement.value == "") {
                strReturnClassName += "invalid ";
            }
            strReturnClassName += thisClassName;
            break;
        default:
            strReturnClassName += thisClassName;
            break;
    }
    return strReturnClassName;
}

function TransferRegedit() {
    window.location.href = "Register.aspx";
}

function postInformation() {
    xmlHttp = new XMLHttpRequest();
    var userName = document.getElementById("userNumber").value;
    var userpsw = document.getElementById("userKey").value;
    var url = "../../pages/Login/LoginInformation.ashx?userNumber=" + userName + "&userKey=" + userpsw;
    xmlHttp.open("GET", url, false);
    xmlHttp.onreadystatechange = getInformation;
    xmlHttp.send();
}

function getInformation() {
    if (xmlHttp.readyState == 4) {//正常响应
        if (xmlHttp.status == 200) {//正确接受响应数据
            if ("{\"userRole\":[" == xmlHttp.responseText) {
                alert("该用户没有角色,请找管理员");
                return false;
            }
            obj = eval("(" + xmlHttp.responseText + ")");
            if (obj != null) {
                if (obj.userRole[0].Name.substring(0, 5) == "false") {
                    switch (obj.userRole[0].Name.substring(6)) {
                        case "notexist":
                            alert("账号不存在");
                            isAllGood = false;
                            return false;
                        case "notactivate":
                            alert("账号未激活，请找管理员");
                            isAllGood = false;
                            return false;
                        case "errorKey":
                            alert("密码错误");
                            document.getElementById("userKey").select();
                            isAllGood = false;
                            return false;
                    }
                } else {
                    postToCs();//！！！！！！一般处理程序返回后台验证成功则向cs文件发送数据进行session记录
                    if (obj.userRole.length == 1 && obj.userRole.Type == "Root") {
                        setSessionRole(obj.userRole[0].Name, obj.userRole[0].Type);
                        window.location.replace("../../pages/Root/RootMain.aspx");
                        return;
                    } else if (obj.userRole.length == 1 && obj.userRole.Type != "Root") {
                        setSessionRole(obj.userRole[0].Name, obj.userRole[0].Type);
                        window.location.replace("../../pages/Main/Main.aspx");
                    } else {
                        createSelect(obj.userRole);
                        document.getElementById("loginDiv").style.display = "none";
                        document.getElementById("chooseRole").style.display = "block";
                    }
                }
            }
        }
    }
}

function createSelect(userRole) {
    var sel = document.getElementById("userRole");
    sel.options.length = 0;
    for (var i = 0; i < userRole.length; i++) {
        sel.options[i] = new Option(userRole[i].Name);
        sel.options[i].value = userRole[i].Type;
    }
}

function TransferMain() {
    var sel = document.getElementById("userRole");
    var index = sel.selectedIndex;
    var url = sel.options[index].value;
    var name = sel.options[index].innerHTML;
    setSessionRole(name, url);
    if (url == "Root") {
        window.location.replace("../../pages/Root/RootMain.aspx?role" + name);
    } else {
        window.location.replace("../../pages/Main/Main.aspx");
    }
}

function setSessionRole(name, des) {
    xmlHttp = new XMLHttpRequest();
    var url = "handlerSetRole.ashx?role=" + name + "&des=" + des;
    xmlHttp.open("GET", url, false);
    xmlHttp.send();
}

function postToCs() {
    xmlHttp = new XMLHttpRequest();
    var userName = document.getElementById("userNumber").value;
    var url = "Login.aspx?userID=" + userName + "&ispostback=true";
    xmlHttp.open("GET", url, false);
    xmlHttp.onreadystatechange = function () { };
    xmlHttp.send();
}

function readUserIDCookie() {
    if (document.cookie != "") {
        var strUserID = CookieValue("userID");
        if (strUserID != 0) {
            document.getElementById("userNumber").value = strUserID;
            return true;
        }
    }
}

//function readUserKeyCookie() {
//    if (document.cookie != "") {
//        var thisCookie = document.cookie.split("; ");
//        for (var i = 0; i < thisCookie.length; i++) {
//            if ("userKey" == thisCookie[i].split("=")[0]) {
//                document.getElementById("userKey").value = thisCookie[i].split("=")[1];
//                return true;
//            }
//        }
//    }
//    return false;
//}

function setUserIDCookie() {
    var expireDate = new Date();
    expireDate.setMonth(expireDate.getMonth() + 10);
    var strUserID = document.getElementById("userNumber").value;
    document.cookie = "userID=" + strUserID + ";expires" + expireDate.toGMTString();
}

//function setUserKeyCookie() {
//    var expireDate = new Date();
//    expireDate.setMonth(expireDate.getMonth() + 10);
//    var strUserKey = document.getElementById("userKey").value;
//    document.cookie = "userKey=" + strUserKey + ";expires" + expireDate.toGMTString();
//}

function CookieValue(cookieName) {
    var thisCookie = document.cookie.split("; ");
    for (var i = 0; i < thisCookie.length; i++) {
        if (thisCookie[i].split("=")[0] == cookieName) {
            return thisCookie[i].split("=")[1];
        }
    }
    return 0;
}

function DeleteCookie(cookieName) {
    var thisCookie = document.cookie.split("; ");
    var expireData = new Date();
    expireData.setDate(expireData.getDate() - 1);

    document.cookie = cookieName + "=;expires=" + expireData.toGMTString();

}
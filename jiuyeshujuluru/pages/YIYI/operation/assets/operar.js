window.addEventListener("load", InitAll, false);

var listdom = [];

function InitAll() {

    document.getElementById("sel").addEventListener("click", sel, false);//查询
    document.getElementById("select1").addEventListener("change", getyear, false);//自查询
    document.getElementById("clear").addEventListener("click", cle, false);
    $.ajax({
        url: "operationMange.aspx/AjaxMethod",//发送到本页面后台AjaxMethod方法
        type: "POST",
        dataType: "json",
        async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
        contentType: "application/json; charset=utf-8",//不可少
        data:"",
        success: function (data) {
            var jsonData = JSON.parse(data.d); //jsonData是该下路下的所有区间（json格式）
            if (jsonData.olist[0] != "error") {
                for (var i = 0; i < jsonData.olist.length; i++) {
                    $("#select1").append("<option value='" + jsonData.olist[i] + "'>" + jsonData.olist[i] + "</option>");
                }
            }

            else
                alert("产生未知错误！");
        },
        error: function () {
            alert("请求出错处理");
        }
    })
}


function getyear() {
    var sltCompany = document.getElementById("select1").value;
    $("#select2").empty();
    
    $.ajax({
        url: "operationMange.aspx/AjaxMethod2",//发送到本页面后台AjaxMethod方法
        type: "POST",
        dataType: "json",
        async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
        contentType: "application/json; charset=utf-8",//不可少
        data: "{sltCompany:'" + sltCompany + "'}",
        success: function (data) {
            var jsonData = JSON.parse(data.d); //jsonData是该下路下的所有区间（json格式）
            if (jsonData.olist[0] != "error") {
                for (var i = 0; i < jsonData.olist.length; i++) {
                    $("#select2").append("<option value='" + jsonData.olist[i] + "'>" + jsonData.olist[i] + "</option>");
                }
            }

            else
                alert("产生未知错误！");
        },
        error: function () {
            alert("请求出错处理");
        }
    })


}


function sel() {
    var company = document.getElementById("select1").value;
    var year = document.getElementById("select2").value;
    var update = document.getElementById("update");
    var clear = document.getElementById("clear");
    var $inputArr = $('#oper input');
    listdom.splice(0, listdom.length);//清空数组

    $.ajax({
        url: "operationMange.aspx/AjaxMethod1",//发送到本页面后台AjaxMethod方法
        type: "POST",
        dataType: "json",
        async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
        contentType: "application/json; charset=utf-8",//不可少
        data: "{company:'" + company + "',year:'" + year + "'}",
        success: function (data) {
            var jsonData = JSON.parse(data.d); //jsonData是该下路下的所有区间（json格式）
            if (jsonData.olist[0] != "error") {
                var i = 0;
                $inputArr.each(function () {
                    //4.将每个input的值放进结果集
                    listdom.push(jsonData.olist[i]);
                    $(this).val(jsonData.olist[i++]);
                    
                });
                update.onclick = upd;
            }

            else
                alert("产生未知错误！");
        },
        error: function () {
            alert("请求出错处理");
        }
    })


}

function upd() {
    var con = confirm("请确认是否更新数据!")
    if (con == false) { return;}
    var listnow = [];
    var a, b;
    var $inputArr = $('#oper input');
    $inputArr.each(function () {
        //4.将每个input的值放进结果集
        listnow.push($(this).val());
    });
    a=listnow[0];
    b=listnow[1];
    if (a.replace(/(^\s*)|(\s*$)/g, "") == "" || b.replace(/(^\s*)|(\s*$)/g, "") == "")
    {
        alert("企业名称与年份不可为空");
        return;
    }
    $.ajax({
        url: "operationMange.aspx/AjaxMethod3",//发送到本页面后台AjaxMethod方法
        type: "POST",
        dataType: "json",
        async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
        contentType: "application/json; charset=utf-8",//不可少
        data: JSON.stringify({ olist: listnow ,companydom: listdom[0] , yeardom: listdom[1]}),
        success: function (data) {
            if (data.d == "1") {
                alert("数据更新成功！");
                location.reload();
            }
            else if (data.d == "0") {
                alert("该企业该月份数据已存在，请勿重复插入！！");
            }
            else {
                alert("数据库发生错误！");
            }
        },
        error: function () {
            alert("请求出错处理");
        }
    })

}


function cle() {
    var con = confirm("请确认是否删除数据!")
    if (con == false) { return;}
    var company = document.getElementById("select1").value;
    var year = document.getElementById("select2").value;

    $.ajax({
        url: "operationMange.aspx/AjaxMethod4",//发送到本页面后台AjaxMethod方法
        type: "POST",
        dataType: "json",
        async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
        contentType: "application/json; charset=utf-8",//不可少
        data: "{company:'" + company + "',year:'" + year + "'}",
        success: function (data) {
            if (data.d == "2") {
                alert("数据删除成功！");
                location.reload();
            }
            else if (data.d == "0") {
                alert("未发现相关数据");
            }
            else {
                alert("数据库发生错误！");
            }
        },
        error: function () {
            alert("请求出错处理");
        }
    })
}

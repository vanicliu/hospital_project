window.addEventListener("load", InitAllse, false);

function InitAllse() {

    document.getElementById("subs").addEventListener("click", postInformationse, false);//点击登陆进行是否填写验证
	
	 $.ajax({
        url: "area.aspx/AjaxMethod1",//发送到本页面后台AjaxMethod方法
        type: "POST",
        dataType: "json",
        async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
        contentType: "application/json; charset=utf-8",//不可少
        data: "",
        success: function (data) {
            var jsonData = JSON.parse(data.d); //jsonData是该下路下的所有区间（json格式）
            if (jsonData.olist[0] != "error") {
                for (var i = 0; i < jsonData.olist.length; i++) {
                    $("#coId").append("<option value='" + jsonData.olist[i] + "'>" + jsonData.olist[i] + "</option>");
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


function postInformationse() {
    var $inputArr = $('#oper input');
    var result = [];
    $inputArr.each(function () {
        //4.将每个input的值放进结果集
        result.push($(this).val());
    });

    var _listse = [];

    for (var i = 0; i < result.length; i++) {
        _listse[i] = result[i];
    }
	
	  a = _listse[0];
    b = _listse[1];
    c = _listse[2];
    if (a.replace(/(^\s*)|(\s*$)/g, "") == "" || b.replace(/(^\s*)|(\s*$)/g, "") == "" || c.replace(/(^\s*)|(\s*$)/g, "") == "") {
        alert("企业名称、年份与行业不可为空");
        return;
    }

    $.ajax({
        url: "sector.aspx/AjaxMethodse",//发送到本页面后台AjaxMethod方法
        type: "POST",
        dataType: "json",
        async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
        contentType: "application/json; charset=utf-8",//不可少
        data: JSON.stringify({ olistse: _listse }),
        success: function (data) {
            if (data.d == "1") {
                alert("数据插入成功！");
                location.reload();
            }
            else
                alert("数据已插入，请勿重复插入！");
        },
        error: function () {
            alert("请求出错处理");
        }
    })


}
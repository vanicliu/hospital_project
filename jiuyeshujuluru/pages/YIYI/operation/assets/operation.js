window.addEventListener("load", InitAll, false);

function InitAll() {

    document.getElementById("subm").addEventListener("click", postInformation, false);//点击登陆进行是否填写验证
}


function postInformation() {

    var $inputArr = $('#oper input');
    var result = [];
    $inputArr.each(function () {
        //4.将每个input的值放进结果集
        result.push($(this).val());
    });

    var _list = [];

    for (var i = 0; i < result.length; i++) {
        _list[i] = result[i];
    }
	
	a = _list[0];
    b = _list[1];

    if (a.replace(/(^\s*)|(\s*$)/g, "") == "" || b.replace(/(^\s*)|(\s*$)/g, "") == "" ) {
        alert("企业名称、年份不可为空");
        return;
    }


    $.ajax({
        url: "operation.aspx/AjaxMethod",//发送到本页面后台AjaxMethod方法
        type: "POST",
        dataType: "json",
        async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
        contentType: "application/json; charset=utf-8",//不可少
        data: JSON.stringify({ olist: _list }),
        success: function (data) {
            if (data.d == "1") {
                alert("数据插入成功！");
                location.reload();
            }
            else
                alert("数据已录入,请勿重复输入!");
        },
        error: function () {
            alert("请求出错处理");
        }
    })


}
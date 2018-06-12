window.addEventListener("load", InitAll2, false);

function InitAll2() {
    document.getElementById("subpsw").addEventListener("click", changePSW, false);//修改密码
}

function changePSW() {
   
    var psw0 = document.getElementById("mpass").value;
    var psw1 = document.getElementById("newpsw1").value;
    var psw2 = document.getElementById("newpsw2").value;
    if (psw1.length < 5 || psw2.length < 5 || psw1 != psw2)
        return;
    $.ajax({
        url: "pass.aspx/AjaxMethodck",//发送到本页面后台AjaxMethod方法
        type: "POST",
        dataType: "json",
        async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
        contentType: "application/json; charset=utf-8",//不可少
        data: "{admin:'admin',psw0:'" + psw0 + "',psw1:" + psw1 + "}",
        success: function (data) {
            if (data.d == "1") {
                alert("密码修改成功！");
                location.reload();
            }
            else if (data.d == "0")
                alert("原密码不正确，密码修改失败！");
            else
                alert("发生未知错误！");
        },
        error: function () {
            alert("请求出错处理");
        }
    })
}
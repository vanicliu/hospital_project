window.addEventListener("load", InitAll, false);
function InitAll() {
    document.getElementById("login").addEventListener("click", postInformation, false);//点击登陆进行是否填写验证
  
}


    function postInformation() {
        var userName = document.getElementById("adminId").value;

        var userpsw = document.getElementById("adminKey").value;

        $.ajax({
            url: "login.aspx/AjaxMethod",//发送到本页面后台AjaxMethod方法
            type: "POST",
            dataType: "json", 
            async: true,//async翻译为异步的，false表示同步，会等待执行完成，true为异步
            contentType: "application/json; charset=utf-8",//不可少
            data: "{admin:'" + userName + "',password:'" + userpsw + "'}",
            success: function (data) {
                if (data.d == "1")
                    window.location.href="../../pages/history.aspx";
                else
                    alert("您输入的账号或密码不正确，请重新输入！");
            },
            error: function () {
                alert("请求出错处理");
            }
        })


    }

   
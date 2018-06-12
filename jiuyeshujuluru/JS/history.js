/*企业历史录入界面*/
//window.addEventListener("load", init, false);
//function init() {
//    document.getElementById("subm").addEventListener("click", postInformation, false);
//}
//function postInformation() {
//    var $inputArr = $('#history input');
//    var result = [];
//    $inputArr.each(function () {
//        //4.将每个input的值放进结果集
//        result.push($(this).val());
//    });

//    var _list = [];

//    for (var i = 0; i < result.length; i++) {
//        _list[i] = result[i];
//    }
//    $.ajax({
//        type: "POST",
//        url:" history.aspx/AjaxMethod",
//        dateType: "json",
//        async: true,
//        contentType: "application/json; charset=utf-8",
//        data: JSON.stringify({ olist: _list }),
//        success: function (data) {
//            if (data == "1") {
//                alert("录入成功");
//                window.location.reload();
//            }
//            else {
//                alert("录入失败，请重试！");
//            }
//        },
//        error: function () {
//            alert("请求出错处理");
//        }
//    });
//}
window.addEventListener("load", checkControl, false);
function checkControl() {
    document.getElementById("postHistory").value = "false";
    document.getElementById("historyForm").addEventListener("submit", checkForm, false);
    document.getElementById("postHistory").value = false;
}
function Refresh(evt) {
    evt.preventDefault();
    window.location = 'history.aspx';
}
function checkForm() {
   
    document.getElementById("postHistory").value = true;
}
function addDiv1() {
    var add2 = document.getElementById("add2");
    add2.style.display = "";
    var addbutton1 = document.getElementById("addbutton1");
    addbutton1.style.display = "none";
    var delbutton1 = document.getElementById("delbutton1");
    delbutton1.style.display = "";
}
function delDiv1() {
    var add2 = document.getElementById("add2");
    add2.style.display = "none";
    var addbutton1 = document.getElementById("addbutton1");
    addbutton1.style.display = "";
    var delbutton1 = document.getElementById("delbutton1");
    delbutton1.style.display = "none";
}
function addDiv2() {
    var add3 = document.getElementById("add3");
    add3.style.display = "";
    var addbutton2 = document.getElementById("addbutton2");
    addbutton2.style.display = "none";
    var delbutton2 = document.getElementById("delbutton2");
    delbutton2.style.display = "";
}
function delDiv2() {
    var add3 = document.getElementById("add3");
    add3.style.display = "none";
    var addbutton2 = document.getElementById("addbutton2");
    addbutton2.style.display = "";
    var delbutton2 = document.getElementById("delbutton2");
    delbutton2.style.display = "none";
}
function addDiv3() {
    var addbutton3 = document.getElementById("addbutton3");
    addbutton3.style.display = "none";
    alert("已超过可添加个数，请勿操作！");
}

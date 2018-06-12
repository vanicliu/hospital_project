window.addEventListener("load", init, false);
function init() {
    $.ajax({
        type: "POST",
        url: "gethistory.ashx",
        dateType: "json",
        async: false,
        success: function (data) {
            var historygroup = eval("(" + data + ")");
            var historygroup = historygroup.Item;
            var $historytr = $("#historytr");
            var historycontent = "";
            for (var i = 0; i < historygroup.length; i++) {
                historycontent = historycontent + '<tr><td style="width:120px">' + historygroup[i].Enterprise + '</td><td style="width:80px">' + historygroup[i].buildTime + '</td><td style="width:120px">' + historygroup[i].usedName + '</td><td style="width:120px">' + historygroup[i].nowName + '</td><td style="width:80px">' + historygroup[i].changeTime + '</td><td style="width:120px">' + historygroup[i].usedName2 + '</td><td style="width:120px">' + historygroup[i].nowName2 + '</td><td style="width:80px">' + historygroup[i].changeTime2 + '</td><td style="width:120px">' + historygroup[i].usedName3 + '</td><td style="width:120px">' + historygroup[i].nowName3 + '</td><td style="width:80px">' + historygroup[i].changeTime3 + '</td><td style="width:300px"> ' + historygroup[i].Remains + '</td><td style="width:80px">' + historygroup[i].Product + '</td><td style="width:80px">' + historygroup[i].releaseTime + '</td><td style="width:80px"><span><a href=" " onclick="del(' + historygroup[i].ID + ')">删除</a></span></td><td style="width:80px"><span> <a href="javascript:void(0)"  onclick="openDiv(this)">修改</a></span><span>&nbsp</span><span ><a href="javascript:void(0)"  onclick="save(this)">保存</a></span><span style="display:none;"><a href="#" onclick="update(this,' + historygroup[i].ID + ')">提交</span></td></tr>';
            }
            $historytr.append(historycontent);
        },
        error: function () {
            alert("请求出错处理");
        }
    });
}
/*删除js*/
function del(id) {
    $.ajax({
        type: "POST",
        url: "deletehistory.ashx",
        async: false,
        dateType: "json",
        data: { ID: id },
        success: function (data) {
            if (data == "success") {
                alert("删除成功");
                window.location.reload();
            }
            else {
                alert("删除失败，请稍后重试");
                return false;
            }
        },
        error: function () {
            alert("请求出错处理");
        }
    });
}
/*td变input*/
function openDiv(btn) {
    var tr = btn.parentElement.parentElement.parentElement;
    var span = btn.parentElement;
    span.style.display = "none";
    for (var i = 0; i < tr.cells.length - 3; i++) {
        var td = tr.cells[i];
        var txt = document.createElement("input");
        txt.type = "text";
        txt.style.width = "80px";
        txt.value = td.innerHTML;
        td.innerHTML = "";
        td.appendChild(txt);
    }
}
/*input框内内容保存*/
function save(btn) {
    var tr = btn.parentElement.parentElement.parentElement;
    var span = btn.parentElement.parentElement;
    span.lastChild.style.display = "";
    btn.parentElement.style.display = "none";
    for (var i = 0; i < tr.cells.length - 3; i++) {
        var td = tr.cells[i];
        for (var j = 0; j < td.children.length; j++) {
            td.innerHTML = td.children[j].value;
        }
    }

}
function update(e, id) {
    var td1_value = $(e).parent().parent().parent().children().eq(0).text();
    var td2_value = $(e).parent().parent().parent().children().eq(1).text();
    var td3_value = $(e).parent().parent().parent().children().eq(2).text();
    var td4_value = $(e).parent().parent().parent().children().eq(3).text();
    var td5_value = $(e).parent().parent().parent().children().eq(4).text();
    var td6_value = $(e).parent().parent().parent().children().eq(5).text();
    var td7_value = $(e).parent().parent().parent().children().eq(6).text();
    var td8_value = $(e).parent().parent().parent().children().eq(7).text();
    var td9_value = $(e).parent().parent().parent().children().eq(8).text();
    var td10_value = $(e).parent().parent().parent().children().eq(9).text();
    var td11_value = $(e).parent().parent().parent().children().eq(10).text();
    var td12_value = $(e).parent().parent().parent().children().eq(11).text();
    var td13_value = $(e).parent().parent().parent().children().eq(12).text();
    $.ajax({
        type: "POST",
        url: "updatehistory.ashx",
        async: false,
        dateType: "json",
        data: {
            ID: id,
            enterprise: td1_value,
            buildTime: td2_value,
            usedName: td3_value,
            nowName: td4_value,
            changeTime: td5_value,
            usedName2: td6_value,
            nowName2: td7_value,
            changeTime2: td8_value,
            usedName3: td9_value,
            nowName3: td10_value,
            changeTime3: td11_value,
            remains: td12_value,
            product: td13_value
        },
        success: function (data) {
            if (data == "success") {
                alert("修改成功");
                window.location.reload();
            }
        },
    });
}
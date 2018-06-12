/*数据查询js*/
window.addEventListener("load", init, false);
function init() {
    $.ajax({
        type: "POST",
        url: "getvaluation.ashx",
        async: false,
        dateType: "json",
        success: function (data) {
            var valuationgroup = eval("(" + data + ")");
            var valuationgroup = valuationgroup.Item;
            var $valuationtr = $("#valuationtr");
            var valuationcontent = "";
            var i;
            for (i = 0; i < valuationgroup.length; i++) {
                valuationcontent = valuationcontent + '<tr><td>' + valuationgroup[i].Enterprise + '</td><td colspan="2" style="white-space: nowrap;text-overflow:ellipsis;overflow:hidden;">' + valuationgroup[i].DelphiMethod + '</td><td colspan="2" style="white-space: nowrap;text-overflow:ellipsis;overflow:hidden;">' + valuationgroup[i].ConsumerSurvey + '</td> <td>' + valuationgroup[i].Releasetime + '</td> <td><span><a href=" " onclick="del(' + valuationgroup[i].Id + ')">删除</a></span></td><td><span><a href="javascript:void(0)" onclick="openDiv(this)">修改</a></span><span>&nbsp</span><span ><a href="javascript:void(0)" onclick="save(this)">保存</a></span><span style="display:none;"><a href="#" onclick="update(this,' + valuationgroup[i].Id + ')">提交</span></td></tr>';
            }
            $valuationtr.append(valuationcontent);
        },
        error: function (e) {
            alert(e);
        }
    });

}
/*数据删除js*/
function del(id) {
    $.ajax({
        type: "POST",
        url: "deletevaluation.ashx",
        async: false,
        dateType: "json",
        data: { Id: id },
        success: function (data) {
            alert("删除成功");
            if (data == "success") {
                window.location.reload();
            }
        },
    });
}
/*td变input*/
function openDiv(btn) {
    var tr = btn.parentElement.parentElement.parentElement;
    var span = btn.parentElement;
    span.style.display = "none";
    for (var i = 0; i < tr.cells.length - 3; i++) {
        var td = tr.cells[i];
        if (i < 1) {
            var txt = document.createElement("input");
            txt.setAttribute("class", "form-control");
            txt.type = "text";
            txt.style.width = "100px";
            txt.value = td.innerHTML;
            td.innerHTML = "";
            td.appendChild(txt);
        }
        else {
            var txt = document.createElement("textarea");            
            txt.setAttribute("class", "form-control tinymce");
            txt.style.width = "280px";
            txt.style.height = "100px";
            txt.value = td.innerHTML;
            td.innerHTML = "";
            td.appendChild(txt);
        }
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
/*数据修改js*/
function update(e, id) {
    var td1_value = $(e).parent().parent().parent().children().eq(0).text();
    var td2_value = $(e).parent().parent().parent().children().eq(1).text();
    var td3_value = $(e).parent().parent().parent().children().eq(2).text();
    $.ajax({
        type: "POST",
        url: "updatevaluation.ashx",
        async: false,
        dateType: "json",
        data: {
            Id: id,
            Enterprise: td1_value,
            DelphiMethod: td2_value,
            ConsumerSurvey: td3_value           
        },
        success: function (data) {
            if (data == "success") {
                alert("修改成功");
                window.location.reload();
            }
        },
    });
}
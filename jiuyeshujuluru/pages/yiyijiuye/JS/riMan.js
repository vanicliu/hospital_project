/* 科研投入js */
window.addEventListener("load", init, false);
function init() {
    $.ajax({
        type: "POST",
        url: "riMan.ashx",
        async: false,
        dateType: "json",
        success: function (data) {
            var rigroup = eval("(" + data + ")");
            var rigroup = rigroup.Item;
            var $riul = $("#riul");
            var content = "";
            for (var i = 0; i < rigroup.length; i++) {
                content = content + '<tr><td>' + rigroup[i].enterprise + '</td><td>' + rigroup[i].year + '</td><td>' + rigroup[i].techDevelopCost + '</td><td>' + rigroup[i].RdInvestment + '</td><td>' + rigroup[i].RdOrgLevel + '</td><td>' + rigroup[i].RderNum + '</td><td>' + rigroup[i].RderSeniorNum + '</td><td>' + rigroup[i].patentFilingNum + '</td><td>' + rigroup[i].patentLicNum + '</td><td>' + rigroup[i].Releasetime + '</td><td><span><a href="javascript:void(0)"  onclick="openDiv(this)">修改</a></span><span>&nbsp;</span><span><a href="javascript:void(0)" onclick="save(this)">保存</a></span><span style="display:none;"><a href="#"  onclick="update(this,' + rigroup[i].id + ')">提交</span></td><td><span><a href=" " onclick="deleteRi(' + rigroup[i].id + ')">删除</a></span></td></tr>';

            }
            $riul.append(content);
        },
        error: function (e) {
            alert(e);
        }
    });

}

// 删除
function deleteRi(id) {
    $.ajax({
        type: "POST",
        url: "delRi.ashx",
        async: false,
        data: { ID: id },
        dateType: "json",
        success: function (data) {
            if (data == "success") {
                alert('删除成功');
                window.location.reload();
            } else {
                alert('删除失败，请稍后重试');
                return false;
            }
        }
    })
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
        txt.style.width = "100px";
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
/*数据修改js*/
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
    $.ajax({
        type: "POST",
        url: "updateRi.ashx",
        async: false,
        dateType: "json",
        data: {
            ID: id,
            enterprise: td1_value,
            year: td2_value,
            techDevelopCost: td3_value,
            RdInvestment: td4_value,
            RdOrgLevel: td5_value,
            RderNum: td6_value,
            RderSeniorNum: td7_value,
            patentFilingNum: td8_value,
            patentLicNum: td9_value
        },
        success: function (data) {
            if (data == "success") {
                alert("修改成功");
                window.location.reload();
            }
        },
    });
}
/* 产品系列js */
window.addEventListener("load", init, false);
function init() {
    $.ajax({
        type: "POST",
        url: "productMan.ashx",
        async: false,
        dateType: "json",
        success: function (data) {
            var progroup = eval("(" + data + ")");
            var progroup = progroup.Item;
            var $proul = $("#proul");
            var content = "";
            for (var i = 0; i < progroup.length; i++) {
                content = content + '<tr><td style="width:120px">' + progroup[i].enterprise + '</td><td>' + progroup[i].brand + '</td><td style="width:80px">' + progroup[i].degree + '</td><td>' + progroup[i].scent + '</td><td>' + progroup[i].other + '</td><td>' + progroup[i].Releasetime + '</td><td><span><a href="javascript:void(0)"  onclick="openDiv(this)">修改</a></span><span>&nbsp;</span><span><a href="javascript:void(0)" onclick="save(this)">保存</a></span><span style="display:none;"><a href="#"  onclick="update(this,' + progroup[i].id + ')">提交</span></td><td><span><a href=" " onclick="deletePro(' + progroup[i].id + ')">删除</a></span></td></tr>';

            }
            $proul.append(content);
        },
        error: function (e) {
            alert(e);
        }
    });

}

// 删除
function deletePro(id) {
    $.ajax({
        type: "POST",
        url: "delPro.ashx",
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
        txt.style.width = "auto";
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
    $.ajax({
        type: "POST",
        url: "updatePro.ashx",
        async: false,
        dateType: "json",
        data: {
            ID: id,
            enterprise: td1_value,
            brand: td2_value,
            degree: td3_value,
            scent: td4_value,
            other: td5_value
        },
        success: function (data) {
            if (data == "success") {
                alert("修改成功");
                window.location.reload();
            }
        },
    });
}
/*数据查询js*/
window.addEventListener("load", init, false);
function init() {
    $.ajax({
        type: "POST",
        url: "getassets.ashx",
        async: false,
        dateType: "json",
        success: function (data) {
            var assetsgroup = eval("(" + data + ")");
            var assetsgroup = assetsgroup.Item;
            var $assetstr = $("#assetstr");
            var assetscontent = "";
            var i;
            for (i = 0; i < assetsgroup.length; i++) {               
                assetscontent = assetscontent + '<tr><td>' + assetsgroup[i].Enterprise + '</td><td>' + assetsgroup[i].PatentValue + '</td><td>' + assetsgroup[i].BrandValue + '</td><td colspan="2" style="white-space: nowrap;text-overflow:ellipsis;overflow:hidden;">' + assetsgroup[i].InternationalAward + '</td> <td colspan="2" style="white-space: nowrap;text-overflow:ellipsis;overflow:hidden;">' + assetsgroup[i].NationAward + '</td> <td colspan="2" style="white-space: nowrap;text-overflow:ellipsis;overflow:hidden;">' + assetsgroup[i].ProvinceAward + '</td> <td>' + assetsgroup[i].Releasetime + '</td> <td><span><a href=" " onclick="del(' + assetsgroup[i].Id + ')">删除</a></span></td><td><span> <a href="javascript:void(0)" onclick="openDiv(this)">修改</a></span><span>&nbsp</span><span ><a href="javascript:void(0)" onclick="save(this)">保存</a></span><span style="display:none;"><a href="#" onclick="update(this,' + assetsgroup[i].Id + ')">提交</span></td></tr>';
            }
            $assetstr.append(assetscontent);
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
        url: "deleteassets.ashx",
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
        if (i < 3) {
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
            txt.style.width = "180px";
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
    var td4_value = $(e).parent().parent().parent().children().eq(3).text();
    var td5_value = $(e).parent().parent().parent().children().eq(4).text();
    var td6_value = $(e).parent().parent().parent().children().eq(5).text();
    $.ajax({
        type: "POST",
        url: "updateassets.ashx",
        async: false,
        dateType: "json",
        data: {
            Id: id,
            Enterprise: td1_value,
            PatentValue: td2_value,
            BrandValue: td3_value,
            InternationalAward: td4_value,
            NationAward: td5_value,
            ProvinceAward: td6_value
        },
        success: function (data) {
            if (data == "success") {
                alert("修改成功");
                window.location.reload();
            }
        },
    });
}
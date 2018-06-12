/*数据查询js*/
window.addEventListener("load", init, false);
function init() {
    $.ajax({
        type: "POST",
        url: "getsize.ashx",
        async: false,
        dateType: "json",
        success: function (data) {
            var sizegroup = eval("(" + data + ")");
            var sizegroup = sizegroup.Item;
            var $sizetr = $("#sizetr");
            var sizecontent = "";
            var i;
            for (i = 0; i < sizegroup.length; i++) {
                sizecontent = sizecontent + '<tr><td>' + sizegroup[i].Year + '</td> <td>  ' + sizegroup[i].Enterprise + '</td><td>' + sizegroup[i].Totalassets + '</td><td>' + sizegroup[i].Area + '</td> <td>' + sizegroup[i].Productoutput + '</td> <td>' + sizegroup[i].Employeesnumber + '</td> <td>' + sizegroup[i].Releasetime + '</td> <td><span><a href=" " onclick="del(' + sizegroup[i].ID + ')">删除</a></span></td><td><span> <a href="javascript:void(0)"  onclick="openDiv(this)">修改</a></span><span>&nbsp</span><span ><a href="javascript:void(0)"  onclick="save(this)">保存</a></span><span style="display:none;"><a href="#" onclick="update(this,' + sizegroup[i].ID + ')">提交</span></td></tr>';
            }
            $sizetr.append(sizecontent);
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
        url: "deletesize.ashx",
        async: false,
        dateType: "json",
        data: { ID: id },
        success: function (data) {
            if (data == "success") {
                alert("删除成功");
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
    for (var i = 0; i < tr.cells.length-3; i++) {
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
    $.ajax({
        type: "POST",
        url: "updatesize.ashx",
        async: false,
        dateType: "json",
        data: {
            ID: id,
            year: td1_value,
            enterprise: td2_value,
            totalassets: td3_value,
            area: td4_value,
            productoutput: td5_value,
            employeesnumber: td6_value
        },
        success: function (data) {
            if (data == "success") {
                alert("修改成功");
                window.location.reload();
            }
        },
    });
}



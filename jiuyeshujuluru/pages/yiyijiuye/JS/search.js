/*查询js*/
function searchPro() {
    var input_value = document.getElementById("searchPro").value;
    $("#table-1 tr:not(:first)").hide();
    $("#proul tr").each(function () {
        var td = $(this).find("td").eq(0);
        var td_content = td.text();
        if (td_content.indexOf(input_value) >= 0) {
            td.parent().show();
        }
    });
}
function searchRi() {
    var input_value = document.getElementById("searchRi").value;
    $("#table-1 tr:not(:first)").hide();
    $("#riul tr").each(function () {
        var td = $(this).find("td").eq(0);
        var td_content = td.text();
        if (td_content.indexOf(input_value) >= 0) {
            td.parent().show();
        }
    });
}
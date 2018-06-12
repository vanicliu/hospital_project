/*查询js*/
function searchHistory() {
    var input_value = document.getElementById("searchHistory").value;
    $("#table-1 tr:not(:first)").hide();
    $("#historytr tr").each(function () {
        var td = $(this).find("td").eq(0);
        var td_content = td.text();
        if (td_content.indexOf(input_value) >= 0) {
            td.parent().show();
        }
    });
}
function searchSize() {
    var input_value = document.getElementById("searchSize").value;
    $("#table-1 tr:not(:first)").hide();
    $("#sizetr tr").each(function () {
        var td = $(this).find("td").eq(1);
        var td_content = td.text();
        if (td_content.indexOf(input_value) >= 0) {
            td.parent().show();
        }
    });
}
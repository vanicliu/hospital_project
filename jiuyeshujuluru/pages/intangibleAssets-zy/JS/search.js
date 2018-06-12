/*查询js*/
function searchAssets() {
    var input_value = document.getElementById("searchAssets").value;
    $("#table-1 tr:not(:first)").hide();
    $("#assetstr tr").each(function () {
        var td = $(this).find("td").eq(0);
        var td_content = td.text();
        if (td_content.indexOf(input_value) >= 0) {
            td.parent().show();
        }
    });
}
function searchValuation() {
    var input_value = document.getElementById("searchValuation").value;
    $("#table-1 tr:not(:first)").hide();
    $("#valuationtr tr").each(function () {
        var td = $(this).find("td").eq(0);
        var td_content = td.text();
        if (td_content.indexOf(input_value) >= 0) {
            td.parent().show();
        }
    });
}
/*企业规模录入js*/
window.addEventListener("load", checkControl, false);
function checkControl() {
    document.getElementById("postSize").value = "false";
    document.getElementById("sizeForm").addEventListener("submit", checkForm, false);
    document.getElementById("postSize").value = false;
}
function Refresh(evt) {
    evt.preventDefault();
    window, Location = 'size.aspx';
}
function checkForm() {
    //资产总量正则校验
    var value1 = document.getElementById("totalAssets").value;
    var value2 = document.getElementById("area").value;
    var value3 = document.getElementById("productOutput").value;
    var value4 = document.getElementById("employeesNumber").value;
    // 注意：如要限制 0321 这种格式，reg=/^[1-9]\d*$|^0$/;
    var reg = reg = /^\d+(\.\d+)?$/;//允许带小数点
    var reg1 = /^\d+$/;//不允许带小数点
    var TA = reg.test(value1);
    var AREA = reg.test(value2);
    var PO = reg.test(value3);
    var EN = reg1.test(value4);
    if (TA == true && AREA == true && PO == true && EN == true) {
        document.getElementById("postSize").value = true;
    }
    else if (TA == false) {
        alert("资产总量字符非法，录入失败！请检查！");
        return false;
        document.getElementById("postSize").value = false;
    }
    else if (AREA == false) {
        alert("占地面积字符非法，录入失败！请检查！");
        return false;
        document.getElementById("postSize").value = false;
    }
    else if (PO == false) {
        alert("产品产量字符非法，录入失败！请检查！");
        return false;
        document.getElementById("postSize").value = false;
    }
    else if (EN == false) {
        alert("职工总数字符非法，录入失败！请检查！");
        return false;
        document.getElementById("postSize").value = false;
    }
   // document.getElementById("postSize").value = true;
}

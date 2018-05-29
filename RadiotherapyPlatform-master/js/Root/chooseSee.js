window.addEventListener("load", Init, false);

function Init() {
    document.getElementById('enableSee').addEventListener("click", showHide, false);
}

function showHide(evt) {
    var hidePart = document.getElementById("hidePart");
    //ie��element.currentStyle����css,�����wind.getComputedStyle(element,αԪ��)��ȡ����css,element.styleֻ�ܻ�ȡ��ǰstlyeֵ���ڶ�����ֻ����
    var style = (hidePart.currentStyle != undefined) ? hidePart.currentStyle.display : window.getComputedStyle(hidePart, null).display;
    if (style == "none") {
        hidePart.style.display = "list-item";
        document.getElementById('enableSeeSpan').className= "fa fa-angle-double-down";
    } else {
        hidePart.style.display = "none";
        document.getElementById('enableSeeSpan').className= "fa fa-angle-double-left";
    }
    evt.preventDefault();
}
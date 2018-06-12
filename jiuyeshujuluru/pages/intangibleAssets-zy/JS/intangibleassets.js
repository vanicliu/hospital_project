/* 无形资产录入js */
window.addEventListener("load", checkControl, false);
function checkControl() {
    document.getElementById("assetsName").value = "false";
    document.getElementById("assetsForm").addEventListener("submit", checkForm, false);
    document.getElementById("assetsName").value = false;
}

function Refresh(evt) {
    evt.preventDefault();
    window.location = 'intangibleassets.aspx';
}

function checkForm(evt) {
    document.getElementById("assetsName").value = true;
}
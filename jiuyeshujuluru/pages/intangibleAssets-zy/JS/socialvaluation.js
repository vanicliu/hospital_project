/* 社会评价录入js */
window.addEventListener("load", checkControl, false);
function checkControl() {
    document.getElementById("valuationName").value = "false";
    document.getElementById("valuationForm").addEventListener("submit", checkForm, false);
    document.getElementById("valuationName").value = false;
}

function Refresh(evt) {
    evt.preventDefault();
    window.location = 'socialvaluation.aspx';
}

function checkForm(evt) {
    document.getElementById("valuationName").value = true;
}
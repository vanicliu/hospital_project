/* 科研投入录入js */
window.addEventListener("load", checkControl, false);
function checkControl() {
    document.getElementById("postRi").value = "false";
    document.getElementById("riForm").addEventListener("submit", checkForm, false);
    document.getElementById("postRi").value = false;
}

function Refresh(evt) {
    evt.preventDefault();
    window.location = 'ri.aspx';
}

function checkForm(evt) {
    document.getElementById("postRi").value = true;
}

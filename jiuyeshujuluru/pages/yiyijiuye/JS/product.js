/* 品牌系列录入js */
window.addEventListener("load", checkControl, false);
function checkControl() {
    document.getElementById("postProduct").value = "false";
    document.getElementById("productForm").addEventListener("submit", checkForm, false);
    document.getElementById("postProduct").value = false;
}

function Refresh(evt) {
    evt.preventDefault();
    window.location = 'product.aspx';
}

function checkForm(evt) {
        document.getElementById("postProduct").value = true;
}

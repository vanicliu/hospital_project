﻿/* ***********************************************************
 * FileName: DesignApply.js
 * Writer: JY
 * create Date: --
 * ReWriter:JY
 * Rewrite Date:--
 * impact :
 * 计划申请
 * **********************************************************/
window.addEventListener("load", Init, false);

var treatID;

var userName;
var userID;
var aa = 0;
var bb = 0;
var ti = 0;
function Init(evt) {


    //获得当前执行人姓名与ID
    getUserName();
    getUserID();
    if ((typeof (userID) == "undefined")) {
        if (confirm("用户身份已经失效,是否选择重新登录?")) {
            parent.window.location.href = "/RadiotherapyPlatform/pages/Login/Login.aspx";
        }
    }
    
    treatID = window.location.search.split("=")[1];
    var patient = getPatientInfo(treatID);
    document.getElementById("userID").value = userID;
    document.getElementById("hidetreatID").value = treatID;
    document.getElementById("username").innerHTML = patient.Name;
    document.getElementById("sex").innerHTML = sex(patient.Gender);
    document.getElementById("age").innerHTML = patient.Age;
    document.getElementById("progress").value = patient.Progress;
    document.getElementById("Reguser").innerHTML = patient.RegisterDoctor;
    document.getElementById("treatID").innerHTML = patient.Treatmentdescribe;
    document.getElementById("diagnosisresult").innerHTML = patient.diagnosisresult;
    document.getElementById("radiotherapy").innerHTML = patient.Radiotherapy_ID;
    var texthos = hosttext(patient.Hospital_ID);
    document.getElementById("hospitalid").innerHTML = texthos;
    document.getElementById("lightpart").innerHTML = patient.LightPart_ID;
    document.getElementById("aa").value = aa;
    document.getElementById("bb").value = bb;
    var select1 = document.getElementById("technology");
    createTechnologyItem(select1);
    var select2 = document.getElementById("equipment");
    createEquipmentItem(select2);
    createSplitway(document.getElementById("splitway"));
    $("#current-tab").text(patient.Treatmentdescribe + "计划申请");
    var progress = patient.Progress.split(",");
    if (isInArray(progress, '7')) {
        ti = 1;
        var designInfo = getDesignInfo(treatID);
        for (var i = 0; i < designInfo.length; i++) {
            if (patient.Treatmentname == designInfo[i].treatmentname) {
                document.getElementById("Remarks").value = designInfo[i].RadiotherapyHistory;
                readDosagePriority(designInfo[i].DosagePriority);
                readDosage(designInfo[i].Dosage);
                document.getElementById("technology").value = designInfo[i].technology;
                document.getElementById("splitway").value = designInfo[i].SplitWay_ID;
                document.getElementById("equipment").value = designInfo[i].equipment;
                document.getElementById("applyuser").innerHTML = designInfo[i].doctor;
                document.getElementById("time").innerHTML = designInfo[i].apptime;
                if (designInfo[i].userID == userID) {
                    window.parent.document.getElementById("edit").removeAttribute("disabled");
                }
            } else {
                //疗程历史
                var tab = '<li class=""><a href="#tab' + i + '" data-toggle="tab" aria-expanded="false">' + designInfo[i].Treatmentdescribe + '计划申请</a></li>';
                var content = '<div class="tab-pane" id="tab' + i + '"><div class="single-row"><div class="item col-xs-12"><span class="col-xs-2" style="padding-left:0px;">特殊情况(放疗史)：</span>' +
                        '<span class="col-xs-10">' + designInfo[i].RadiotherapyHistory + '</span></div></div>' +
                        '<div class="single-row"><div class="col-xs-6" style="padding-left:0px;"><span class="form-text col-xs-4">靶区处方剂量：</span></div></div>' +
                        '<div class="single-row"><div class="item area-group col-xs-12"><table id="Priority' + i + '" class="table table-bordered">' +
                        '<thead><tr><th>靶区</th><th>外放</th><th>PTV</th><th>单次量cGy</th><th>次数</th><th>总剂量cGy</th><th>备注</th><th>优先级</th></tr></thead></table></div></div>' +
                        '<div class="single-row"><div class="col-xs-6" style="padding-left:0px;"><span class="form-text col-xs-4">危及器官限量：</span></div></div>' +
                        '<div class="single-row"><div class="item area-group col-xs-12"><table id="Dosage' + i + '" class="table table-bordered">' +
                        '<thead><tr><th>危及器官</th><th>剂量</th><th>限制</th><th>体积</th><th>外放</th><th>PRV</th><th>剂量</th><th>限制</th><th>体积</th><th>优先级</th>' +
                        '</tr></thead></table></div></div><div class="single-row"><div class="item col-xs-4">治疗技术：<span class="underline">' + designInfo[i].technologyname + '</span></div>' +
                        '<div class="item col-xs-4">放疗设备：<span class="underline">' + designInfo[i].equipmentname + '</span></div><div class="item col-xs-4">分割方式：<span class="underline">' + designInfo[i].ways + '</span></div></div>' +
                        '<div class="single-row"><div class="item col-xs-4"><button class="btn btn-success" type="button" disabled="disabled" id="' + i + '">载入历史信息</button></div></div>';
                $("#tabs").append(tab);
                $("#tab-content").append(content);
                readDosagePriority1(designInfo[i].DosagePriority, i);
                readDosage1(designInfo[i].Dosage, i);
            }
        }
    }
    else {
        document.getElementById("userID").value = userID;
        document.getElementById("applyuser").innerHTML = userName;
        document.getElementById("time").innerHTML = getNowFormatDate();
        document.getElementById("hidetreatID").value = treatID;
        var designInfo = getDesignInfo(treatID);
        for (var i = 0; i < designInfo.length; i++) {
            if (patient.Treatmentname != designInfo[i].treatmentname) {
                var tab = '<li class=""><a href="#tab' + i + '" data-toggle="tab" aria-expanded="false">' + designInfo[i].Treatmentdescribe + '计划申请</a></li>';
                var content = '<div class="tab-pane" id="tab' + i + '"><div class="single-row"><div class="item col-xs-12"><span class="col-xs-2" style="padding-left:0px;">特殊情况(放疗史)：</span>' +
                        '<span class="col-xs-10">' + designInfo[i].RadiotherapyHistory + '</span></div></div>' +
                        '<div class="single-row"><div class="col-xs-6" style="padding-left:0px;"><span class="form-text col-xs-4">靶区处方剂量：</span></div></div>' +
                        '<div class="single-row"><div class="item area-group col-xs-12"><table id="Priority' + i + '" class="table table-bordered">' +
                        '<thead><tr><th>靶区</th><th>外放</th><th>PTV</th><th>单次量cGy</th><th>次数</th><th>总剂量cGy</th><th>备注</th><th>优先级</th></tr></thead></table></div></div>' +
                        '<div class="single-row"><div class="col-xs-6" style="padding-left:0px;"><span class="form-text col-xs-4">危及器官限量：</span></div></div>' +
                        '<div class="single-row"><div class="item area-group col-xs-12"><table id="Dosage' + i + '" class="table table-bordered">' +
                        '<thead><tr><th>危及器官</th><th>剂量</th><th>限制</th><th>体积</th><th>外放</th><th>PRV</th><th>剂量</th><th>限制</th><th>体积</th><th>优先级</th>' +
                        '</tr></thead></table></div></div><div class="single-row"><div class="item col-xs-4">治疗技术：<span class="underline">' + designInfo[i].technologyname + '</span></div>' +
                        '<div class="item col-xs-4">放疗设备：<span class="underline">' + designInfo[i].equipmentname + '</span></div><div class="item col-xs-4">分割方式：<span class="underline">' + designInfo[i].ways + '</span></div></div>' +
                        '<div class="single-row"><div class="item col-xs-4"><button class="btn btn-success" type="button"  id="' + i + '">载入历史信息</button></div></div>';
                $("#tabs").append(tab);
                $("#tab-content").append(content);
                readDosagePriority1(designInfo[i].DosagePriority, i);
                readDosage1(designInfo[i].Dosage, i);
            }
        }
    }
    $("#tab-content").find("button").each(function () {
        $(this).bind("click", function () {
            var k = this.id;
            document.getElementById("Remarks").value = designInfo[k].RadiotherapyHistory;
            addDosagePriority1(designInfo[k].DosagePriority);
            addDosage1(designInfo[k].Dosage);
            document.getElementById("technology").value = designInfo[k].technology;
            document.getElementById("equipment").value = designInfo[k].equipment;
            document.getElementById("splitway").value = designInfo[k].SplitWay_ID;
        });
    });
    
    var i = 0
    //自动计算总剂量
    $('#Prioritcgy' + i).bind('input propertychange', {i:i} ,function (e) {
        if (document.getElementById("Prioritcgy"+e.data.i).value == "") {
            document.getElementById("Prioritsum" + e.data.i).value = "";
        } else {
            document.getElementById("Prioritsum" + e.data.i).value = parseInt(document.getElementById("Prioritcgy" + e.data.i).value) * parseInt(document.getElementById("Priorittime" + e.data.i).value);
        }
    });
    $('#Priorittime' + i).bind('input propertychange', { i: i }, function (e) {
        if (document.getElementById("Priorittime" + e.data.i).value == "") {
            document.getElementById("Prioritsum" + e.data.i).value = "";
        } else {
            document.getElementById("Prioritsum" + e.data.i).value = parseInt(document.getElementById("Prioritcgy" + e.data.i).value) * parseInt(document.getElementById("Priorittime" + e.data.i).value);
        }
    });

}
function hosttext(str) {
    if (str == "") {
        return "未住院";
    } else {
        return ("住院,住院号:" + str);
    }
}
function isInArray(arr, value) {
    for (var i = 0; i < arr.length; i++) {
        if (value === arr[i]) {
            return true;
        }
    }
    return false;
}
//读取计量并建表格
function readDosagePriority1(DosagePriority,ii) {
    var table = document.getElementById("Priority"+ii);
    var tbody = document.createElement("tbody");
    for (var i = table.rows.length - 1; i > 0; i--) {
        table.deleteRow(i);
    }
    DosagePriority = DosagePriority.substring(0, DosagePriority.length - 1);
    var lists = new Array();
    lists = DosagePriority.split(";");
    for (var i = 0; i < lists.length; i++) {
        var list = new Array();
        list = lists[i].split(",");
        var tr = document.createElement("tr");
        for (var j = 0; j < list.length; j++) {
            var td = document.createElement("td");
            var textNode = document.createTextNode(list[j]);
            td.appendChild(textNode);
            tr.appendChild(td);
        }
        tbody.appendChild(tr);
    }
    tbody.style.textAlign = "center";
    table.appendChild(tbody);
}
//读取危机器官信息
function readDosage1(DosagePriority,ii) {
    var table = document.getElementById("Dosage"+ii);
    var tbody = document.createElement("tbody");
    for (var i = table.rows.length - 1; i > 0; i--) {
        table.deleteRow(i);
    }
    DosagePriority = DosagePriority.substring(0, DosagePriority.length - 1);
    var lists = new Array();
    lists = DosagePriority.split(";");
    for (var i = 0; i < lists.length; i++) {
        var list = new Array();
        list = lists[i].split(",");
        var tr = document.createElement("tr");
        for (var j = 0; j < list.length; j++) {
            var td = document.createElement("td");
            if (j == 2) {
                var textNode = document.createTextNode("<");
                td.appendChild(textNode);
                tr.appendChild(td);
            } else {
                var textNode = document.createTextNode(list[j]);
            }
            td.appendChild(textNode);
            tr.appendChild(td);
        }
        tbody.appendChild(tr);
    }
    tbody.style.textAlign = "center";
    table.appendChild(tbody);
}
//获取计划信息
function getDesignInfo(treatID) {
    var xmlHttp = new XMLHttpRequest();
    var url = "designApplyInfo.ashx?treatID=" + treatID;
    xmlHttp.open("GET", url, false);
    xmlHttp.send(null);
    var json = xmlHttp.responseText;
    json = json.replace(/\r/g, "");
    json = json.replace(/\n/g, "\\n");
    var obj1 = eval("(" + json + ")");
    return obj1.designInfo;
}
//获取病人基本信息
function getPatientInfo(treatmentID) {
    var xmlHttp = new XMLHttpRequest();
    var url = "patientInfoForFix.ashx?treatmentID=" + treatmentID;
    xmlHttp.open("GET", url, false);
    xmlHttp.send(null);
    var json = xmlHttp.responseText;
    var obj1 = eval("(" + json + ")");
    return obj1.patient[0];
}
//设置时间格式
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var min = date.getMinutes();
    if (min < 10) {
        min = "0" + min;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + min;

    return currentdate;
}

function readDosagePriority(DosagePriority) {
    var item = "Priority";
    var table = document.getElementById(item);
    var tbody = document.createElement("tbody");
    for (var i = table.rows.length - 1; i > 0; i--) {
        table.deleteRow(i);
    }
    DosagePriority = DosagePriority.substring(0, DosagePriority.length - 1);
    var lists = new Array();
    lists = DosagePriority.split(";");
    for (var i = 0; i < lists.length; i++) {
        var list = new Array();
        list = lists[i].split(",");
        var tr = document.createElement("tr");
        for (var j = 0; j < list.length; j++) {
            var td = document.createElement("td");
            var textNode = document.createTextNode(list[j]);
            td.appendChild(textNode);
            tr.appendChild(td);
        }
        var extraTD = document.createElement("td");
        tr.appendChild(extraTD);
        tbody.appendChild(tr);
    }
    table.rows[0].cells[table.rows[0].cells.length - 1].children[0].href = "javascript:;";
    tbody.style.textAlign = "center";
    table.appendChild(tbody);
}

function RemoveAllChild(area) {
    while (area.hasChildNodes()) {
        var first = area.firstChild;
        if (first != null && first != undefined)
            area.removeChild(first);
    }
}
//选择模板
function chooseTempalte(templateID) {
    var xmlHttp = new XMLHttpRequest();
    var url = "GetTemplateDesignApply.ashx?templateID=" + templateID;
    xmlHttp.open("GET", url, false);
    xmlHttp.send(null);
    var json = xmlHttp.responseText;
    json = json.replace(/\r/g, "");
    json = json.replace(/\n/g, "\\n");
    var obj1 = eval("(" + json + ")");
    document.getElementById("Remarks").value = obj1.templateInfo[0].RadiotherapyHistory;
    addDosagePriority1(obj1.templateInfo[0].DosagePriority);
    addDosage1(obj1.templateInfo[0].Dosage);
    document.getElementById("technology").value = obj1.templateInfo[0].technology;
    document.getElementById("equipment").value = obj1.templateInfo[0].equipment;
}
function readDosage(DosagePriority) {
    var item = "Dosage";
    var table = document.getElementById(item);
    var tbody = document.createElement("tbody");
    for (var i = table.rows.length - 1; i > 0; i--) {
        table.deleteRow(i);
    }
    DosagePriority = DosagePriority.substring(0, DosagePriority.length - 1);
    var lists = new Array();
    lists = DosagePriority.split(";");
    for (var i = 0; i < lists.length; i++) {
        var list = new Array();
        list = lists[i].split(",");
        var tr = document.createElement("tr");
        for (var j = 0; j < list.length; j++) {
            var td = document.createElement("td");
            if (j == 2) {
                var textNode = document.createTextNode("<");
                td.appendChild(textNode);
                tr.appendChild(td);
            }else{
                var textNode = document.createTextNode(list[j]);
            }
            td.appendChild(textNode);
            tr.appendChild(td);
        }
        var extraTD = document.createElement("td");
        tr.appendChild(extraTD);
        tbody.appendChild(tr);
    }
    table.rows[0].cells[table.rows[0].cells.length - 1].children[0].href = "javascript:;";
    tbody.style.textAlign = "center";
    table.appendChild(tbody);
}
//治疗技术选择框
function createTechnologyItem(thiselement) {
    var PartItem = JSON.parse(getPartItem1()).Item;
    thiselement.options.length = 0;
    thiselement.options[0] = new Option("--治疗技术选择--");
    thiselement.options[0].value = "allItem";
    for (var i = 0; i < PartItem.length; i++) {
        if (PartItem[i] != "") {
            thiselement.options[i + 1] = new Option(PartItem[i].Name);
            thiselement.options[i + 1].value = parseInt(PartItem[i].ID);
        }
    }
    if (PartItem[0].defaultItem != "") {
        thiselement.value = PartItem[0].defaultItem;
    }

}
//第二步部位项数据库调取
function getPartItem1() {
    var xmlHttp = new XMLHttpRequest();
    var url = "getTechnology.ashx";
    xmlHttp.open("GET", url, false);
    xmlHttp.send();
    var Items = xmlHttp.responseText;
    return Items;
}
//放疗设备选择框
function createEquipmentItem(thiselement) {
    var PartItem = JSON.parse(getPartItem2()).item;
    thiselement.options.length = 0;
    thiselement.options[0] = new Option("--放疗设备选择--");
    thiselement.options[0].value = "allItem";
    for (var i = 0; i < PartItem.length; i++) {
        if (PartItem[i] != "") {
            thiselement.options[i + 1] = new Option(PartItem[i].Name);
            thiselement.options[i + 1].value = parseInt(PartItem[i].ID);
        }
    }
    if (PartItem[0].defaultItem != "") {
        thiselement.value = PartItem[0].defaultItem;
    }

}
//第二步部位项数据库调取
function getPartItem2() {
    var xmlHttp = new XMLHttpRequest();
    var url = "getEqForDesign.ashx";
    xmlHttp.open("GET", url, false);
    xmlHttp.send();
    var Items = xmlHttp.responseText;
    return Items;
}
//计划行添加
function addDosagePriority() {
    var table = document.getElementById("Priority");
    var rows = table.rows.length;
    var row = table.insertRow(rows);
    rows--;
    var t1 = row.insertCell(0);
    var t2 = row.insertCell(1);
    var t3 = row.insertCell(2);
    var t4 = row.insertCell(3);
    var t5 = row.insertCell(4);
    var t6 = row.insertCell(5);
    var t7 = row.insertCell(6);
    var t8 = row.insertCell(7);
    var t9 = row.insertCell(8);
    t1.style.padding = "0px";
    t2.style.padding = "0px";
    t3.style.padding = "0px";
    t4.style.padding = "0px";
    t5.style.padding = "0px";
    t6.style.padding = "0px";
    t7.style.padding = "0px";
    t8.style.padding = "0px";  
    t9.style.cssText = "text-align: center;padding:0px;vertical-align: middle";
    t9.id = "delete"+rows;
    t1.innerHTML = '<input id="Prioritytype' + rows + '" name="Prioritytype' + rows + '" type="text" class="td-input" />';
    t2.innerHTML = '<input id="Priorityout' + rows + '" name="Priorityout' + rows + '" type="text" class="td-input" />';
    t3.innerHTML = '<input id="Prioritptv' + rows + '" name="Prioritptv' + rows + '" type="text" class="td-input" />';
    t4.innerHTML = '<input id="Prioritcgy' + rows + '" name="Prioritcgy' + rows + '" type="number" onmousewheel="return false;" class="td-input" />';
    t5.innerHTML = '<input id="Priorittime' + rows + '" name="Priorittime' + rows + '" type="number" onmousewheel="return false;" class="td-input" />';
    t6.innerHTML = '<input id="Prioritsum' + rows + '" name="Prioritsum' + rows + '" type="number" onmousewheel="return false;" class="td-input" />';
    t7.innerHTML = '<input id="Prioritremark' + rows + '" name="Prioritremark' + rows + '" type="text" class="td-input" />';
    t8.innerHTML = '<input id="Priorit' + rows + '" name="Priorit' + rows + '" type="number" onmousewheel="return false;" class="td-input" />';
    t9.innerHTML = '<a href="javascript:deleteDosagePriority(' + rows + ');"><i class="fa fa-fw fa-minus-circle" style="font-size:18px;"></i></a>'; 
    var i = rows;
    $('#Prioritcgy' + i).bind('input propertychange', { i: i }, function (e) {
        if (document.getElementById("Prioritcgy" + e.data.i).value == "") {
            document.getElementById("Prioritsum" + e.data.i).value = "";
        } else {
            document.getElementById("Prioritsum" + e.data.i).value = parseInt(document.getElementById("Prioritcgy" + e.data.i).value) * parseInt(document.getElementById("Priorittime" + e.data.i).value);
        }
    });
    $('#Priorittime' + i).bind('input propertychange', { i: i }, function (e) {
        if (document.getElementById("Priorittime" + e.data.i).value == "") {
            document.getElementById("Prioritsum" + e.data.i).value = "";
        } else {
            document.getElementById("Prioritsum" + e.data.i).value = parseInt(document.getElementById("Prioritcgy" + e.data.i).value) * parseInt(document.getElementById("Priorittime" + e.data.i).value);
        }
    });
    aa = rows;
    document.getElementById("aa").value = aa;
}
function addDosagePriority1(DosagePriority) {
    var table = document.getElementById("Priority");
    DosagePriority = DosagePriority.substring(0, DosagePriority.length - 1);
    var lists = new Array();
    lists = DosagePriority.split(";");
    var rows = table.rows.length;
    for (var j = rows-1; j > 0; j--) {
        table.deleteRow(j);
    }   
    for (var i = 0; i < lists.length; i++) {
        var list = new Array();
        list = lists[i].split(",");
        var row = table.insertRow(i+1);        
        var t1 = row.insertCell(0);
        var t2 = row.insertCell(1);
        var t3 = row.insertCell(2);
        var t4 = row.insertCell(3);
        var t5 = row.insertCell(4);
        var t6 = row.insertCell(5);
        var t7 = row.insertCell(6);
        var t8 = row.insertCell(7);
        var t9 = row.insertCell(8);
        t1.style.padding = "0px";
        t2.style.padding = "0px";
        t3.style.padding = "0px";
        t4.style.padding = "0px";
        t5.style.padding = "0px";
        t6.style.padding = "0px";
        t7.style.padding = "0px";
        t8.style.padding = "0px";
        t9.style.cssText = "text-align: center;padding:0px;vertical-align: middle";
        t9.id = "delete" + i;
        t1.innerHTML = '<input id="Prioritytype' + i + '" name="Prioritytype' + i + '" value="'+list[0]+'" type="text" class="td-input" />';
        t2.innerHTML = '<input id="Priorityout' + i + '" name="Priorityout' + i + '" value="' + list[1] + '" type="text" class="td-input" />';
        t3.innerHTML = '<input id="Prioritptv' + i + '" name="Prioritptv' + i + '" value="' + list[2] + '" type="text" class="td-input" />';
        t4.innerHTML = '<input id="Prioritcgy' + i + '" name="Prioritcgy' + i + '" value="' + list[3] + '" type="number" onmousewheel="return false;" class="td-input" />';
        t5.innerHTML = '<input id="Priorittime' + i + '" name="Priorittime' + i + '" value="' + list[4] + '" type="number" onmousewheel="return false;" class="td-input" />';
        t6.innerHTML = '<input id="Prioritsum' + i + '" name="Prioritsum' + i + '" value="' + list[5] + '" type="number" onmousewheel="return false;" class="td-input" />';
        t7.innerHTML = '<input id="Prioritremark' + i + '" name="Prioritremark' + i + '" value="' + list[6] + '" type="text" class="td-input" />';
        t8.innerHTML = '<input id="Priorit' + i + '" name="Priorit' + i + '" type="number" onmousewheel="return false;" value="' + list[7] + '" class="td-input" />';
        t9.innerHTML = '<a href="javascript:deleteDosagePriority(' + i + ');"><i class="fa fa-fw fa-minus-circle" style="font-size:18px;"></i></a>';
        $('#Prioritcgy' + i).bind('input propertychange', { i: i }, function (e) {
            if (document.getElementById("Prioritcgy" + e.data.i).value == "") {
                document.getElementById("Prioritsum" + e.data.i).value = "";
            } else {
                document.getElementById("Prioritsum" + e.data.i).value = parseInt(document.getElementById("Prioritcgy" + e.data.i).value) * parseInt(document.getElementById("Priorittime" + e.data.i).value);
            }
        });
        $('#Priorittime' + i).bind('input propertychange', { i: i }, function (e) {
            if (document.getElementById("Priorittime" + e.data.i).value == "") {
                document.getElementById("Prioritsum" + e.data.i).value = "";
            } else {
                document.getElementById("Prioritsum" + e.data.i).value = parseInt(document.getElementById("Prioritcgy" + e.data.i).value) * parseInt(document.getElementById("Priorittime" + e.data.i).value);
            }
        });
    }
    aa = lists.length - 1;
    document.getElementById("aa").value = aa;
}
//危机器官行添加
function addDosage1(DosagePriority) {
    var table = document.getElementById("Dosage");
    DosagePriority = DosagePriority.substring(0, DosagePriority.length - 1);
    var lists = new Array();
    lists = DosagePriority.split(";");
    var rows = table.rows.length;
    for (var j = rows - 1; j > 0; j--) {
        table.deleteRow(j);
    }
    for (var i = 0; i < lists.length; i++) {
        var list = new Array();
        list = lists[i].split(",");
        var row = table.insertRow(i + 1);
        var t1 = row.insertCell(0);
        var t2 = row.insertCell(1);
        var t3 = row.insertCell(2);
        var t4 = row.insertCell(3);
        var t5 = row.insertCell(4);
        var t6 = row.insertCell(5);
        var t7 = row.insertCell(6);
        var t8 = row.insertCell(7);
        var t9 = row.insertCell(8);
        var t10 = row.insertCell(9);
        var t11 = row.insertCell(10);
        t1.style.padding = "0px";
        t2.style.padding = "0px";
        t3.style.padding = "0px";
        t4.style.padding = "0px";
        t5.style.padding = "0px";
        t6.style.padding = "0px";
        t7.style.padding = "0px";
        t8.style.padding = "0px";
        t9.style.padding = "0px";
        t10.style.padding = "0px";
        t11.style.cssText = "text-align: center;padding:0px;vertical-align: middle";
        t11.id = "deletes" + i;
        t1.innerHTML = '<input id="type' + i + '" name="type' + i + '" value="' + list[0] + '"type="text" class="td-input" />';
        t2.innerHTML = '<input id="dv' + i + '" name="dv' + i + '" type="text" value="' + list[1] + '" class="td-input" />';
        t3.innerHTML = '<input type="text" class="td-input" value="<" readonly="true" />';
        t4.innerHTML = '<input id="number' + i + '" name="number' + i + '" type="number" onmousewheel="return false;" value="' + list[3] + '" class="td-input" />';
        t5.innerHTML = '<input id="out' + i + '" name="out' + i + '" type="text" value="' + list[4] + '" class="td-input" />';
        t6.innerHTML = '<input id="prv' + i + '" name="prv' + i + '" type="text" value="' + list[5] + '" class="td-input" />';
        t7.innerHTML = '<input id="num' + i + '" name="num' + i + '" type="number" onmousewheel="return false;" value="' + list[6] + '" class="td-input" />';
        t8.innerHTML = '<input type="text" class="td-input" value="<" readonly="true" />';
        t9.innerHTML = '<input id="numbers' + i + '" name="numbers' + i + '" type="text" value="' + list[8] + '" class="td-input" />';
        t10.innerHTML = '<input id="pp' + i + '" name="pp' + i + '" type="number" onmousewheel="return false;" value="' + list[9] + '" class="td-input" />';
        t11.innerHTML = '<a href="javascript:deleteDosage(' + i + ');"><i class="fa fa-fw fa-minus-circle" value="' + list[10] + '" style="font-size:18px;"></i></a>';
    }
    bb = lists.length-1;
    document.getElementById("bb").value = bb;
}
function addDosage() {
    var table = document.getElementById("Dosage");
    var rows = table.rows.length;
    var row = table.insertRow(rows);
    rows--;
    var t1 = row.insertCell(0);
    var t2 = row.insertCell(1);
    var t3 = row.insertCell(2);
    var t4 = row.insertCell(3);
    var t5 = row.insertCell(4);
    var t6 = row.insertCell(5);
    var t7 = row.insertCell(6);
    var t8 = row.insertCell(7);
    var t9 = row.insertCell(8);
    var t10 = row.insertCell(9);
    var t11 = row.insertCell(10);
    t1.style.padding = "0px";
    t2.style.padding = "0px";
    t3.style.padding = "0px";
    t4.style.padding = "0px";
    t5.style.padding = "0px";
    t6.style.padding = "0px";
    t7.style.padding = "0px";
    t8.style.padding = "0px";
    t9.style.padding = "0px";
    t10.style.padding = "0px";
    t11.style.cssText = "text-align: center;padding:0px;vertical-align: middle";
    t11.id = "deletes" + rows;
    t1.innerHTML = '<input id="type' + rows + '" name="type' + rows + '" type="text" class="td-input" />';
    t2.innerHTML = '<input id="dv' + rows + '" name="dv' + rows + '" type="text" class="td-input" />';
    t3.innerHTML = '<input type="text" class="td-input" value="<" readonly="true" />';
    t4.innerHTML = '<input id="number' + rows + '" name="number' + rows + '" type="number" onmousewheel="return false;" class="td-input" />';
    t5.innerHTML = '<input id="out' + rows + '" name="out' + rows + '" type="text" class="td-input" />';
    t6.innerHTML = '<input id="prv' + rows + '" name="prv' + rows + '" type="text" class="td-input" />';
    t7.innerHTML = '<input id="num' + rows + '" name="num' + rows + '" type="number" onmousewheel="return false;" class="td-input" />';
    t8.innerHTML = '<input type="text" class="td-input" value="<" readonly="true" />';
    t9.innerHTML = '<input id="numbers' + rows + '" name="numbers' + rows + '" type="text" class="td-input" />';
    t10.innerHTML = '<input id="pp' + rows + '" name="pp' + rows + '" type="number" onmousewheel="return false;" class="td-input" />';
    t11.innerHTML = '<a href="javascript:deleteDosage(' + rows + ');"><i class="fa fa-fw fa-minus-circle" style="font-size:18px;"></i></a>';
    bb = rows;
    document.getElementById("bb").value =bb;
}
//计划行删除
function deleteDosagePriority(row) {
    var table = document.getElementById("Priority");
    var maxrow = table.rows.length;
    //var row = Number(currentbutton.id.replace(/[^0-9]/ig, ""));
    for (var i = row + 1; i < maxrow - 1; i++) {
        var j = i - 1;
        var td1 = document.getElementById("Prioritytype" + i);
        td1.id = "Prioritytype" + j;
        td1.name = "Prioritytype" + j;
        var td2 = document.getElementById("Priorityout" + i);
        td2.id = "Priorityout" + j;
        td2.name = "Priorityout" + j;
        var td3 = document.getElementById("Prioritptv" + i);
        td3.id = "Prioritptv" + j
        td3.name = "Prioritptv" + j;
        var td4 = document.getElementById("Prioritcgy" + i);
        td4.id = "Prioritcgy" + j;
        td4.name = "Prioritcgy" + j;
        var td5 = document.getElementById("Priorittime" + i);
        td5.id = "Priorittime" + j;
        td5.name = "Priorittime" + j;
        var td6 = document.getElementById("Prioritsum" + i);
        td6.id = "Prioritsum" + j;
        td6.name = "Prioritsum" + j;
        var td7 = document.getElementById("Prioritremark" + i);
        td7.id = "Prioritremark" + j;
        td7.name = "Prioritremark" + j;
        var td8 = document.getElementById("Priorit" + i);
        td8.id = "Priorit" + j;
        td8.name = "Priorit" + j;        
        var td9 = document.getElementById("delete" + i);
        td9.id = "delete" + j;
        td9.innerHTML = '<a  href="javascript:deleteDosagePriority(' + j + ');"><i class="fa fa-fw fa-minus-circle" style="font-size:18px;"></i></a>';;
    }
    table.deleteRow(row + 1);
    aa--;
    document.getElementById("aa").value=aa;
}

function toTime(minute) {
    var hour = parseInt(parseInt(minute) / 60);
    var min = parseInt(minute) - hour * 60;
    return hour.toString() + ":" + (min < 10 ? "0" : "") + min.toString();
}
//危机器官行删除
function deleteDosage(row) {
    var table = document.getElementById("Dosage");
    var maxrow = table.rows.length;
    //var row = Number(currentbutton.id.replace(/[^0-9]/ig, ""));
    for (var i = row + 1; i < maxrow - 1; i++) {
        var j = i - 1;
        var td1 = document.getElementById("type" + i);
        td1.id = "type" + j;
        td1.name = "type" + j;
        var td2 = document.getElementById("dv" + i);
        td2.id = "dv" + j;
        td2.name = "dv" + j;

        var td4 = document.getElementById("number" + i);
        td4.id = "number" + j;
        td4.name = "number" + j;
        var td5 = document.getElementById("out" + i);
        td5.id = "out" + j;
        td5.name = "out" + j;
        var td6 = document.getElementById("prv" + i);
        td6.id = "prv" + j;
        td6.name = "prv" + j;
        var td7 = document.getElementById("num" + i);
        td7.id = "num" + j;
        td7.name = "num" + j;
        var td9 = document.getElementById("numbers" + i);
        td9.id = "numbers" + j;
        td9.name = "numbers" + j;
        var td10 = document.getElementById("pp" + i);
        td10.id = "pp" + j;
        td10.name = "pp" + j;        
        var td11 = document.getElementById("deletes" + i);
        td11.id = "deletes" + j;
        td11.innerHTML = '<a  href="javascript:deleteDosage(' + j + ');"><i class="fa fa-fw fa-minus-circle" style="font-size:18px;"></i></a>';;
    }
    table.deleteRow(row + 1);
    bb--;
    document.getElementById("bb").value = bb;
}

function toTime(minute) {
    var hour = parseInt(parseInt(minute) / 60);
    var min = parseInt(minute) - hour * 60;
    return hour.toString() + ":" + (min < 10 ? "0" : "") + min.toString();
}
//清楚所有子节点
function RemoveAllChild(area) {
    while (area.hasChildNodes()) {
        var first = area.firstChild;
        if (first != null && first != undefined)
            area.removeChild(first);
    }
}



//删除某节点的所有子节点
function removeUlAllChild(evt) {
    while (evt.hasChildNodes()) {
        evt.removeChild(evt.firstChild);
    }
}


function getUserName() {
    var xmlHttp = new XMLHttpRequest();
    var url = "GetUserName.ashx";
    xmlHttp.open("GET", url, false);
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {//正常响应
            if (xmlHttp.status == 200) {//正确接受响应数据
                userName = xmlHttp.responseText;
            }
        }
    }
    xmlHttp.send();
}
function getUserID() {
    var xmlHttp = new XMLHttpRequest();
    var url = "GetUserID.ashx";
    xmlHttp.open("GET", url, false);
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {//正常响应
            if (xmlHttp.status == 200) {//正确接受响应数据
                userID = xmlHttp.responseText;
                //alert(userID);                
            }

        }
    }

    xmlHttp.send();
}



//保存计划
function save() {
    if (document.getElementById("technology").value == "allItem") {
        window.alert("治疗技术没有选择");
        return false;
    }
    if (document.getElementById("splitway").value == "allItem" || document.getElementById("splitway").value == "" || document.getElementById("splitway").value == "0") {
        window.alert("分割方式没有设置");
        return false;
    }
    if (document.getElementById("equipment").value == "allItem" || document.getElementById("equipment").value == "" || document.getElementById("equipment").value == "0") {
        window.alert("放疗设备没有选择");
        return false;
    }
    if ((typeof (userID) == "undefined")) {
        if (confirm("用户身份已经失效,是否选择重新登录?")) {
            parent.window.location.href = "/RadiotherapyPlatform/pages/Login/Login.aspx";
        }
    }
    var form = new FormData(document.getElementById("savedesign"));
    $.ajax({
        url: "designApplyRecord.ashx",
        type: "post",
        data: form,
        processData: false,
        async: false,
        contentType: false,
        success: function (data) {
            if (data == "success") {
                alert("保存成功");
            } else {
                alert("保存失败");
                return false;
            }
            window.location.reload();
        },
        error: function (e) {
            window.location.href = "Error.aspx";
        },
        failure: function (e) {
            window.location.href = "Error.aspx";   
        }
    });
}
//保存模板
function saveTemplate(TemplateName) {
    if (document.getElementById("technology").value == "allItem") {
        window.alert("治疗技术没有选择");
        return false;
    }
    if (document.getElementById("splitway").value == "allItem") {
        window.alert("分割方式没有设置");
        return false;
    }
    if (document.getElementById("equipment").value == "allItem") {
        window.alert("放疗设备没有选择");
        return false;
    }
    if ((typeof (userID) == "undefined")) {
        if (confirm("用户身份已经失效,是否选择重新登录?")) {
            parent.window.location.href = "/RadiotherapyPlatform/pages/Login/Login.aspx";
        }
    }  
    document.getElementById("templatename").value = TemplateName;
    var form = new FormData(document.getElementById("savedesign"));
    $.ajax({
        url: "designApplytemplate.ashx",
        type: "post",
        data: form,
        processData: false,
        contentType: false,
        async: false,
        success: function (data) {
            if (data == "success") {
                alert("保存成功");
            } else {
                alert("保存失败");
                return false;
            }
        },
        error: function (e) {
            window.location.href = "Error.aspx";
        },
        failure: function (e) {
            window.location.href = "Error.aspx";
        }
    });
}

function sex(evt) {
    if (evt == "F")
        return "女";
    else
        return "男";
}

//回退按钮



function dateformat(format) {
    var year = format.getFullYear();
    var month = format.getMonth() + 1;
    var day = format.getDate();
    var hour = format.getHours();
    var minute = format.getMinutes();
    if (minute < 10) {
        minute = "0" + minute;
    }
    var time = year + "年" + month + "月" + day + "日 " + hour + "：" + minute;
    return time;
}
//编辑取消disabled
function remove() {
    document.getElementById("Remarks").removeAttribute("disabled");
    document.getElementById("splitway").removeAttribute("disabled");
    //document.getElementById("Priority").removeAttribute("disabled");
    //document.getElementById("Dosage").removeAttribute("disabled");
    document.getElementById("technology").removeAttribute("disabled");
    document.getElementById("equipment").removeAttribute("disabled");
    if (ti == 1) {
        var patient = getPatientInfo(treatID);
        var designInfo = getDesignInfo(treatID);
        var item = "Priority";
        var table = document.getElementById(item);
        var item1 = "Dosage";
        var table1 = document.getElementById(item1);
        for (var i = 0; i < designInfo.length; i++) {
            if (patient.Treatmentname == designInfo[i].treatmentname) {
                addDosagePriority1(designInfo[i].DosagePriority);
                addDosage1(designInfo[i].Dosage);
                table.rows[0].cells[table.rows[0].cells.length - 1].children[0].href = "javascript:addDosagePriority();";
                table1.rows[0].cells[table1.rows[0].cells.length - 1].children[0].href = "javascript:addDosage();";
            }
        }
    }
}
//分割方式选择
function createSplitway(thiselement) {
    var getsplitwayItem = JSON.parse(getsplitway()).Item;
    thiselement.options.length = 0;
    thiselement.options[0] = new Option("-- 分割方式--");
    thiselement.options[0].value = "allItem";
    for (var i = 0; i < getsplitwayItem.length; i++) {
        if (getsplitwayItem[i] != "") {
            thiselement.options[i + 1] = new Option(getsplitwayItem[i].Ways);
            thiselement.options[i + 1].value = parseInt(getsplitwayItem[i].ID);
        }
    }
    if (getsplitwayItem[0].defaultItem != "") {
        thiselement.value = getsplitwayItem[0].defaultItem;
    }
}
function getsplitway() {
    var xmlHttp = new XMLHttpRequest();
    var url = "getsplitwayItem.ashx";
    xmlHttp.open("GET", url, false);
    xmlHttp.send();
    var Items = xmlHttp.responseText;
    return Items;
}

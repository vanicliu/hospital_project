/*控制输入框的输入*/
$(function showInput() {
    $(".Rank :text").hide();
    $(".Rank :checkbox").click(function () {
        if ($(this).is(":checked")) {
            $(this).next().next().show();
        }
        else {
            $(this).next().next().hide();
        }
    });
})
$("#dorank").hide();
/*将每个字段的归一化结果传给前台*/
$("#rank").click(function () {
    //document.getElementById("rankResult").style.display = "";
    var rankValue = $("#totalAsstes").val();
    var rankValue2 = $("#income").val();
    var rankValue3 = $("#researchInvestment").val();
    var rankValue4 = $("#brandValue").val();
    var rankValue5 = $("#currentAssets").val();
    var rankValue6 = $("#moneyBound").val();
    var rankValue7 = $("#fixedAssets").val();
    var rankValue8 = $("#non-currentAssets").val();
    var rankValue9 = $("#totalProfit").val();
    var rankValue10 = $("#profit-tonswine").val();
    var rankValue11 = $("#perProfit").val();
    var rankValue12 = $("#perIncome").val();
    var sum1 = 0;
    for (var i = 0; i < $(".Rank :checked").length; i++)
    {
        sum1 = sum1 + $(".Rank :checked").eq(i).next().next().val() * 1;
        sum = parseFloat(sum1).toFixed(1)
    }/*计算权值，确保权值之和为1*/
    if (sum != 1) {
        alert("请确认所有权值之和是否为1");
        document.getElementById("rankResult").style.display = "none";
    }
    else {/*确定最大指标选取数为10*/
        if ($(".Rank :checked").length > 10) {
            alert("最多只可选取10个指标！");
            document.getElementById("rankResult").style.display = "none";
        }
        else {
            alert("排名计算中...");
            alert("排名计算成功，请点击显示排名！");
            if ($("#TAcheck").is(":checked")) {
                if (rankValue == "") {
                    alert("请输入该指标的权值");
                }
                else {/*Ajax将后台单一字段排名回传给前端*/
                    $.ajax({
                        type: "POST",
                        url: "rankTA.ashx",
                        async: false,
                        dataType: "html",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            var RankJson = $.parseJSON(data);
                            var $ranktr = $("#ranktr");
                            var rankTable = "";
                            for (var i = 0; i < RankJson.length; i++) {
                                // var j = i + 1;
                                rankTable += '<tr><td></td><td>' + RankJson[i].enterprise + '</td><td>' + RankJson[i].totalassets * rankValue + '</td></tr>';
                            }
                            $ranktr.append(rankTable);
                        },
                        error: function () {
                            alert("请求出错处理");
                        }
                    });
                }
            }
            if ($("#incomecheck").is(":checked")) {
                if (rankValue2 == "") {
                    alert("请输入该指标的权值");
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "rankIncome.ashx",
                        async: false,
                        dataType: "html",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            var RankJson = $.parseJSON(data);
                            var $ranktr = $("#ranktr");
                            var rankTable = "";
                            for (var i = 0; i < RankJson.length; i++) {
                                //var j = i + 1;
                                rankTable += '<tr class="hiderank"><td></td><td>' + RankJson[i].company + '</td><td>' + RankJson[i].income * rankValue2 + '</td></tr>';
                            }
                            $ranktr.append(rankTable);
                        },
                        error: function () {
                            alert("请求出错处理");
                        }
                    });
                }
            }
            if ($("#RIcheck").is(":checked")) {
                if (rankValue3 == "") {
                    alert("请输入该指标的权值");
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "rankRI.ashx",
                        dataType: "html",
                        async: false,
                        contentType: "application/json;charset=utf-8",
                        success: function (data) {
                            var RankJson = $.parseJSON(data);
                            var $ranktr = $("#ranktr");
                            var rankTable = "";
                            for (var i = 0; i < RankJson.length; i++) {
                                rankTable += '<tr class="hiderank"><td></td><td>' + RankJson[i].enterprise + '</td><td>' + RankJson[i].RdInvestment * rankValue3 + '</td></tr>';
                            }
                            $ranktr.append(rankTable);
                        },
                        error: function () {
                            alert("请求出错处理");
                        }
                    });
                }
            }
            if ($("#BVcheck").is(":checked")) {
                if (rankValue4 == "") {
                    alert("请输入该指标的权值");
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "rankPS.ashx",
                        dataType: "html",
                        async: false,
                        contentType: "application/json;charset=utf-8",
                        success: function (data) {
                            var RankJson = $.parseJSON(data);
                            var $ranktr = $("#ranktr");
                            var rankTable = "";
                            for (var i = 0; i < RankJson.length; i++) {
                                rankTable += '<tr class="hiderank"><td></td><td>' + RankJson[i].company + '</td><td>' + RankJson[i].persale * rankValue4 + '</td></tr>';
                            }
                            $ranktr.append(rankTable);
                        },
                        error: function () {
                            alert("请求出错处理");
                        }
                    });
                }
            }
            if ($("#CAcheck").is(":checked")) {
                if (rankValue5 == "") {
                    alert("请输入该指标的权值");
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "rankCA.ashx",
                        dataType: "html",
                        async: false,
                        contentType: "application/json;charset=utf-8",
                        success: function (data) {
                            var RankJson = $.parseJSON(data);
                            var $ranktr = $("#ranktr");
                            var rankTable = "";
                            for (var i = 0; i < RankJson.length; i++) {
                                rankTable += '<tr class="hiderank"><td></td><td>' + RankJson[i].company + '</td><td>' + RankJson[i].currentassets * rankValue5 + '</td></tr>';
                            }
                            $ranktr.append(rankTable);
                        },
                        error: function () {
                            alert("请求出错处理");
                        }
                    });
                }
            }
            if ($("#MBcheck").is(":checked")) {
                if (rankValue6 == "") {
                    alert("请输入该指标的权值");
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "rankMB.ashx",
                        dataType: "html",
                        async: false,
                        contentType: "application/json;charset=utf-8",
                        success: function (data) {
                            var RankJson = $.parseJSON(data);
                            var $ranktr = $("#ranktr");
                            var rankTable = "";
                            for (var i = 0; i < RankJson.length; i++) {
                                rankTable += '<tr class="hiderank"><td></td><td>' + RankJson[i].company + '</td><td>' + RankJson[i].moneyfunds * rankValue6 + '</td></tr>';
                            }
                            $ranktr.append(rankTable);
                        },
                        error: function () {
                            alert("请求出错处理");
                        }
                    });
                }
            }
            if ($("#FAcheck").is(":checked")) {
                if (rankValue7 == "") {
                    alert("请输入该指标的权值");
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "rankFA.ashx",
                        dataType: "html",
                        async: false,
                        contentType: "application/json;charset=utf-8",
                        success: function (data) {
                            var RankJson = $.parseJSON(data);
                            var $ranktr = $("#ranktr");
                            var rankTable = "";
                            for (var i = 0; i < RankJson.length; i++) {
                                rankTable += '<tr class="hiderank"><td></td><td>' + RankJson[i].company + '</td><td>' + RankJson[i].fixedassets * rankValue7 + '</td></tr>';
                            }
                            $ranktr.append(rankTable);
                        },
                        error: function () {
                            alert("请求出错处理");
                        }
                    });
                }
            }
            if ($("#NCAcheck").is(":checked")) {
                if (rankValue8 == "") {
                    alert("请输入该指标的权值");
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "rankNCA.ashx",
                        dataType: "html",
                        async: false,
                        contentType: "application/json;charset=utf-8",
                        success: function (data) {
                            var RankJson = $.parseJSON(data);
                            var $ranktr = $("#ranktr");
                            var rankTable = "";
                            for (var i = 0; i < RankJson.length; i++) {
                                rankTable += '<tr class="hiderank"><td></td><td>' + RankJson[i].company + '</td><td>' + RankJson[i][`non-currentassets`] * rankValue8 + '</td></tr>';
                            }//注意要转义！
                            $ranktr.append(rankTable);
                        },
                        error: function () {
                            alert("请求出错处理");
                        }
                    });
                }
            }
            if ($("#TPcheck").is(":checked")) {
                if (rankValue9 == "") {
                    alert("请输入该指标的权值");
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "rankTP.ashx",
                        dataType: "html",
                        async: false,
                        contentType: "application/json;charset=utf-8",
                        success: function (data) {
                            var RankJson = $.parseJSON(data);
                            var $ranktr = $("#ranktr");
                            var rankTable = "";
                            for (var i = 0; i < RankJson.length; i++) {
                                rankTable += '<tr class="hiderank"><td></td><td>' + RankJson[i].company + '</td><td>' + RankJson[i].totalprofit * rankValue9 + '</td></tr>';
                            }//注意要转义！
                            $ranktr.append(rankTable);
                        },
                        error: function () {
                            alert("请求出错处理");
                        }
                    });
                }
            }
            if ($("#PTcheck").is(":checked")) {
                if (rankValue10 == "") {
                    alert("请输入该指标的权值");
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "rankPT.ashx",
                        dataType: "html",
                        async: false,
                        contentType: "application/json;charset=utf-8",
                        success: function (data) {
                            var RankJson = $.parseJSON(data);
                            var $ranktr = $("#ranktr");
                            var rankTable = "";
                            for (var i = 0; i < RankJson.length; i++) {
                                rankTable += '<tr class="hiderank"><td></td><td>' + RankJson[i].company + '</td><td>' + RankJson[i][`profit-tonswine`] * rankValue10 + '</td></tr>';
                            }//注意要转义！
                            $ranktr.append(rankTable);
                        },
                        error: function () {
                            alert("请求出错处理");
                        }
                    });
                }
            }
            if ($("#PPcheck").is(":checked")) {
                if (rankValue11 == "") {
                    alert("请输入该指标的权值");
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "rankPP.ashx",
                        dataType: "html",
                        async: false,
                        contentType: "application/json;charset=utf-8",
                        success: function (data) {
                            var RankJson = $.parseJSON(data);
                            var $ranktr = $("#ranktr");
                            var rankTable = "";
                            for (var i = 0; i < RankJson.length; i++) {
                                rankTable += '<tr class="hiderank"><td></td><td>' + RankJson[i].company + '</td><td>' + RankJson[i].perprofit * rankValue11 + '</td></tr>';
                            }//注意要转义！
                            $ranktr.append(rankTable);
                        },
                        error: function () {
                            alert("请求出错处理");
                        }
                    });
                }
            }
            if ($("#PIcheck").is(":checked")) {
                if (rankValue12 == "") {
                    alert("请输入该指标的权值");
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "rankPI.ashx",
                        dataType: "html",
                        async: false,
                        contentType: "application/json;charset=utf-8",
                        success: function (data) {
                            var RankJson = $.parseJSON(data);
                            var $ranktr = $("#ranktr");
                            var rankTable = "";
                            for (var i = 0; i < RankJson.length; i++) {
                                rankTable += '<tr class="hiderank"><td></td><td>' + RankJson[i].company + '</td><td>' + RankJson[i].perincome * rankValue12 + '</td></tr>';
                            }//注意要转义！
                            $ranktr.append(rankTable);
                        },
                        error: function () {
                            alert("请求出错处理");
                        }
                    });
                }
            }
        }
      
    }

    $("#rank").hide();
    $("#dorank").show();
})
/*对页面进行排序整理*/
$("#dorank").click(function () {
    $("#table-1").show();
    var tr = $("#ranktr tr");
    var sum1 = 0;
    var sum2 = 0;
    var sum3 = 0;
    var sum4 = 0;
    var sum5 = 0;
    var sum6 = 0;
    var sum7 = 0;
    var sum8 = 0;
    var sum9 = 0;
    var sum10 = 0;
    var sum11 = 0;
    var sum12 = 0;
    var sum13 = 0;
    var sum14 = 0;
    var sum15 = 0;
    var sum16 = 0;
    var sum17 = 0;
    var sum18 = 0;
    tr.each(function () {/*对企业名称相同的分数进行相加求和*/
        var rank_enterprise1 = "四川水井坊";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise1) >= 0) {
            sum1 += $(this).find("td").eq(2).text() * 1;/*将td的值数字化*/
            $(this).find("td").eq(2).html(sum1);
        }
        var rank_enterprise2 = "四川沱牌舍得";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise2) >= 0) {
            sum2 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum2);
        }
        var rank_enterprise3 = "四川省宜宾五粮液";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise3) >= 0) {
            sum3 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum3);
        }
        var rank_enterprise4 = "安徽口子酒业";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise4) >= 0) {
            sum4 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum4);
        }
        var rank_enterprise5 = "安徽古井贡酒";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise5) >= 0) {
            sum5 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum5);
        }
        var rank_enterprise6 = "安徽迎驾贡酒";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise6) >= 0) {
            sum6 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum6);
        }
        var rank_enterprise7 = "安徽金种子";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise7) >= 0) {
            sum7 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum7);
        }
        var rank_enterprise8 = "山西杏花村";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise8) >= 0) {
            sum8 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum8);
        }
        var rank_enterprise9 = "新疆伊力特";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise9) >= 0) {
            sum9 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum9);
        }
        var rank_enterprise10 = "江苏今世缘";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise10) >= 0) {
            sum10 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum10);
        }
        var rank_enterprise11 = "江苏洋河酒厂";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise11) >= 0) {
            sum11 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum11);
        }
        var rank_enterprise12 = "河北衡水老白干";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise12) >= 0) {
            sum12 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum12);
        }
        var rank_enterprise13 = "泸州老窖";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise13) >= 0) {
            sum13 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum13);
        }
        var rank_enterprise14 = "甘肃皇台";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise14) >= 0) {
            sum14 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum14);
        }
        var rank_enterprise15 = "贵州茅台";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise15) >= 0) {
            sum15 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum15);
        }
        var rank_enterprise16 = "酒鬼酒";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise16) >= 0) {
            sum16 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum16);
        }
        var rank_enterprise17 = "金徽酒";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise17) >= 0) {
            sum17 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum17);
        }
        var rank_enterprise18 = "青海互助青稞酒";
        if ($(this).find("td").eq(1).text().indexOf(rank_enterprise18) >= 0) {
            sum18 += $(this).find("td").eq(2).text() * 1;
            $(this).find("td").eq(2).html(sum18);
        }
    });
    //$("tr:not(.hiderank)").remove();
    var length = $("#ranktr tr").length;
    /*留下最后的加权总和*/
    for (var m = length - 19; m>=0; m--) {
        $("#ranktr tr").eq(m).remove();
    }
    /*对表中企业进行冒泡排序，确定排名*/
    var temp;
    var enterprise;
    for (var i = 0; i < length-1; i++) {
        for (var j = 0; j < length - 1 - i; j++) {
            if ($("#ranktr tr").eq(j).find("td").eq(2).text()*1 < $("#ranktr tr").eq(j + 1).find("td").eq(2).text()*1) {
                temp = $("#ranktr tr").eq(j).find("td").eq(2).text()*1;
                enterprise = $("#ranktr tr").eq(j).find("td").eq(1).text();
                $("#ranktr tr").eq(j).find("td").eq(2).html($("#ranktr tr").eq(j + 1).find("td").eq(2).text()*1);
                $("#ranktr tr").eq(j).find("td").eq(1).html($("#ranktr tr").eq(j + 1).find("td").eq(1).text());
                $("#ranktr tr").eq(j + 1).find("td").eq(2).html(temp);
                $("#ranktr tr").eq(j + 1).find("td").eq(1).html(enterprise);
            }
        }
    }//页面冒泡排序
    for (var k = 1; k <= length; k++) {
        $("#ranktr tr").eq(k-1).find("td").eq(0).html(k);
    }
    tr.each(function () {
        var score = $(this).find("td").eq(2).text();
        var score1 = parseFloat(score).toFixed(3);
        $(this).find("td").eq(2).html(score1);
    });//将分数限制在小数点后三位
    $("#dorank").hide();
})


   
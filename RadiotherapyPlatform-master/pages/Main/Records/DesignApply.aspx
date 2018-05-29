﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DesignApply.aspx.cs" Inherits="pages_Main_Records_DesignApply" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>治疗计划申请</title>
    <!-- css -->
    <link rel="stylesheet" href="/RadiotherapyPlatform/css/Main/Records.css"/>
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="/RadiotherapyPlatform/plugin/AdminLTE/bootstrap/css/bootstrap.min.css"/>
    <!-- DataTables -->
    <link rel="stylesheet" href="/RadiotherapyPlatform/plugin/AdminLTE/plugins/datatables/dataTables.bootstrap.css"/>
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="/RadiotherapyPlatform/plugin/AdminLTE/plugins/datepicker/datepicker3.css"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/RadiotherapyPlatform/plugin/AdminLTE/plugins/font-awesome/css/font-awesome.min.css"/>
    <!-- Ionicons -->
    <link rel="stylesheet" href="/RadiotherapyPlatform/plugin/AdminLTE/plugins/ionicons/css/ionicons.min.css"/>
    <!-- AdminLTE Skins. Choose a skin from the css/skins
    folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/RadiotherapyPlatform/plugin/AdminLTE/dist/css/skins/_all-skins.min.css"/>
</head>
<body style="width:auto;min-width:900px;margin:auto;">
   <section class="content">
        <div class="paper" id="needPrint">
            <form id="savedesign" name="savedesign" method="post" runat="server" >
                    <input type="hidden" name="ispostback" value="true" />             
                    <input type="hidden"  id="hidetreatID" name="hidetreatID" />
                    <input type="hidden"  id="userID" name="userID" />
                    <input type="hidden" id="diaguserid" name="diaguserid" />
                    <input type="hidden"  id="aa" name="aa" />
                    <input type="hidden"  id="bb" name="bb" />  
                    <input type="hidden"  id="templatename" name="templatename" />             
            <input type="hidden" id="progress" name="progress"/>
            <div class="paper-title">
                 治疗计划申请
            </div>
            <div class="paper-content">
                <div class="content-title">
                    <span>基本信息：</span>
                </div>
                <div class="single-row">
                    <div class="item col-xs-4">姓名：<span id="username" class="underline"></span></div>
                    <div class="item col-xs-4">性别：<span id="sex" class="underline"></span></div>
                    <div class="item col-xs-4">年龄：<span id="age" class="underline"></span></div>
                </div>
                 <div class="single-row">
                        <div class="item col-xs-4">放疗号：<span id="radiotherapy" class="underline"></span></div>
                       <div class="item col-xs-4">疗程：<span id="treatID" class="underline"></span></div>
                       <div class="item col-xs-4">主管医生：<span id="Reguser" class="underline"></span></div>
                </div>
                  <div class="single-row">
                        <div class="item col-xs-4">诊断结果：<span id="diagnosisresult"  class="underline"></span></div>
                      <div class="item col-xs-4">照射部位：<span id="lightpart" class="underline"></span></div>
                        <div class="item col-xs-4">住院情况：<span id="hospitalid" class="underline"></span></div> 
                  </div>
            </div>
    
            <div class="paper-content"> 
                <div class="content-title">
                    <span>填写计划申请信息：</span>
                </div>
                <div class="single-row tab-row">
                        <ul id="tabs" class="nav nav-tabs">
                            <li class="active"><a id="current-tab" href="#tab" data-toggle="tab" aria-expanded="true"></a></li>
                        </ul>
                </div>
                <div id="tab-content" class="tab-content">
                <div class="tab-pane active" id="tab">
                <div class="single-row">
                    <div class="item area-group col-xs-12">
                       <span class="col-xs-2" style="padding-left:0px;">特殊情况(放疗史)：</span>
                        <textarea id="Remarks" name="Remarks" class="form-area" style="width:80%;" disabled="disabled"></textarea>
                    </div>
                </div>
                <div class="single-row">
                    <div class="col-xs-6" style="padding-left:0px;">
                        <span class="form-text col-xs-5">靶区处方剂量：</span>
                    </div>
                </div>
                <div class="single-row">
                    <div class="item area-group col-xs-12">
                        <table id="Priority" class="table table-bordered" style="table-layout:fixed;word-wrap:break-word;" >
                            <thead>
                                <tr>
                                    <th>靶区</th>
                                    <th>外放/mm</th>
                                    <th>PTV</th>
                                    <th>单次量cGy</th>
                                    <th>次数</th>
                                    <th>总剂量cGy</th>
                                    <th>体积/%</th>
                                    <th>优先级</th>
                                    <th style="text-align: center;">
                                        <a href="javascript:addDosagePriority();"><i class="fa fa-fw fa-plus-circle" style="font-size:18px;"></i></a>
                                    </th>
                                </tr>
                            </thead>
                            <tbody style="text-align:center;">
                                <tr>
                                    <td style="padding:0px;">
                                        <input id="Prioritytype0" name="Prioritytype0" type="text" class="td-input" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input id="Priorityout0" name="Priorityout0" type="text" class="td-input" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input id="Prioritptv0" name="Prioritptv0" type="text" class="td-input" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input id="Prioritcgy0" name="Prioritcgy0" type="number" onmousewheel="return false;" class="td-input" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input id="Priorittime0" name="Priorittime0" type="number" onmousewheel="return false;" class="td-input" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input id="Prioritsum0" name="Prioritsum0" type="number" onmousewheel="return false;" class="td-input" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input id="Prioritremark0" name="Prioritremark0" type="text" class="td-input" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input id="Priorit0" name="Priorit0" type="number" onmousewheel="return false;" class="td-input" />
                                    </td>
                                    <td id="delete0" style="text-align: center;padding:0px;vertical-align: middle;">
                                        <a  href="javascript:deleteDosagePriority(0);"><i class="fa fa-fw fa-minus-circle" style="font-size:18px;"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="single-row">
                    <div class="col-xs-6" style="padding-left:0px;">
                        <span class="form-text col-xs-5">危及器官限量：</span>
                    </div>
                </div>
                <div class="single-row">
                    <div class="item area-group col-xs-12">
                        <table id="Dosage" class="table table-bordered" style="table-layout:fixed;word-wrap:break-word;">
                            <thead>
                                <tr>
                                    <th>危及器官</th>
                                    <th>剂量cGy</th>
                                    <th>限制</th>
                                    <th>体积/%</th>
                                    <th>外放mm</th>
                                    <th>PRV</th>
                                    <th>剂量cGy</th>
                                    <th>限制</th>
                                    <th>体积/%</th>
                                    <th>优先级</th>
                                    <th style="text-align: center;">
                                        <a href="javascript:addDosage();"><i class="fa fa-fw fa-plus-circle" style="font-size:18px;"></i></a>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="padding:0px;">
                                        <input id="type0" name="type0" type="text" class="td-input" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input id="dv0" name="dv0" type="text" class="td-input" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input type="text" class="td-input" value="<" readonly="true" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input id="number0" name="number0" type="number" onmousewheel="return false;" class="td-input" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input  id="out0" name="out0" type="text" class="td-input" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input id="prv0" name="prv0" type="text" class="td-input" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input id="num0" name="num0" type="text" class="td-input" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input type="text" class="td-input" value="<" readonly="true" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input id="numbers0" name="numbers0" type="number" onmousewheel="return false;" class="td-input" />
                                    </td>
                                    <td style="padding:0px;">
                                        <input id="pp0" name="pp0" type="number" onmousewheel="return false;" class="td-input" />
                                    </td>
                                    <td id="deletes0" style="text-align: center;padding:0px;vertical-align: middle;">
                                        <a href="javascript:deleteDosage(0);"><i class="fa fa-fw fa-minus-circle" style="font-size:18px;"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="single-row">
                    <div class="col-xs-4">
                        <span class="form-text col-xs-4" style="padding-left:0px;">治疗技术：</span>
                        <select id="technology" name="technology" class="form-item" disabled="disabled"></select>
                    </div>
                    <div class="col-xs-4">
                        <span class="form-text col-xs-4" style="padding-left:0px;">放疗设备：</span>
                        <select id="equipment" name="equipment" class="form-item" disabled="disabled"></select>
                    </div>
                     <div class="col-xs-4">
                        <span class="form-text col-xs-4" style="padding-left:0px;">分割方式：</span>
                           <select  id="splitway" disabled="disabled" class="form-item" name="splitway">
                           </select>
                    </div>
                </div>
            </div>
                        </div>
            </div>
            <div class="paper-footer">
                <div class="single-row">
                    <div class="item col-xs-6">医师签字：<span id="applyuser" class="underline"></span></div>
                    <div class="item col-xs-6">申请时间：<span  id="time" class="underline"></span></div>
                </div>
            </div>
        </form>
        </div>
         
    </section>
     <section id="printArea" class="content" style="display:none;width:756px;height:1086px;border:0px;">
                
    </section>
    <!-- jQuery 2.2.3 -->
    <script src="../../../plugin/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="../../../plugin/AdminLTE/plugins/jQueryUI/jquery-ui.min.js"></script>
    <!-- DataTables -->
    <script src="../../../plugin/AdminLTE/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../../plugin/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <!-- JQuery PrintArea -->
    <script src="../../../plugin/AdminLTE/jquery.PrintArea.js"></script>
    <!-- bootstrap datepicker -->
    <script src="../../../plugin/AdminLTE/plugins/datepicker/bootstrap-datepicker.js"></script>
    <!-- SlimScroll -->
    <script src="../../../plugin/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="../../../plugin/AdminLTE/plugins/fastclick/fastclick.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="../../../plugin/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../plugin/AdminLTE/dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../../../plugin/AdminLTE/dist/js/demo.js"></script>
    <script src="../../../js/Main/FixedRecordPrint.js"></script>
    <!-- javascript -->
    <script src="../../../js/Main/DesignApply.js" type="text/javascript"></script>
    <!-- Page script -->
    <script type="text/javascript">
        $("#AppiontDate").datepicker({ autoclose: true });
    </script>
</body>
</html>
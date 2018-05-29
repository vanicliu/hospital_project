﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TreatmentInfoManage.aspx.cs" Inherits="pages_Main_Records_TreatmentInfoManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>疗程修改界面</title>
    <!-- css -->
    <link rel="stylesheet" href="../../../css/Main/Records.css"/>
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="../../../plugin/AdminLTE/bootstrap/css/bootstrap.min.css"/>
    <!-- DataTables -->
    <link rel="stylesheet" href="../../../plugin/AdminLTE/plugins/datatables/dataTables.bootstrap.css"/>
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="../../../plugin/AdminLTE/plugins/datepicker/datepicker3.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../../plugin/AdminLTE/plugins/font-awesome/css/font-awesome.min.css"/>
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../../plugin/AdminLTE/plugins/ionicons/css/ionicons.min.css"/>
    <!-- AdminLTE Skins. Choose a skin from the css/skins
    folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../../plugin/AdminLTE/dist/css/skins/_all-skins.min.css"/>
</head>
<body style="width:auto;min-width:900px;margin:auto;">
    <section class="content">
        <div class="paper">
            <input type="hidden" id="progress" />
            <input type="hidden" id="idforappoint" />
            <div class="paper-title">
                疗程修改界面
            </div>
            <div class="paper-content">
                <div class="content-title">
                    <span>基本信息：</span>
                </div>
                <div class="single-row">
                    <div class="item col-xs-3">姓名：<span id="username" class="underline"></span></div>
                    <div class="item col-xs-3">性别：<span id="sex" class="underline"></span></div>
                    <div class="item col-xs-3">年龄：<span id="age" class="underline"></span></div>
                    <div class="item col-xs-3">民族：<span id="nation" class="underline"></span></div>
                </div>
                <div class="single-row">
                    <div class="item col-xs-6">身份证号：<span id="idnumber" class="underline"></span></div>
                    <div class="item col-xs-6">家庭地址：<span id="address" class="underline"></span></div>
                </div>
                <div class="single-row">
                    <div class="item col-xs-6">联系方式1：<span id="contact" class="underline"></span></div>
                    <div class="item col-xs-6">联系方式2：<span id="contact2" class="underline"></span></div>
                </div>
                <div class="single-row">
                    <div class="item col-xs-6">分中心医院：<span id="hospital" class="underline"></span></div>
                </div>
            </div>
            <div class="paper-content">
                <div class="content-title">
                    <span>病案信息：</span>
                </div>
                <div class="single-row">
                    <div class="item col-xs-4">放疗号：<span id="radiotherapy" class="underline"></span></div>
                    <div class="item col-xs-4">病案号：<span id="RecordNumber"  class="underline"></span></div>
                    <div class="item col-xs-4">住院号：<span id="hospitalid" class="underline"></span></div>
                </div>
                <div class="single-row">
                    <div class="item col-xs-4">疗程：<span id="treatID" class="underline"></span></div>
                    <div class="item col-xs-4">诊断结果：<span id="diagnosisresult"  class="underline"></span></div>
                    <div class="item col-xs-4">所属医生：<span id="Reguser" class="underline"></span></div>
                </div>
            </div>
            <div class="paper-content">
                <div class="content-title">
                    <span>体位固定预约信息：</span>
                </div>
                <div class="single-row">
                    <div class="col-xs-8">
                        <span class="form-text col-xs-3" style="padding-left:0px;">设备与时间：</span>
                        <input id="oldfixappoint" type="hidden" />
                        <input id="fixappointtime"  name="fixappointtime" type="text" class="form-item" readonly="true"  disabled="disabled"/>
                        <button id="changefixappoint" type="button" class="btn btn-default" data-toggle="modal" data-target="#appoint" >修改</button>
                         <button id="deletefixappoint" type="button" class="btn btn-default" >取消</button>
                    </div>
                </div>
            </div>
          <div class="paper-content">
                <div class="content-title">
                    <span>模拟定位预约信息：</span>
                </div>
                <div class="single-row">
                    <div class="col-xs-8">
                        <input id="oldlocateappoint" type="hidden" />
                        <span class="form-text col-xs-3" style="padding-left:0px;">设备与时间：</span>
                        <input id="locateappointtime"  name="appointtime" type="text" class="form-item" readonly="true"  disabled="disabled"/>
                        <button id="changelocateappoint" class="btn btn-default" data-toggle="modal" data-target="#appoint" >修改</button>
                        <button id="deletelocateappoint" type="button" class="btn btn-default" >取消</button>
                    </div>
                </div>
            </div>
         <div class="paper-content">
                <div class="content-title">
                    <span>复位预约信息：</span>
                </div>
                <div class="single-row">
                    <div class="col-xs-8">
                        <input id="oldreplaceappoint" type="hidden" />
                        <span class="form-text col-xs-3" style="padding-left:0px;">设备与时间：</span>
                        <input id="replaceappointtime"  name="appointtime" type="text" class="form-item" readonly="true"  disabled="disabled"/>
                        <button id="changereplaceappoint" class="btn btn-default" data-toggle="modal" data-target="#appoint" >修改</button>
                        <button id="deletereplaceappoint" type="button" class="btn btn-default" >取消</button>
                    </div>
                </div>
            </div>
           <div class="paper-content">
                <div class="content-title">
                    <span>首次加速预约信息：</span>
                </div>
                <div class="single-row">
                    <div class="col-xs-8">
                        <input id="oldaccelerappoint" type="hidden" />
                        <span class="form-text col-xs-3" style="padding-left:0px;">设备与时间：</span>
                        <input id="accelerappointtime"  name="appointtime" type="text" class="form-item" readonly="true"  disabled="disabled"/>
                        <button id="changeaccelerappoint" class="btn btn-default" data-toggle="modal" data-target="#appoint" >修改</button>
                        <button id="deleteaccelerappoint" type="button" class="btn btn-default" >取消</button>
                    </div>
                </div>
            </div>
         <div class="paper-content">
                <div class="content-title">
                    <span id="rest">剩余加速预约信息：</span>
                </div>
             
            </div>

            <div class="paper-footer">
                <div class="single-row">
                    <div class="item col-xs-6">医生签字：<span id="applyuser" class="underline"></span></div>
                    <div class="item col-xs-6">申请时间：<span id="time" class="underline"></span></div>
                </div>
            </div>
        </div>
         <div class="modal fade" id="appoint" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width:700px;margin:50px auto;">
            <div class="panel panel-default" style="max-width:1000px;margin:auto;">
                <div class="panel-heading">
                    <h4 class="modal-title">预约设备与时间窗口</h4>
                </div>
                <div class="panel-body">
                    <div class="panel-row">
                        <div class="item col-xs-5">选择设备：<select id="equipmentName" class="form-item"></select></div>
                        <div class="item col-xs-5">预约时间：<input type="text" id="AppiontDate" class="form-item" /></div>
                        <div class="col-xs-2">
                            <button id="chooseProject" class="btn btn-default">查询该项</button>
                        </div>
                    </div>
                    <div class="panel-row">
                        <table id="apptiontTable" class="table table-bordered col-xs-12"></table>
                    </div>
                    <div class="panel-row">
                        <div class="col-xs-6">
                            <button class="btn btn-default" id="cannel" type="button" data-dismiss="modal" aria-label="Close" >取消</button>
                        </div>
                        <div class="col-xs-6">
                            <button class="btn btn-default" id="sure" type="button" data-dismiss="modal">确定</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     
    </section>
    <!-- jQuery 2.2.3 -->
    <script src="../../../plugin/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="../../../plugin/AdminLTE/plugins/jQueryUI/jquery-ui.min.js"></script>
    <!-- DataTables -->
    <script src="../../../plugin/AdminLTE/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../../plugin/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js"></script>
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
    <!-- javascript -->
    <script src="../../../js/Main/treatmentManage.js" type="text/javascript"></script>
    <!-- Page script -->
    <script type="text/javascript">
        $("#AppiontDate").datepicker({ autoclose: true });
    </script>
</body>
</html>
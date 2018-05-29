﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReplacementRecord.aspx.cs" Inherits="pages_Main_Records_ReplacementRecord" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
            <div class="paper-title">
                复位记录
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
                <div id="inforefer" class="paper-content">
                    <div class="content-title">
                        <span>参考信息：</span>
                    </div>  
                    <div class="single-row">
                     <div class="col-xs-12" style="padding-left:40%;" >
                          <a href="javascript:;"   id="viewpdf"  target="_blank"   class="btn btn-default">查看计划PDF文档</a>
                          <button type="button" class="btn btn-default" id="CTpicture" data-toggle="modal" data-target="#ctpicture">查看模拟定位图片</button>
                     
                     </div>
                    </div>
                </div>
              <form id="saveReplaceRecord" name="saveReplaceRecord" method="post" runat="server" enctype="multipart/form-data"> 
                <input type="hidden" name="ispostback" value="true" />
                <input type="hidden"  id="hidetreatID" name="hidetreatID" />
                <input type="hidden"  id="userID" name="userID" />
                <input type="hidden" id="progress" name="progress" />
                <div class="paper-content">
                    <div class="content-title">
                        <span>复位记录填写：</span>
                    </div>
                     <div class="single-row tab-row">
                            <ul id="tabs" class="nav nav-tabs">
                                <li class="active"><a id="current-tab" href="#tab" data-toggle="tab" aria-expanded="true"></a></li>
                            </ul>
                    </div>
                     <div id="tab-content" class="tab-content">
                    <div class="tab-pane active" id="tab">
                   <div class="single-row">
                    <div class="col-xs-5">
                        <span class="form-text col-xs-5" style="padding-left:0px;">复位要求：</span>
                           <select name="replacementrequire" id="replacementrequire" disabled="disabled" class="form-item" >
                           </select>
                    </div>
                </div>
                    <div class="single-row">
                        <div class="col-xs-6" style="padding-left:0px;">
                            <span class="form-text col-xs-12">参数变化(按照PDF填写)：</span>
                        </div>
                    </div>
                    <div class="single-row">
                        <div class="item area-group col-xs-12">
                            <table id="ReplacementRecord" class="table table-bordered" style="table-layout:fixed;word-wrap:break-word;">
                                <thead>
                                    <tr>
                                        <th>方向</th>
                                        <th>原始中心(cm)</th>
                                        <th>计划中心(cm)</th>
                                        <th>移床参数(cm)</th>
                                        <th>复位结果(cm)</th>
                                        <th>差值(cm)</th>
                                    </tr>
                                </thead>
                                <tbody style="text-align:center;">
                                    <tr>
                                        <td>x</td>
                                        <td style="padding:0px;">
                                            <input id="OriginCenter1" class="td-input" disabled="disabled" type="number" onmousewheel="return false;" name="OriginCenter1"/>
                                        </td>
                                        <td style="padding:0px;">
                                            <input id="PlanCenter1" class="td-input" disabled="disabled" type="number" onmousewheel="return false;" name="PlanCenter1"/>
                                        </td>
                                        <td style="padding:0px;">
                                            <input id="Movement1" class="td-input" disabled="disabled" type="number" onmousewheel="return false;" name="Movement1"/>
                                        </td>
                                        <td style="padding:0px;">
                                            <input id="Result1" class="td-input" disabled="disabled" type="number" onmousewheel="return false;" name="Result1"/>
                                        </td>
                                         <td style="padding:0px;">
                                            <input id="distance1" class="td-input" disabled="disabled" type="number" onmousewheel="return false;" name="distance1"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>y</td>
                                        <td style="padding:0px;">
                                            <input id="OriginCenter2" class="td-input" disabled="disabled" type="number" onmousewheel="return false;" name="OriginCenter2"/>
                                        </td>
                                        <td style="padding:0px;">
                                            <input id="PlanCenter2" class="td-input" disabled="disabled" type="number" onmousewheel="return false;" name="PlanCenter2"/>
                                        </td>
                                        <td style="padding:0px;">
                                            <input id="Movement2" class="td-input" disabled="disabled" type="number" onmousewheel="return false;" name="Movement2"/>
                                        </td>
                                        <td style="padding:0px;">
                                            <input id="Result2" class="td-input" disabled="disabled" type="number" onmousewheel="return false;" name="Result2"/>
                                        </td>
                                        <td style="padding:0px;">
                                            <input id="distance2" class="td-input" disabled="disabled" type="number" onmousewheel="return false;" name="distance2"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>z</td>
                                        <td style="padding:0px;">
                                            <input id="OriginCenter3" class="td-input" disabled="disabled" type="number" onmousewheel="return false;" name="OriginCenter3"/>
                                        </td>
                                        <td style="padding:0px;">
                                            <input id="PlanCenter3" class="td-input" disabled="disabled" type="number" onmousewheel="return false;" name="PlanCenter3"/>
                                        </td>
                                        <td style="padding:0px;">
                                            <input id="Movement3" class="td-input" disabled="disabled" type="number" onmousewheel="return false;" name="Movement3"/>
                                        </td>
                                        <td style="padding:0px;">
                                            <input id="Result3" class="td-input" disabled="disabled" type="number" onmousewheel="return false;" name="Result3"/>
                                        </td>
                                        <td style="padding:0px;">
                                            <input id="distance3" class="td-input" disabled="disabled" type="number" onmousewheel="return false;" name="distance3"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="single-row">
                        <input type="hidden" id="yanzheng" name="yanzheng" value="0" />
                        <div class="item col-xs-12">
                            <span class="col-xs-2" style="padding-left:0px;">验证图像：</span>
                        </div>
                    </div>
                    <div class="single-row">
                        <div class="item col-xs-12">
                            <div id="multipic_yanzheng" class="imgbox multifile">
                                <div id="firstyanzheng" class="boxes">
                                    <div class="imgnum">
                                        <input disabled="disabled" accept="image/jpeg,image/png" type="file" name="f2" class="multifilepath1 filepath" />
                                        <span class="closecamera closearea"><i class="fa fa-times"></i></span>
                                        <img src="../../../img/camera.png" class="camera-picture" />
                                        <img class="img"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="single-row">
                        <div class="item area-group col-xs-12">
                            <span class="col-xs-2" style="padding-left:0px;">备注：</span>
                            <textarea id="Remarks" disabled="disabled" name="Remarks" class="form-area col-xs-10" ></textarea>
                        </div>                                                                 
                    </div>
                    </div>
                   </div>
                 </div>
                <div class="paper-footer">
                <div class="single-row">
                <div class="item col-xs-6">医生签字：<span id="operator" class="underline"></span></div>
                <div class="item col-xs-6">日期：<span id="date" class="underline"></span></div>
                </div> 
                </div> 
            </form> 
     </div>
   <div class="modal fade" id="ctpicture" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="width:700px;margin:50px auto;">
            <div class="panel panel-default" style="max-width:1000px;margin:auto;">
                <div class="panel-heading">
                    <h4 class="modal-title">CT模拟图片查看</h4>
                </div>
                <div id="ctpictureshow" class="panel-body">
                 <div class="single-row">
                        <div class="item col-xs-12">
                            <div id="multipic" class="imgbox multifile">
                                
                            </div>
                        </div>
                    </div>
                   </div>
            </div>
        </div>
         <button id="showPic" class="btn btn-default" data-toggle="modal" data-target="#myModal" style="display:none;"></button>
        <div id="myModal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">查看图片</h4>
                    </div>
                    <div class="modal-body">
                        <img src="" id="pic" class="showPicture" />
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
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
    <!-- bootstrap datepicker -->
    <script src="../../../plugin/AdminLTE/plugins/datepicker/bootstrap-datepicker.js"></script>
     <!-- JQuery PrintArea -->
    <script src="../../../plugin/AdminLTE/jquery.PrintArea.js"></script>
    <!-- SlimScroll -->
    <script src="../../../plugin/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="../../../plugin/AdminLTE/plugins/fastclick/fastclick.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="../../../plugin/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
      <script src="../../../js/Main/ReplaceRecordPrint.js"></script>
    <!-- AdminLTE App -->
    <script src="../../../plugin/AdminLTE/dist/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../../../plugin/AdminLTE/dist/js/demo.js"></script>
    <!-- javascript -->
    <script src="../../../js/Main/replacerecord.js" type="text/javascript"></script>     
    <script src="../../../js/Main/addimgs2.js"></script>                                  
</body>
</html>

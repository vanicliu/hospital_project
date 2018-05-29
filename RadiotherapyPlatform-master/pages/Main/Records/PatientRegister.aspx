﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientRegister.aspx.cs" Inherits="pages_Main_Records_PatientRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>患者信息登记</title>
    <!-- css -->
    <link rel="stylesheet" href="../../../css/Main/Records.css"/>
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="../../../plugin/AdminLTE/bootstrap/css/bootstrap.min.css"/>
    <!-- DataTables -->
    <link rel="stylesheet" href="../../../plugin/AdminLTE/plugins/datatables/dataTables.bootstrap.css"/>
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="../../../plugin/AdminLTE/plugins/datepicker/datepicker3.css"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../../plugin/AdminLTE/plugins/font-awesome/css/font-awesome.min.css"/>
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../../plugin/AdminLTE/plugins/ionicons/css/ionicons.min.css"/>
    <!-- AdminLTE Skins. Choose a skin from the css/skins
    folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../../plugin/AdminLTE/dist/css/skins/_all-skins.min.css"/>
    <!-- Theme style -->
    <link rel="stylesheet" href="../../../plugin/AdminLTE/dist/css/AdminLTE.min.css"/>
    <link rel="stylesheet" href="../../../plugin/cropper/cropper.min.css" />
</head>
<body style="width:auto;width:900px;margin:auto;overflow: auto;">
    <section>
        <div class="paper">
            <div class="paper-title">
                患者信息登记
            </div>
            <form id="frmRegist" name="frmRegist" method="post" runat="server">
                <input type="hidden" name="ispostback" value="true" />
                <input type="hidden" id="progress" name="progress" />
                <input type="hidden" id="picture1" name="picture1" />
               
                <input id="patientID" type="hidden" name="patientID" />
                <input id="treatID" type="hidden" name="treatID" />
                <input id="pic" type="hidden" name="pic" />
                <div class="paper-content">
                    <div class="content-title">
                        <span>基本信息：</span>
                    </div>
                    <div class="head-picture" style=" margin-left:750px;top:130px;">
                        <img id="self-photo" src="../../../img/avatar.jpg" class="camera-picture" />
                        <input id="mypic"  type="file"  style="display:none" accept="image/*" onchange="handleFiles(event)"/> 
                    </div>
                    <div class="card-reader" style="margin-left:727px;top:270px;">
                        <button id="importPhoto" type="button" class="btn btn-info btn-sm btn-flat" style="width:70px;">导入图片</button>
                    </div>
                    <div class="single-row">
                        <div class="item col-xs-3">
                            <div class="item" style="padding-left:0px;">
                                姓名：
                                <input id="userName" name="userName" type="text" class="form-item" disabled="disabled"/>
                            </div>
                        </div>
                        <div class="item col-xs-3">
                            <div class="item" style="padding-left:0px;">
                                拼音：
                                <input id="usernamepingyin" name="usernamepingyin" type="text" class="form-item" disabled="disabled"/>
                            </div>
                        </div>
                        <div class="item col-xs-5" style="padding-top:0px;">
                            <span class="col-xs-3" style="padding-left:0px;">性别：</span>
                            <span class="col-xs-3" style="padding-left:0px;">
                                <input type="radio" name="Gender" id="male" value="M" disabled="disabled"/>
                                男
                            </span>
                            <span class="col-xs-3" style="padding-left:0px;">
                                <input type="radio" name="Gender" id="female" value="F" disabled="disabled"/>
                                女
                            </span>
                        </div>
                    </div>
                    <div class="single-row">
                        <div class="item col-xs-5">
                            民族：
                            <input id="Nation" name="Nation" type="text" class="form-item" disabled="disabled"/>
                        </div>
                        <div class="item col-xs-7">
                            身份证号：
                            <input id="IDcardNumber"  name="IDcardNumber" type="text" class="form-item" disabled="disabled"/>
                        </div>
                    </div>
                    <div class="single-row">
                        <div class="item col-xs-5">
                            出生日期：
                            <input type="text" class="form-item" id="Birthday" name="Birthday" placeholder="选择日期" disabled="disabled"/>
                        </div>
                        <div class="item col-xs-7">
                            地址：
                            <input id="Address"  name="Address" type="text" class="form-item" disabled="disabled"/>
                        </div>
                    </div>
                    <div class="single-row">
                        <div class="item col-xs-5">
                            联系电话1：
                            <input id="Number1" name="Number1" type="text" class="form-item" disabled="disabled"/>
                        </div>
                        <div class="item col-xs-5">
                            联系电话2：
                            <input id="Number2"  name="Number2" type="text" class="form-item" disabled="disabled"/>
                        </div>
                    </div>
                    <div class="single-row">
                        <div class="item col-xs-5">
                            身高：
                            <div class="group-item">
                                <input type="number" onmousewheel="return false;" id="height" name="height" class="form-group-input" disabled="disabled"/>
                                <span class="input-group-addon">cm</span>
                            </div>
                        </div>
                        <div class="item col-xs-5">
                            体重：
                            <div class="group-item">
                                <input type="number" onmousewheel="return false;" id="weight" name="weight" class="form-group-input" disabled="disabled"/>
                                <span class="input-group-addon">kg</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="paper-content">
                    <div class="content-title">
                        <span>病案信息：</span>
                    </div>
                     <div class="single-row">
                            <div class="col-xs-6">
                                <span class="form-text col-xs-4" style="padding-left:0px;">是否住院：</span>
                                <span class="col-xs-2" style="padding-left:0px;">
                                <input  name="RecordNumber" type="radio" value="1"  disabled="disabled"/>是
                                </span>
                                 <span class="col-xs-2" style="padding-left:0px;">
                                <input  name="RecordNumber" type="radio" value="0" disabled="disabled" />否
                               </span>
                            </div>
                            <div id="ishospital" class="col-xs-6">
                               住院号：
                                <input id="hospitalnumber" name="hospitalnumber" type="text" class="form-item" disabled="disabled"/>
                            </div>
                        </div>
                    <div class="single-row">              
                        <div class="item col-xs-6">
                            主管医师：
                            <select id="doctor" name="doctor" class="form-item" disabled="disabled"></select>
                        </div>
                        <div class="item col-xs-6">
                            所属分组：
                            <select id="group" name="group" class="form-item" disabled="disabled">
                                <%--  <option value="allItem">----分组选择-----</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="single-row">
                        <div class="item col-xs-6">
                            分中心医院：
                            <input id="Hospital" name="Hospital" type="text" class="form-item" disabled="disabled"/>
                        </div>
                        <div class="item col-xs-6">
                            分中心负责人：
                            <input id="Sub" name="Sub" type="text" class="form-item" disabled="disabled"/>
                        </div>
                    </div>
                     <div class="single-row">
                            <div class="col-xs-6">
                               放疗号：
                                <input id="radionumber" name="radionumber" class="form-item" disabled="disabled"/>
                            </div>
                     </div>
                </div>
                <div class="paper-content">
                    <div class="content-title">
                        <span>疗程信息：</span>
                    </div>
                    <div class="single-row">
                        <div class="col-xs-6">
                            当前疗程：
                            <span id="currentTreatment"></span>
                        </div>
                        <div class="col-xs-6">
                            疗程状态：
                            <span id="treatmentState"></span>
                        </div>
                    </div>
                    <div class="single-row">
                        <div class="col-xs-6">
                            <button id="addTreatment" class="btn btn-info" type="button">新增疗程</button>
                        </div>
                    </div>
                </div>
                <div class="paper-content">
                    <div class="content-title">
                        <span>预约信息：</span>
                    </div>
                    <div class="single-row">
                        <table id="viewAppoints" class="table" style="text-align:center;">
                            <thead>
                                <tr>
                                    <th>预约项目</th>
                                    <th>预约时间</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
                <div class="paper-footer">
                    <div class="single-row">
                        <div class="item col-xs-6">医师签字：<span id="operator" class="underline">王医生</span></div>
                        <div class="item col-xs-6">登记时间：<span id="date" class="underline">2017年6月28日</span></div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <div id="changeAppoint" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document" style="width:700px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改预约时间</h4>
                </div>
                <div class="modal-body" style="overflow:hidden;">
                   <div class="panel-row">
                             <div class="item col-xs-5">选择设备：<select id="equipmentName" class="form-item"></select></div>
                            <div class="item col-xs-4">预约时间：<input type="text" id="AppiontDate" class="form-item" /></div>
                            <div class="item col-xs-3">
                                <button type="button"  id="previousday" class="btn btn-default btn-sm">上一天</button>
                                <button type="button" id="nextday" class="btn btn-default btn-sm">下一天</button>
                               <%-- <button id="chooseProject" class="btn btn-default">查询该项</button>--%>
                            </div>
                        </div>
                      <div id="timechoose" class="panel-row" style="display:none">
                            <div class="item col-xs-7">时间筛选：<select id="timeselect" name="timeselect" class="form-item">
                                                                   <option value="360-720">06:00-12:00</option>
                                                                    <option value="720-1080">12:00-18:00</option>
                                                                    <option value="1080-1440">18:00-24:00</option>
                                                                    <option value="1440-1800">00:00-06:00(次日)</option>
                                                                  </select>

                            </div>
                            <div class="item col-xs-5" style="padding-left:20px;display:none">是否占用两格：<select id="isspecial" name="isspecial" class="form-item">
                                                                      <option value="0">否</option>
                                                                      <%--<option value="1">是</option>--%>
                                                                  </select>

                            </div>
                         </div>
                     <div id="amappoint" class="panel-row">
                        <div id="amlabel">
                            <span class="label label-info" style="float:left;width:10%;height:auto" >上午</span>
                        </div>
                            <table id="apptiontTable" class="table table-bordered col-xs-12" style="table-layout:fixed;word-wrap:break-word;"></table>
                        </div>
                          <div id="pmappoint" class="panel-row">
                         <div id="pmlabel" >
                            <span class="label label-info" style="float:left;width:10%;height:auto" >下午</span>
                        </div>
                            <table id="apptiontTableForPm" class="table table-bordered col-xs-12" style="table-layout:fixed;word-wrap:break-word;"></table>
                        </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" id="cannel" type="button" data-dismiss="modal">取消</button>
                    <button class="btn btn-primary" id="sure" type="button" data-dismiss="modal">确定</button>
                </div>
            </div>
        </div>
    </div>
    <div id="myModal" class="modal fade" tabindex="-1" role="dialog" style="overflow-y:auto">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">新增疗程</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="col-xs-12">
                            新疗程名:
                            <input id="newname" type="text" maxlength="8" class="form-control" />
                        </div>
                    </div>
                    <div class="pull-right" style="margin:10px;">默认数字编号，最多8个字。</div>
                    <table id="addTreatmentRecord" class="table table-bordered" ></table>
                    <input id="Radiotherapy_ID" type="text" hidden="hidden" />
                    <div class="panel box box-primary">
                        <div class="box-header">
                            <h4 class="box-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" class="collapsed">
                                    新疗程预览
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse" aria-expanded="false">
                            <div class="box-body">
                                <div class="row" style="padding-top:10px;">
                                    <div class="col-xs-3" style="text-align:center;">登记信息：</div>
                                    <div class="col-xs-9">
                                        <span id="registerDetail">未选择</span>
                                    </div>
                                </div>
                                <div class="row" style="padding-top:10px;">
                                    <div class="col-xs-3" style="text-align:center;">病情诊断：</div>
                                    <div class="col-xs-9">
                                        <span id="diagnoseDetail">未选择</span>
                                    </div>
                                </div>
                                <div class="row" style="padding-top:10px;">
                                    <div class="col-xs-3" style="text-align:center;">体位固定：</div>
                                    <div class="col-xs-9">
                                        <span id="fixedDetail">未选择</span>
                                    </div>
                                </div>
                                <div class="row" style="padding-top:10px;">
                                    <div class="col-xs-3" style="text-align:center;">CT模拟：</div>
                                    <div class="col-xs-9">
                                        <span id="locationDetail">未选择</span>
                                    </div>
                                </div>
                                <div class="row" style="padding-top:10px;">
                                    <div class="col-xs-3" style="text-align:center;">计划设计：</div>
                                    <div class="col-xs-9">
                                        <span id="designDetail">未选择</span>
                                    </div>
                                </div>
                                <div class="row" style="padding-top:10px;">
                                    <div class="col-xs-3" style="text-align:center;">复位验证：</div>
                                    <div class="col-xs-9">
                                        <span id="replaceDetail">未选择</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button id="saveTreatment" type="button" class="btn btn-primary" data-dismiss="modal">保存</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <div id="cutphoto" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">选择照片</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <div style="text-align: right;">
                            <label for="input" class="btn btn-danger" id="">
                            <span>选择图片</span>
                            <input type="file" id="input" class="sr-only">
                            </label>
                            <a class="btn btn-primary" onclick="crop()" data-dismiss="modal">确定</a>
                        </div>
                    </div>
                    <div class="row" style="margin-top:10px;">
                        <div class="col-sm-8 col-sm-offset-2" style="height:200px;border:1px solid #c1c1c1;">
                            <img src="" id="photo">
                        </div>
                        <%--<div class="col-sm-8 col-sm-offset-2">
                            <div class="col-sm-4 col-sm-offset-4">
                                <p>
                                    预览(102*126)：
                                </p>
                                <div class="img-preview">
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="checkappointmodal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document" style="width:700px;">
            <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">查看加速器预约情况</h4>
            </div>
            <div class="modal-body" style="overflow:hidden;">
                <div class="panel-row">
                        <table id="appointchecktable" class="table table-bordered col-xs-12" style="table-layout:fixed;word-wrap:break-word;">
                        <thead id="appointcheckhead">
                            <tr>
                                <th>预约日期</th>
                                <th>预约时间段</th>
                                <th>预约列表</th>
                                <th>完成情况</th>
                            </tr>
                        </thead>
                        <tbody id="appointcheckbody">
                                        
                        </tbody>
                                    
                        </table>
                </div>
            </div>
            </div>
        </div>
    </div>
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
    <script src="../../../js/Main/addimgs.js"></script>
    <script src="../../../js/Main/PatientRegister.js" ></script>
    <script src="../../../plugin/cropper/cropper.min.js"></script>
    <!-- Page script -->
    <script type="text/javascript">
        $("#datepicker").datepicker({ autoclose: true });
        $("#Birthday").datepicker({ autoclose: true });
        $("#AppiontDate").datepicker({ autoclose: true });
    </script>
    <script>
        // 修改自官方demo的js
        var initCropper = function (img, input) {
            var $image = img;
            var options = {
                aspectRatio: 102 / 126, // 纵横比
                viewMode: 2,
                preview: '.img-preview' // 预览图的class名
            };
            $image.cropper(options);
            var $inputImage = input;
            var uploadedImageURL;
            if (URL) {
                // 给input添加监听
                $inputImage.change(function () {
                    var files = this.files;
                    var file;
                    if (!$image.data('cropper')) {
                        return;
                    }
                    if (files && files.length) {
                        file = files[0];
                        // 判断是否是图像文件
                        if (/^image\/\w+$/.test(file.type)) {
                            // 如果URL已存在就先释放
                            if (uploadedImageURL) {
                                URL.revokeObjectURL(uploadedImageURL);
                            }
                            uploadedImageURL = URL.createObjectURL(file);
                            // 销毁cropper后更改src属性再重新创建cropper
                            $image.cropper('destroy').attr('src', uploadedImageURL).cropper(options);
                            $inputImage.val('');
                        } else {
                            window.alert('请选择一个图像文件！');
                        }
                    }
                });
            } else {
                $inputImage.prop('disabled', true).addClass('disabled');
            }
        }
        var crop = function () {
            var $image = $('#photo');
            var $target = $('#self-photo');
            var $pic = $('#pic');
            var $mypic = $('#mypic');
            $image.cropper('getCroppedCanvas', {
                width: 102, // 裁剪后的长宽
                height: 126
            }).toBlob(function (blob) {
                // 裁剪后将图片放到指定标签
                $target.attr('src', URL.createObjectURL(blob));
                var reader = new FileReader();
                reader.onload = (function (file) {
                    return function (e) {
                        $pic.attr("value", this.result);
                    };
                })(blob);
                reader.readAsDataURL(blob);
            });
        }
        $(function () {
            initCropper($('#photo'), $('#input'));
        });
    </script>
</body>
</html>

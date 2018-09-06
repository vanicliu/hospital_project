<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddPatientHIS.aspx.cs" Inherits="pages_Main_AddPatientHIS" %>

<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>放疗质控系统</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- css -->
  <link rel="stylesheet" href="../../css/Main/Records.css">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="../../plugin/AdminLTE/bootstrap/css/bootstrap.min.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="../../plugin/AdminLTE/plugins/datepicker/datepicker3.css" />
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugin/AdminLTE/plugins/datatables/dataTables.bootstrap.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugin/AdminLTE/plugins/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../../plugin/AdminLTE/plugins/ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../plugin/AdminLTE/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../../plugin/AdminLTE/dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<link rel="stylesheet" href="../../plugin/cropper/cropper.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
    <div class="content-wrapper">
        <section id="addpatient-content" class="content table-responsive" style="background-color:#fff;width:1000px;">
            <form id="frmaddpatient" name="frmaddpatient" method="post" runat="server">
                <div class="paper" style="padding:initial">
                <div class="paper-title">
                    放疗申请单
                </div>
                <input type="hidden" name="ispostback" value="true" />
                <input type="hidden" id="progress" name="progress" />
                <input type="hidden" id="userID" name="userID" />
                <%--<input type="hidden" id="regdoctor" name="regdoctor" />--%>
                <input id="patientID" type="hidden" name="patientID" />
                <input id="treatID" type="hidden" name="treatID" />
                <input id="pic" type="hidden" name="pic" />
                
                <input id="Nation" value="汉族" name="Nation"  class="form-item" type="hidden"/><%--民族--%>
                <input id="Number1" name="Number1" class="form-item" type="hidden"/><%--联系电话1--%>
                <input id="Number2" name="Number2" class="form-item" type="hidden" /> <%--联系电话2--%>
                  <input id="IDcardNumber"  name="IDcardNumber" class="form-item" type="hidden" /><%--身份证号--%> 
                    <input type="hidden" id="Address" name="Address" class="form-item"/><%--家庭住址--%>
                    <input type="hidden" id="radionumber" name="radionumber" class="form-item" /><%--放疗号--%>
                    <input type="hidden" id="DrAdvId" name="DrAdvNumber" class="form-item" /><%--医嘱号：门诊--%>
                    <input type="hidden" id="DrAdvIdHos" name="DrAdvHosNumber" class="form-item" /><%--医嘱号:住院--%>
                    <div class="paper-content">
                        <div class="content-title">
                            <span>基本信息：</span>                            
                        </div>                       
                         <div class="single-row">
                             <div class="col-xs-4">
                                <span class="form-text col-xs-4" style="padding-left:0px;">姓名：</span>
                                <input id="userName" name="userName" class="form-item" type="text" AUTOCOMPLETE="OFF"/>
                            </div>
                             <div class="col-xs-4">
                                <span class="form-text col-xs-4" style="padding-left:0px;">住院号：</span>
                                <input id="hospitalnumber" name="hospitalnumber" type="text" class="form-item" AUTOCOMPLETE="OFF" />                          
                            </div>
                               <div class="col-xs-4">
                                <span class="form-text col-xs-4" style="padding-left:12px;">就诊卡号：</span>
                                <input id="CardID" name="CardID" class="form-item" type="text" AUTOCOMPLETE="OFF" />
                            </div>
                           </div>
                             <div class="single-row">
                                 <div class="col-xs-4">
                                    <span class="form-text col-xs-4" style="padding-left:0px;">医嘱来源：</span>
                                    <input id="DrAdvSource" name="DrAdvSource" type="text" class="form-item" AUTOCOMPLETE="OFF" />
                                </div>
                                 <div class="col-xs-4">
                                <span class="form-text col-xs-4" style="padding-left:0px;">患者身份：</span>
                                <input id="PatientIdentify" name="PatientIdentify" class="form-item" type="text" AUTOCOMPLETE="OFF" />
                            </div>
                            <div class="col-xs-4">
                                <span class="form-text col-xs-4" style="padding-left:12px;">床位：</span>
                                <input id="Bed" name="Bed" class="form-item" type="text" AUTOCOMPLETE="OFF" />
                            </div> 
                            </div>
                        
                        <div class="single-row">
                            <div class="item col-xs-4"> 
                                <span class="form-text col-xs-4" style="padding-left:0px;">性别：</span>
                                <select id="Gender" name="Gender" class="form-item">
                                    <option value="M">男</option>
                                    <option value="F">女</option>
                                </select>
                            </div>
                            <div class="col-xs-4">
                                <span class="form-text col-xs-4" style="padding-left:0px;">出生日期：</span>
                                <input class="form-item" id="Birthday" name="Birthday" type="text"/>
                            </div>
                            <div class="col-xs-4">
                                <span class="form-text col-xs-4" style="padding-left:0px;">姓名拼音：</span>
                                <input id="usernamepingyin" name="usernamepingyin" class="form-item" type="text" placeholder="示例:ZHANG YUNYI" /><%--姓名拼音--%>
                            </div>
                            </div>
                        <div class="single-row">
                            <div class="col-xs-4">
                                <span class="form-text col-xs-4" style="padding-left:0px;">就诊科室：</span>
                                <input id="Department" name="Department" type="text" class="form-item" AUTOCOMPLETE="OFF" />                               
                            </div>
                            <div class="col-xs-4">
                                <span class="form-text col-xs-4" style="padding-left:0px;">就诊病区：</span>
                                <input id="Ward" name="Ward" type="text" class="form-item" AUTOCOMPLETE="OFF" />                                
                            </div>
                        </div>
                         <div class="single-row">
                            
                             <div class="col-xs-4">
                                <span class="form-text col-xs-4" style="padding-left:0px;">诊断：</span>
                                <input id="DiagInfo" name="DiagInfo" class="form-item" type="text" AUTOCOMPLETE="OFF" />
                            </div>
                        </div>
                    
                        </div>
                    
                    <div class="paper-content">
                        <div class="content-title">
                            <span>病案信息：</span>
                        </div>
                        <div class="single-row">
                            <div class="col-xs-4">
                                <span class="form-text col-xs-4" style="padding-left:0px;">医嘱名称：</span>
                                <input id="DrAdvName" name="DrAdvName" type="text" class="form-item" AUTOCOMPLETE="OFF" />
                            </div>
                             <div class="col-xs-4">
                                <span class="form-text col-xs-4" style="padding-left:0px;">主管医师：</span>
                                <select id="doctor" name="doctor" class="form-item"></select>
                            </div>
                            <div class="col-xs-4">
                                <span class="form-text col-xs-4" style="padding-left:0px;">所选分组：</span>
                                <select id="group" name="group" class="form-item">
                                    <option value="allItem">----分组选择-----</option>
                                </select>
                            </div>
                               
                        </div>
                        
                         <div class="single-row">
                            <div class=" col-xs-4" >
                                 <span class="form-text col-xs-4" style="padding-left:0px;">申请医师：</span>
                                <input id="ApplyDoctor" name="ApplyDoctor" class="form-item" type="text" />
                            </div>
                            <div class=" col-xs-4" >
                                 <span class="form-text col-xs-4" style="padding-left:0px;"></span>
                               
                            </div>
                            <div class="col-xs-4" >
                                <span class="form-text col-xs-4" style="padding-left:0px;">申请时间：</span>
                                <span id="date" class="underline"></span>
                                <input id="orddate" name="orddate" class="form-item" type="hidden" />
                                <%--<input id="RegisterTime" name="RegisterTime" class="underline" type="text"/>--%>
                            </div>
                        </div>
                          <button id="save" type="button" class="btn btn-block btn-success" style="margin:auto;width:20%;">保存</button>
                    </div>

                    <div class="paper-content">
                        <div class="content-title">
                            <span>患者诊断：</span>
                        </div>
                        <div class="single-row">
                            <div id="bingqing" class="col-xs-12">
                                <span class="form-text col-xs-2" style="padding-left:0px;width:120.2px;">临床诊断：</span>
                                <input id="bingqing1" name="bingqing1"  class="form-item col-xs-3" disabled="disabled" type="text" AUTOCOMPLETE="OFF" style="width:37%;"/>
                                <input id="bingqing2" name="bingqing2"  class="form-item col-xs-3" disabled="disabled" type="text" AUTOCOMPLETE="OFF" style="width:37%;"/>
                                </div>
                              <div id="bingqingxu" class="col-xs-12">
                                <span class="form-text col-xs-2" style="padding-left:0px;width:120.2px;"></span>
                                <input id="bingqing3" name="bingqing3"  class="form-item col-xs-3" disabled="disabled" type="text" AUTOCOMPLETE="OFF" style="margin-top:10px;width:37%;"/>
                               </div>                          
                            <input type="hidden"  id="copybingqing1" value=""/>
                            <input type="hidden"  id="copybingqing2" value="" />
                            <input type="hidden"  id="copybingqing3" value="" />
                        </div>
                        <div class="single-row">
                            <div id="bingli" class="col-xs-12">
                                <span class="form-text col-xs-2" style="padding-left:0px;width:120.2px;">病理诊断：</span>
                                <input id="bingli1" name="bingli1"  class="form-item col-xs-3" disabled="disabled" type="text" AUTOCOMPLETE="OFF" style="width:37%;"/>
                                <input id="bingli2" name="bingli2"  class="form-item col-xs-3" disabled="disabled" type="text" AUTOCOMPLETE="OFF" style="width:37%;"/>
                            </div>
                            <input type="hidden"  id="copybingli1" value=""/>
                            <input type="hidden"  id="copybingli2" value="" />
                       </div>
                        <div class="single-row">
                            <div class="item col-xs-6" style="position:static;">
                                <span class="form-text col-xs-4" style="padding-left:0px;width:120.2px;">病变部位：</span>
                                <input id="part" class="form-item" type="text" disabled="disabled" />
                            </div>
                            <div class="item col-xs-6" style="position:static;">
                                 <span class="form-text col-xs-4" style="padding-left:0px;width:120.2px;"> 治疗部位：</span>
                                <input id="newpart" class="form-item" type="text"  />

                            </div>                                  
                        </div>
                        
                        <div class="single-row">
                            <div class="item col-xs-6">
                                   <span class="form-text col-xs-4" style="padding-left:0px;width:120.2px;">  疗程：</span>
                                <input id="treatname" class="form-item" disabled="disabled" />
                            </div>
                            <div class="item col-xs-6">
                                 <span class="form-text col-xs-4" style="padding-left:0px;width:120.2px;"> 治疗目的：</span>
                                <input id="Aim"  class="form-item" disabled="disabled"></input>
                            </div>                                  
                        </div>
                        <div class="single-row">
                            <div class="col-xs-6">
                                <span class="form-text col-xs-4" style="padding-left:0px;width:120.2px;">普精放选择：</span>
                                <span>
                                <input  name="patientjudge" type="radio" style="width:20pt"  disabled="disabled" value="1"  />精放
                                <input  name="patientjudge" type="radio" style="width:20pt"  disabled="disabled" value="0"  />普放
                               </span>
                            </div>
                          </div>
                        <div class="single-row">
                            <div class="item area-group col-xs-10">
                                  <span class="col-xs-2" style="padding-left:0px;width:120.2px;">备注：</span>
                                <textarea id="remark" name="remark" class="form-area" disabled="disabled"></textarea>
                            </div>
                        </div>
                    </div>
                   </div>
                      
                
                  
               
            </form>
        </section>
    </div>

<!-- jQuery 2.2.3 -->
<script src="../../plugin/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="../../plugin/AdminLTE/plugins/jQueryUI/jquery-ui.min.js"></script>
      <!-- bootstrap datepicker -->
    <script src="../../plugin/AdminLTE/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- DataTables -->
<script src="../../plugin/AdminLTE/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugin/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="../../plugin/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../../plugin/AdminLTE/plugins/fastclick/fastclick.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../plugin/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="../../plugin/AdminLTE/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../plugin/AdminLTE/dist/js/demo.js"></script>
<!-- js -->
<!-- javascript -->
<%--<script src="../../../js/Main/Diagnose.js" type="text/javascript"></script>
<script src="../../../js/Main/Diagnoseprint.js"></script>
<script src="../../js/Main/HeaderOperate.js"></script>--%>
<script src="../../js/Main/AddPatientHIS.js"></script>
<script src="../../plugin/cropper/cropper.min.js"></script>
<script src="../../js/Main/TestAddress.js"></script>
<script src="../../js/Main/TestChooseAddress.js"></script>
<script>
    $("#addpatient-content").css("minHeight", $(document).height() - 101);
    $("#choosepatient-content").css("minHeight", $(document).height() - 101);
    //$("#Birthday").datepicker({ autoclose: true });
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

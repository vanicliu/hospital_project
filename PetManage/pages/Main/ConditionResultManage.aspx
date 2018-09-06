<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConditionResultManage.aspx.cs" Inherits="pages_Main_ConditionResultManage" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>宠友圈</title>
    <link rel="shortcut icon" href="../../img/logo.ico" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- css -->
    <link rel="stylesheet" href="../../css/Main/main.css">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/bootstrap/css/bootstrap.min.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/plugins/datepicker/datepicker3.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/plugins/datatables/dataTables.bootstrap.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/plugins/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/plugins/ionicons/css/ionicons.min.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/plugins/iCheck/all.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="../../plugin/AdminLTE/dist/css/skins/_all-skins.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini sidebar-collapse">
<div class="wrapper">
    <header class="main-header">
        <a class="logo">
            <span class="logo-mini"><b>P</b>ET</span>
        </a>
        <nav class="navbar navbar-static-top">
            <div style="position: absolute;">
                <h3 style="margin-top: 13px;margin-left: 10px;color: white;">宠友圈</h3>
            </div>
            
        </nav>
    </header>
    <aside class="main-sidebar">
        <section class="sidebar">
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="../../plugin/AdminLTE/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image" />
                </div>
            </div>
            <ul class="sidebar-menu">
               
                <li class="treeview">
                    <a href="AddPatient.aspx">
                        <i class="fa fa-pencil"></i>
                        <span>轨迹跟踪</span>
                    </a>
                </li>
               <li class="treeview">
                    <a href="NewsList.aspx">
                        <i class="fa fa-bell-o"></i>
                        <span>宠物医疗</span>
                    </a>
                    <ul class="treeview-menu">
                        <li>
                            <a id="" href="petHospital.aspx"><i class="fa fa-circle-o"></i>宠物医院</a>
                        </li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-briefcase"></i> <span>宠物社交</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li>
                            <a id="Menu-EquipmentInspection" href="EquipmentInspection.aspx"><i class="fa fa-circle-o"></i>宠友列表</a>
                        </li>
                        <li>
                            <a id="Menu-EquipmentInspectionResult" href="EquipmentInspectionResult.aspx"><i class="fa fa-circle-o"></i>添加宠友</a>
                        </li>
                        <li>
                            <a id="Menu-EquipmentStatistics" href="EquipmentStatistics.aspx"><i class="fa fa-circle-o"></i>宠友圈</a>
                        </li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-plus-square"></i> <span>宠物商城</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu">
                        <li>
                            <a id="Menu-ConditionResultManage" href="ConditionResultManage.aspx"><i class="fa fa-circle-o"></i>宠物用品</a>
                        </li>
                        <li>
                            <a id="Menu-PathologyResultManage" href="PathologyResultManage.aspx"><i class="fa fa-circle-o"></i>在线支付</a>
                        </li>
                    </ul>
                </li>
                 <li class="treeview">
                    <a id="checklog" href="Logcheck.aspx" target="_blank">
                        <i class="fa fa-tablet"></i>
                        <span>健康监测</span>
                    </a>
                    <ul class="treeview-menu">
                        <li>
                            <a id="releasePosition" href="petCondition.aspx"><i class="fa fa-circle-o"></i>宠物状态</a>
                        </li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-tasks"></i>
                        <span>围栏预警</span>
                    </a>
                    <ul class="treeview-menu">
                        <li>
                            <a id="purchaseRegisteration" href="ModelManage.aspx"><i class="fa fa-circle-o"></i>宠物位置</a>
                        </li>
                        <li>
                            <a id="recieptPrint" href="RecieptPrint.aspx"><i class="fa fa-circle-o"></i>预警信息</a>
                        </li>
                        
                    </ul>
                </li>
                <%--<li class="treeview">
                    <a href="#">
                        <i class="fa fa-rmb"></i>
                        <span>收费</span>
                    </a>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-tasks"></i>
                        <span>任务管理</span>
                    </a>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-pie-chart"></i>
                        <span>信息统计</span>
                    </a>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-table"></i>
                        <span>排队叫号</span>
                    </a>
                </li>--%>
            </ul>
        </section>
    </aside>
    <div class="content-wrapper">
    
    <span style="margin-top: 13px;margin-left: 10px;font-size:30px">宠物用品，敬请期待</span>
    
    </div>
    <!-- /.content-wrapper -->


  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.0
    </div>
    <strong>Copyright &copy; 2017 <a href="http://www.jsph.org.cn/">宠友圈</a> .</strong> 保留所有权利
  </footer>

  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="../../plugin/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../plugin/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="../../plugin/AdminLTE/plugins/jQueryUI/jquery-ui.min.js"></script>
<!-- DataTables -->
<script src="../../plugin/AdminLTE/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugin/AdminLTE/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- bootstrap datepicker -->
<script src="../../plugin/AdminLTE/plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- SlimScroll -->
<script src="../../plugin/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="../../plugin/AdminLTE/plugins/fastclick/fastclick.js"></script>
<!-- iCheck 1.0.1 -->
<script src="../../plugin/AdminLTE/plugins/iCheck/icheck.min.js"></script>
<!-- AdminLTE App -->
<script src="../../plugin/AdminLTE/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../plugin/AdminLTE/dist/js/demo.js"></script>
<!-- js -->
<%--<script src="../../js/Main/main.js"></script>
<script src="../../js/Main/HeaderOperate.js"></script>--%>
<script type="text/javascript">
    //$("#patient-table-content").slimScroll({  
    //    size: '8px',
    //    color: '#888888',
    //    wheelStep: 4,
    //    height: $(document).height() - 190
    //});
    $("#startdate").datepicker({ autoclose: true });
    $("#enddate").datepicker({ autoclose: true });
</script>
</body>
</html>
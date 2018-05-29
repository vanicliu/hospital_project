﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Root-information.aspx.cs"  Inherits="Root_Root_information" validateRequest="false"  %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!--Tell the brower to be responsive to screen width -->
    <meta content="Width=device-width, initial-scale=1, maxmum-scale=1, user-scalable=no" name="viewport" />
    <!--Boostrap -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/bootstrap/css/bootstrap.min.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/plugins/font-awesome/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/plugins/ionicons/css/ionicons.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/dist/css/AdminLTE.min.css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce -->
    <link rel="stylesheet" href="../../plugin/AdminLTE/dist/css/skins/_all-skins.min.css" />

    <title>消息发布</title>
    <!-- Main CSS -->
    <link href="../../css/Main/main.css" rel="stylesheet" />
   
    <!-- editor -->
    <link rel="stylesheet" href="../../plugin/editor/themes/default/default.css" />

	<script charset="utf-8" src="../../plugin/editor/examples/jquery.js"></script>
	<script charset="utf-8" src="../../plugin/editor/kindeditor-min.js"></script>
	<script charset="utf-8" src="../../plugin/editor/lang/zh_CN.js"></script>
    <script>
        $(function () {
            var editor = KindEditor.create('textarea[name="mainText"]',{
                uploadJson: '../../plugin/editor/asp.net/upload_json.ashx',
                fileManagerJson: '../../plugin/editor/asp.net/file_manager_json.ashx',
                allowFileManager : true
            })
        });
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="RootMain.aspx" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>R</b>QS</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>放疗质控系统</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->
              <li class="dropdown messages-menu">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-envelope-o"></i>
                      <span id="NoticeNum" class="label label-success">0</span>
                  </a>
                  <ul class="dropdown-menu">
                      <li class="header">通知公告</li>
                      <li>
                          <ul id="Notice" class="menu">
                              <li>
                                  <a href="#">
                                      <h4>无
                                      </h4>
                                      <p class="pull-right"><i class="fa fa-user"></i>&nbsp;<i class="fa fa-clock-o"></i></p>
                                  </a>
                              </li>
                          </ul>
                      </li>
                      <li class="footer"><a id="allNotice" href="javascript:;" target="_blank">查看全部</a></li>
                  </ul>
              </li>
              <li class="dropdown notifications-menu">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-bell-o"></i>
                      <span id="WarningNum" class="label label-warning">0</span>
                  </a>
                  <ul class="dropdown-menu">
                      <li id="WarningTask" class="header">你有0条工作任务预警</li>
                      <li>
                          <ul id="TaskWarning-content" class="menu">
                              <li>
                                  <a href="javascript:;">无
                                  </a>
                              </li>
                          </ul>
                      </li>
                      <li class="footer"><a href="javascript:;">请及时处理</a></li>
                  </ul>
              </li>
              <li class="dropdown tasks-menu">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <i class="fa fa-flag-o"></i>
                      <span class="label label-danger">0</span>
                  </a>
                  <ul class="dropdown-menu">
                      <li class="header">设备动态</li>
                      <li>
                          <ul class="menu">
                              <li>
                                  <a href="javascript:;">
                                      <h3>Design some buttons
                                                <small class="pull-right">20%</small>
                                      </h3>
                                      <div class="progress xs">
                                          <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                              <span class="sr-only">20% Complete</span>
                                          </div>
                                      </div>
                                  </a>
                              </li>
                          </ul>
                      </li>
                      <li class="footer">
                          <a href="javascript:;">查看详情</a>
                      </li>
                  </ul>
              </li>
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                      <img src="../../plugin/AdminLTE/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
                      <span class="hidden-xs"><%=((UserInformation)Session["loginUser"]) == null ?  "" : ((UserInformation)Session["loginUser"]).GetUserName() %></span>
                  </a>
                  <ul class="dropdown-menu">
                      <!-- User image -->
                      <li class="user-header">
                          <img src="../../plugin/AdminLTE/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                          <p>
                              <span class="hidden-xs"><%=((UserInformation)Session["loginUser"]) == null ?  "" : ((UserInformation)Session["loginUser"]).GetUserName() %></span>
                              <small id="role">管理员</small>
                          </p>
                      </li>
                      <!-- Menu Body -->
                      <!-- Menu Footer-->
                      <li class="user-footer">
                          <div class="pull-left">
                              <a href="../Login/changeRole.aspx" class="btn btn-default btn-flat">切换角色</a>
                          </div>
                          <div class="pull-right">
                              <a id="signOut" href="#" class="btn btn-default btn-flat">注销</a>
                          </div>
                      </li>
                  </ul>
              </li>
          </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="../../plugin/AdminLTE/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
           <p id="user-name"><%=((UserInformation)Session["loginUser"]).GetUserName() %></p>
          <a href="#" id="user-role">管理员</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search..." />
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul id="menu" class="sidebar-menu">
        <li class="header">管理员导航</li>
        <li class="">
          <a href="RootMain.aspx">
            <i class="fa fa-coffee"></i> <span>主页</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li class="treeview active">
          <a href="#">
            <i class="fa fa-envelope-o"></i> <span>消息模块</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="Root-InfoManage.aspx"><i class="fa fa-circle-o"></i> 消息管理</a></li>
            <li class="active"><a href="Root-information.aspx"><i class="fa fa-circle-o"></i> 消息发布</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i> <span>用户管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="Root-userInformation.aspx"><i class="fa fa-circle-o"></i> 用户信息</a></li>
            <li><a href="Root-user2role.aspx"><i class="fa fa-circle-o"></i>用户绑定</a></li>
          </ul>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-user-plus"></i>
            <span>角色管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
              <li><a href="Root-role.aspx"><i class="fa fa-circle-o"></i> 角色信息</a></li>
              <li><a href="Root-function2role.aspx"><i class="fa fa-circle-o"></i>功能绑定</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-briefcase"></i>
            <span>设备管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="Root-equipment.aspx"><i class="fa fa-circle-o"></i> 设备管理</a></li>
            <li><a href="EquipmentTypeManage.aspx"><i class="fa fa-circle-o"></i>设备类型管理</a></li>
            <li><a href="Root-EquipmentInspectionManage.aspx"><i class="fa fa-circle-o"></i> 设备检查管理</a></li>
            <li><a href="Root_EquipmentInspection.aspx"><i class="fa fa-circle-o"></i> 设备检查</a></li>
            <li><a href="Root-EquipmentInspectionResult.aspx"><i class="fa fa-circle-o"></i> 设备检查结果</a></li>
          </ul>
        </li>
        <%--<li class="treeview">
          <a href="#">
            <i class="fa fa-sitemap fa-fw"></i>
            <span>设备维修</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="EquipmentErrorrInformation.aspx"><i class="fa fa-circle-o"></i> 维修描述管理</a></li>
            <li><a href="EquipmentTypeManage.aspx"><i class="fa fa-circle-o"></i>设备维修</a></li>
            <li><a href="Root-EquipmentInspectionManage.aspx"><i class="fa fa-circle-o"></i> 设备维修记录</a></li>
          </ul>
        </li>--%>
          <li class="treeview">
              <a href="#">
                  <i class="fa fa-plus-square"></i><span>诊断结果管理</span>
                  <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                  </span>
              </a>
              <ul class="treeview-menu">
                  <li><a href="morphol.aspx"><i class="fa fa-circle-o"></i>病理诊断结果管理</a></li>
                  <li><a href="icdcode.aspx"><i class="fa fa-circle-o"></i>病情诊断结果管理</a></li>
              </ul>
          </li>
        <li>
          <a href="Root-function.aspx">
            <i class="fa fa-cart-plus"></i> <span>功能管理</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li>
          <a href="Root-Group.aspx">
            <i class="fa fa-group"></i> <span>分组管理</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li>
            <a href="Root-parameterSetting.aspx">
                <i class="fa fa-bars"></i> <span>基本信息管理</span>
                <span class="pull-right-container">
                </span>
            </a>
        </li>
          <li>
              <a href="Root-setWarning.aspx">
                  <i class="fa fa-warning"></i><span>流程预警设置</span>
                  <span class="pull-right-container"></span>
              </a>
          </li>
          <li>
              <a href="Root-FirstAccTime.aspx">
                  <i class="fa fa-clone"></i><span>首次治疗预约时间段</span>
                  <span class="pull-right-container"></span>
              </a>
          </li>
          <li>
              <a href="Root-WorkTimeTable.aspx">
                  <i class="fa fa-calendar-times-o"></i><span>预约日期配置</span>
                  <span class="pull-right-container"></span>
              </a>
          </li>
          <li>
              <a href="Root-PublicTemplate.aspx">
                  <i class="fa fa-clone"></i><span>公共模版设置</span>
                  <span class="pull-right-container"></span>
              </a>
          </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-bar-chart"></i>
            <span>数据统计</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
              <li><a href="EquipmentStatistics.aspx"><i class="fa fa-circle-o"></i> 设备检查统计</a></li>
          </ul>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="min-height: 916px;" >


    <!-- Main content -->
      <section class="content">
<div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">消息发布</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <form id="newsForm" action="Root-information.aspx" method="post" runat="server">
                    <input id="postName" name="postNews" type="hidden" value="false" />
                    <div class="form-group" style="text-align:center;">
                        <p>标题</p>
                        <input id="title" type="text" class="form-control isEmpty title text" name="title"/>
                        <p id="titleError" style="margin-top:3px;margin-bottom:0px;"></p>
                    </div>
                    <div class="form-group" style="text-align:center;">
                        <p>正文</p>
                        <textarea id="mainText" cols="40" class="form-control isEmpty text" name="mainText" rows="25" style="width:100%"></textarea>
                    </div>
                    <div style="float:right">
                        <label id="error"></label>
                    </div>
                    <div class="panel panel-default" style="margin:auto;">
                        <div class="panel-heading">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" style="text-decoration:none;">
                                <h4 class="panel-title" style="text-align:center;">选项</h4>
                            </a>
                        </div>
                        <div id="collapseOne" class="info-option panel-collapse collapse">
                            <div class="form-group" style="padding:30px 0px 0px 30px;">
                                <span class="option-title">是否置顶</span>
                                <ul class="nav options">
                                    <li>
                                        <label><input id="important" type="radio" value="1" name="important" />置顶</label>
                                    </li>
                                    <li>
                                        <label><input id="unimportant" type="radio" value="0" name="important" checked="checked" />不置顶</label>
                                    </li>
                                </ul>
                            </div>
                            
                            <div class="form-group" style="padding:30px 0px 0px 30px;">
                                <span class="option-title">可见角色</span>
                                <ul id="all-options" class="nav options roles">
                                    <li>
                                        <label><input id="allRole" type="checkbox" />全部人员</label>
                                    </li>
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <input id="selectedRole" type="hidden" value="" name="selectedRole" />
                        <input type="submit" class="btn btn-primary btn-lg btn-block" value="发布" style="margin:auto;" />
                    </div>
                </form>
            </div>
        </div>
    </section>
    </div>

  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.0
    </div>
    <strong>Copyright &copy; 2017-2017 <a href="#">医院</a> .</strong> 保留所有权利
  </footer>

  <!-- Control Sidebar -->
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="../../plugin/AdminLTE/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="../../plugin/AdminLTE/plugins/jQueryUI/jquery-ui.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../../plugin/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="../../plugin/AdminLTE/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../plugin/AdminLTE/dist/js/demo.js"></script>
<!-- SlimScroll -->
<script src="../../plugin/AdminLTE/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- Main js-->
<script src="../../js/Root/RootMainJS.js"></script>
<!-- Main JavaScript -->
<script type="text/javascript" src="../../js/Root/chooseAll.js"></script>
<script type="text/javascript" src="../../js/Root/Root-information.js"></script>

</body>
</html>

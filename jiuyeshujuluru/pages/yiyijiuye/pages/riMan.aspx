<%@ Page Language="C#" AutoEventWireup="true" CodeFile="riMan.aspx.cs" Inherits="pages_riMan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta charset="utf-8">
        <title>一乙酒业</title>
        <!-- Mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Force IE9 to render in normal mode -->
        <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
        <meta name="author" content="Hanooch" />
        <meta name="description" content="一乙酒业中科研投入数据管理界面"
        />
        <meta name="keywords" content="科研投入"
        />
        <meta name="application-name" content="一乙酒文化大数据" />
        <!-- Import google fonts - Heading first/ text second -->
        <link rel='stylesheet' type='text/css' 
        <!--[if lt IE 9]>

<![endif]-->
        <!-- Css files -->
        <!-- Icons -->
        <link href="assets/css/icons.css" rel="stylesheet" />
        <!-- jQueryUI -->
        <link href="assets/css/sprflat-theme/jquery.ui.all.css" rel="stylesheet" />
        <!-- Bootstrap stylesheets (included template modifications) -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- Plugins stylesheets (all plugin custom css) -->
        <link href="assets/css/plugins.css" rel="stylesheet" />
        <!-- Main stylesheets (template main css file) -->
        <link href="assets/css/main.css" rel="stylesheet" />
        <!-- Custom stylesheets ( Put your own changes here ) -->
        <link href="assets/css/custom.css" rel="stylesheet" />
        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/img/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/img/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/img/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/img/ico/apple-touch-icon-57-precomposed.png">
        <link rel="icon" href="assets/img/ico/favicon.ico" type="image/png">
        <!-- Windows8 touch icon ( http://www.buildmypinnedsite.com/ )-->
        <meta name="msapplication-TileColor" content="#3399cc" />
</head>
<body>
    <!-- Start #header -->
        <div id="header">
            <div class="container-fluid">
                <div class="navbar">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="index.html">
                            <i class="im-windows8 text-logo-element animated bounceIn"></i><span class="text-logo">一乙</span><span class="text-slogan">酒业</span> 
                        </a>
                    </div>
                </div>
                <!-- Start #header-area -->
                <!-- End #header-area -->
            </div>
            <!-- Start .header-inner -->
        </div>
        <!-- End #header -->
        <!-- Start #sidebar -->
        <div id="sidebar">
            <!-- Start .sidebar-inner -->
            <div class="sidebar-inner">
                <!-- Start #sideNav -->
                <ul id="sideNav" class="nav nav-pills nav-stacked">
                    <li><a href="../../historyManage.aspx">企业历史管理 <i class="im-screen"></i></a>
                    </li>
                    <li><a href="../../sizeManage.aspx">企业规模管理 <i class="st-chart"></i></a>
                    </li>
                    <li>
                        <a href="../../yiyi/operation/operationMange.aspx"> 经营状况管理 <i class="im-paragraph-justify"></i></a>
                    </li>
					<li><a href="../../yiyi/operation/sectorMange.aspx"><i class="im-images"></i> 分行业数据管理</a>
                    </li>
                    <li><a href="../../yiyi/operation/areaMange.aspx"><i class="st-diamond"></i> 分地区数据管理 </a>
                    </li>
                    <li><a href="productMan.aspx"> 产品系列管理 <i class="im-table2"></i></a>
                    </li>
                    <li><a href="riMan.aspx" class="waves-effect active"> 科研投入管理 <i class="st-lab"></i></a>
                    </li>
                    <li><a href="../../intangibleAssets-zy/pages/assetsManage.aspx"><i class="ec-mail"></i> 无形资产管理</a>
                    </li>
                    <li><a href="../../intangibleAssets-zy/pages/valuationManage.aspx"><i class="en-upload"></i> 社会评价管理</a>
                    </li>
                    <li><a href="../../history.aspx">数据录入 <i class="im-screen"></i></a>
                    </li>
                    <li><a href="../../RankSystem/Rank.aspx">排名系统<i class="st-chart"></i></a>
                    </li>
                </ul>
                <!-- End #sideNav -->
            </div>
            <!-- End .sidebar-inner -->
        </div>
        <!-- End #sidebar -->
        <!-- Start #right-sidebar -->
        <div id="right-sidebar" class="hide-sidebar">
            <!-- Start .sidebar-inner -->
            <!-- End .sidebar-inner -->
        </div>
        <!-- End #right-sidebar -->
        <!-- Start #content -->
        <div id="content">
            <!-- Start .content-wrapper -->
            <div class="content-wrapper">
                <div class="row">
                    <!-- Start .row -->
                    <!-- Start .page-header -->
                    <div class="col-lg-12 heading">
                        <h1 class="page-header"><i class="im-screen"></i> 一乙酒业大数据</h1>
                        <!-- Start .bredcrumb -->
                        <ul id="crumb" class="breadcrumb">
                        </ul>
                        <!-- End .breadcrumb -->
                    </div>
                    <!-- End .page-header -->
                </div>
                <!-- End .row -->
                <div class="outlet">
                    <!-- Start .outlet -->
                    <!-- Page start here ( usual with .row ) -->
                    <div class="row">
                        <div class="col-md-12">
                            <!-- col-lg-6 start here -->
                            <div class="panel panel-primary toggle">
                                <!-- Start .panel -->
                                <div class="panel-heading">
                                    <h4 class="panel-title"><i class="im-wand"></i> 科研投入数据录入项管理</h4>
									<div  style="float:right;margin-top:5px">
                                          <input class="form-control" type="button" value="搜索" onclick="searchRi()" />      
                                    </div>
                                   <div class="col-lg-2" style="float:right;margin-top:5px;">
                                         <input id="searchRi" class="form-control" type="text" placeholder="请输入搜索内容" />                                        
                                   </div>
                                </div>
                                <div class="panel">
                    <div class="panel-body">
                        <div class="">
                            <table class="table table-striped" id="table-1" style="text-align: center;">
                                <thead>
                                <tr>
                                    <th>企业名称</th>
                                    <th>年份</th>
                                    <th>技术开发费</th>
                                    <th>研发投入</th>
                                    <th>研发机构等级</th>
                                    <th>科研人数总和</th>
                                    <th>高级职称人数</th>
                                    <th>专利申报数</th>
                                    <th>专利授权数</th>
                                    <th>录入时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="riul">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- end: page -->
                </div>
                            </div>
                            <!-- End .panel -->
                        </div>
                        <!-- col-lg-6 end here -->
                        <!-- col-lg-6 end here -->
                    </div>
                    <!-- Page End here -->
                </div>
                <!-- End .outlet -->
            </div>
            <!-- End .content-wrapper -->
            <div class="clearfix"></div>
        </div>
    <style>
        .col-lg-3 {width: 18%;}
        th {text-align: center;}
    </style>
<!-- jQuery  -->
<script src="assets/js/jquery-1.8.3.min.js"></script>
<script src="../JS/riMan.js"></script>
<script src="../JS/search.js"></script>
<script>
    $('#searchRi').on('keypress', function (event) {
        if (event.keyCode === 13) {
            searchRi();
        }
    });
</script>
</body>
</html>

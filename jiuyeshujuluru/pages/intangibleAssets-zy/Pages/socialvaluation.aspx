<%@ Page Language="C#" AutoEventWireup="true" CodeFile="socialvaluation.aspx.cs" Inherits="Pages_socialvaluation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta charset="utf-8">
        <title>一乙酒业</title>
        <!-- Mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Force IE9 to render in normal mode -->
        <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
        <meta name="author" content="Hanooch" />
        <meta name="description" content="一乙酒业中社会评价数据录入界面"
        />
        <meta name="keywords" content="社会评价"/>
        <meta name="application-name" content="一乙酒文化数据库" />
        <!-- Import google fonts - Heading first/ text second -->
        <link rel='stylesheet' type='text/css' /> 
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
            </div>
        </div>
        <!-- Start #sidebar -->
        <div id="sidebar">
            <!-- Start .sidebar-inner -->
            <div class="sidebar-inner">
                <!-- Start #sideNav -->
                <ul id="sideNav" class="nav nav-pills nav-stacked">
                    <li><a href="../../history.aspx">企业历史 <i class="im-screen"></i></a>
                    </li>
                    <li><a href="../../size.aspx">企业规模 <i class="st-chart"></i></a>
                    </li>
                    <li>
                        <a href="../../YIYI/operation/operation.aspx"> 经营状况 <i class="im-paragraph-justify"></i></a>                      
                    </li>
                    <li><a href="../../yiyijiuye/pages/product.aspx"> 产品系列 <i class="im-table2"></i></a>
                    </li>
                    <li><a href="../../yiyijiuye/pages/ri.aspx"> 科研投入 <i class="st-lab"></i></a>
                    </li>
                    <li><a href="intangibleassets.aspx"><i class="ec-mail"></i> 无形资产</a>
                    </li>
                    <li><a href="socialvaluation.aspx" class="waves-effect active"><i class="en-upload"></i> 社会评价</a>
                    </li>
                   <li><a href="../../historyManage.aspx"><i class="en-upload"></i> 数据管理</a>
                    </li>
                   <li><a href="../../RankSystem/Rank.aspx">排名系统<i class="st-chart"></i></a>
                    </li>
                </ul>
            </div>
            <!-- End .sidebar-inner -->
        </div>
        <!-- End #sidebar -->
        <!-- Start #content -->
        <div id="content">
            <!-- Start .content-wrapper -->
            <div class="content-wrapper">
                <div class="row">
                    <!-- Start .row -->
                    <!-- Start .page-header -->
                    <div class="col-lg-12 heading">
                        <h1 class="page-header"><i class="im-screen"></i>一乙酒业大数据</h1>
                        <!-- Start .bredcrumb -->
                        <ul id="crumb" class="breadcrumb">
                        </ul>
                        <!-- End .breadcrumb -->
                        <!-- Start .option-buttons -->
                        
                        <!-- End .option-buttons -->
                    </div>
                    <!-- End .page-header -->
                </div>
                <!-- End .row -->
                <div class="outlet">
                    <!-- Start .outlet -->
                    <!-- Page start here ( usual with .row ) -->
                    <div class="row">
                        <div class="col-md-10">
                            <!-- col-lg-6 start here -->
                            <div class="panel panel-primary toggle">
                                <!-- Start .panel -->
                                <div class="panel-heading">
                                    <h4 class="panel-title"><i class="im-wand"></i> 社会评价录入项</h4>
                                </div>
                                <div class="panel-body">
                                    <form id="valuationForm" action="socialvaluation.aspx" method="post" runat="server">
                                    <input id="valuationName" name="postValuation" type="hidden" value="false" />
                                        <div class="msg"></div>
                                        <div class="wizard-steps"></div>
                                        <div class="step" id="first">
                                            <span data-icon="ec-user" data-text="Personal information"></span>	
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">企业名称</label><span style="color :red;">*</span>
                                                <div class="col-lg-9" style="margin-bottom:15px">
                                                    <input class="form-control" id="enterprise" name="enterprise" type="text"/>
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">专家问卷调查(德尔菲法)</label>
                                                <div class="col-lg-12" style="margin-bottom:15px">
                                                <textarea name="professional" id="professional" class="form-control tinymce" rows="21"></textarea>
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">消费者问卷调查</label>
                                                <div class="col-lg-12" style="margin-bottom:15px">
                                                <textarea name="consumer" id="consumer" class="form-control tinymce" rows="21"></textarea>
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                           
                                        </div>
                                        
                          
                                        <div class="wizard-actions">
                                            <!-- <button class="btn pull-left" type="reset"><i class="en-arrow-left5"></i>Back</button> -->
                                            <input id="selectedRole" type="hidden" value="" name="selectedRole" />
                                            <input class="btn pull-right" type="submit" value="提交"/>
                                        </div>
                                    </form>
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
        <!-- End #content -->
        <!-- Javascripts -->
        <script src="assets/js/jquery-1.8.3.min.js"></script>
        <script src="../JS/socialvaluation.js"></script>
    <style>
        .col-lg-3 {width: 15%;}
    </style>
</body>
</html>

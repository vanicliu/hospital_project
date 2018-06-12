<!--企业规模录入界面-->
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="size.aspx.cs" Inherits="pages_size" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>一乙酒业</title>
        <!-- Mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Force IE9 to render in normal mode -->
        <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
        <meta name="author" content="SuggeElson" />
        <meta name="description" content=""
        />
        <meta name="keywords" content=""
        />
        <meta name="application-name" content="sprFlat admin template" />
        <!-- Import google fonts - Heading first/ text second -->
        <link rel='stylesheet' type='text/css' 
        <!--[if lt IE 9]>

   <![endif]-->
        <!-- Css files -->
        <!-- Icons -->
        <link href="../assets/css/icons.css" rel="stylesheet" />
        <!-- jQueryUI -->
        <link href="../assets/css/sprflat-theme/jquery.ui.all.css" rel="stylesheet" />
        <!-- Bootstrap stylesheets (included template modifications) -->
        <link href="../assets/css/bootstrap.css" rel="stylesheet" />
        <!-- Plugins stylesheets (all plugin custom css) -->
        <link href="../assets/css/plugins.css" rel="stylesheet" />
        <!-- Main stylesheets (template main css file) -->
        <link href="../assets/css/main.css" rel="stylesheet" />
        <!-- Custom stylesheets ( Put your own changes here ) -->
        <link href="../assets/css/custom.css" rel="stylesheet" />
        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/img/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/img/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/img/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="../assets/img/ico/apple-touch-icon-57-precomposed.png">
        <link rel="icon" href="../assets/img/ico/favicon.ico" type="image/png">
        <!-- Windows8 touch icon ( http://www.buildmypinnedsite.com/ )-->
        <meta name="msapplication-TileColor" content="#3399cc" />
	    <script charset="utf-8" src="editor/lang/zh_CN.js"></script>
         <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>
        <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
        <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    </head>
<body>
     <!-- Start #header -->
        <div id="header">
            <div class="container-fluid">
                <div class="navbar">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">
                            <i class="im-windows8 text-logo-element animated bounceIn"></i><span class="text-logo">一乙</span><span class="text-slogan">酒业</span> 
                        </a>
                    </div>
                </div>              
            </div>
        </div>
		<!-- End #header -->
        <!-- Start #sidebar -->
        <div id="sidebar">
            <!-- Start .sidebar-inner -->
            <div class="sidebar-inner">
                <!-- Start #sideNav -->
                <ul id="sideNav" class="nav nav-pills nav-stacked">
                    <li><a href="history.aspx">企业历史 <i class="im-screen"></i></a>
                    </li>
                    <li><a href="size.aspx" class="waves-effect active">企业规模 <i class="st-chart"></i></a>
                    </li>
                    <li>
                        <a href="YIYI/operation/operation.aspx"> 经营状况 <i class="im-paragraph-justify"></i></a>                      
                    </li>
                    <li><a href="yiyijiuye/pages/product.aspx"> 产品系列 <i class="im-table2"></i></a>
                    </li>
                    <li><a href="yiyijiuye/pages/ri.aspx"> 科研投入 <i class="st-lab"></i></a>
                    </li>
                    <li><a href="intangibleAssets-zy/Pages/intangibleassets.aspx"><i class="ec-mail"></i> 无形资产</a>
                    </li>
                    <li><a href="intangibleAssets-zy/Pages/socialvaluation.aspx"><i class="en-upload"></i> 社会评价</a>
                    </li>
                     <li><a href="historyManage.aspx"><i class="en-upload"></i> 数据管理</a>
                    </li>  
                    <li><a href="RankSystem/Rank.aspx">排名系统<i class="st-chart"></i></a>
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
                        <h1 class="page-header"><i class="im-screen"></i> 一乙酒业大数据</h1>
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
                       <div class="col-lg-6">
                            <!-- col-lg-6 start here -->
                            <div class="panel panel-primary toggle">
                                <!-- Start .panel -->
                                <div class="panel-heading">
                                    <h4 class="panel-title"><i class="im-wand"></i> 企业规模数据录入项</h4>
                                </div>
                                <div class="panel-body">
                                    <form id="sizeForm" class="form-horizontal form-wizard" role="form" method="post" action="size.aspx" runat="server">
                                        <input id="postSize" name="postSize" type="hidden" value="false" />
                                        
                                        <div class="step" id="first">
                                            <span data-icon="ec-user" data-text="Personal information"></span>
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">年份</label>
                                                <div class="col-xs-9">
                                                    <div>
                                                        <div>
                                                            <div>
                                                                <input type='text' class="form-control" id='year' name="year" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">企业名称（如：茅台）</label>
                                                <div class="col-lg-9">
                                                    <input id="enterprise" class="form-control" name="enterprise" type="text"/>
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">资产总量（单位：元）</label>
                                                <div class="col-lg-9">
                                                    <input id="totalAssets" class="form-control" name="totalAssets" type="text"/>
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                        </div><br/>
                                        <div class="step" id="personal">
                                            <span data-icon="fa-envelope" data-text="Contact information"></span>
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">占地面积（单位：平方米）</label>
                                                <div class="col-lg-9">
                                                    <input id="area"  class="form-control isEmpty text" name="area" type="text"/>
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">产品产量（单位：万吨）</label>
                                                <div class="col-lg-9">
                                                    <!-- <input class="form-control" name="phone" type="textarea" cols="20"> -->
													<input id="productOutput"  class="form-control isEmpty text" name="productOutput" type="text"/>
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                        </div><br/>
                                        <div class="step submit_step" id="account">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">职工总数（单位：人）</label>
                                                <div class="col-lg-9">
                                                    <input id="employeesNumber"  class="form-control isEmpty text" name="employeesNumber" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wizard-actions">
                                            <!-- <button class="btn pull-left" type="reset"><i class="en-arrow-left5"></i>Back</button> -->
                                            <input id="selectedRole" type="hidden" value="" name="selectedRole" />
                                            <input class="btn pull-right" type="submit" value="提交"/><!-- <i class="en-arrow-right5"></i> -->
                                            
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
        <script>
            $(function () {
                $("#year").datetimepicker({
                    format: 'YYYY ',
                    locale: moment.locale('zh-cn')
                });
            });
     </script>
        <script src="../JS/size.js"></script>
    <script src="../JS/check.js"></script>
    </body>
</html>

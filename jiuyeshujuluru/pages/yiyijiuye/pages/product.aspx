<%@ Page Language="C#" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="pages_product" %>

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
        <meta name="description" content="一乙酒业中科研投入数据录入界面"
        />
        <meta name="keywords" content="科研投入"
        />
        <meta name="application-name" content="一乙酒文化数据库" />
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
                    <li><a href="../../history.aspx">企业历史 <i class="im-screen"></i></a>
                    </li>
                    <li><a href="../../size.aspx">企业规模 <i class="st-chart"></i></a>
                    </li>
                    <li>
                        <a href="../../yiyi/operation/operation.aspx"> 经营状况 <i class="im-paragraph-justify"></i></a>

                    </li>
                    <li><a href="product.aspx" class="waves-effect active"> 产品系列 <i class="im-table2"></i></a>
                    </li>
                    <li><a href="ri.aspx"> 科研投入 <i class="st-lab"></i></a>
                    </li>
                    <li><a href="../../intangibleAssets-zy/pages/intangibleassets.aspx"><i class="ec-mail"></i> 无形资产</a>
                    </li>
                    <li><a href="../../intangibleAssets-zy/pages/socialvaluation.aspx"><i class="en-upload"></i> 社会评价</a>
                    </li>
                    <li><a href="../../historyManage.aspx">数据管理 <i class="en-upload"></i></a>
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
                        <h1 class="page-header"><i class="im-screen"></i> 一乙酒业数据库</h1>
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
                                    <h4 class="panel-title"><i class="im-wand"></i> 产品系列数据录入项</h4>
                                </div>
                                <div class="panel-body">
                                    <form id="productForm" action="product.aspx" method="post" runat="server" class="form-horizontal form-wizard" role="form">
                                        <input id="postProduct" name="postProduct" type="hidden" value="false" />
                                    <%--<form id="wizard" class="form-horizontal form-wizard" role="form">--%>
                                        <div class="step" id="first">
                                            <span data-icon="ec-user" data-text="Personal information"></span>
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">企业名称</label><span style="color :red;">*</span>
                                                <div class="col-lg-9">
                                                    <input id="enterprise" class="form-control" name="enterprise" type="text">
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">品牌系列</label><span style="color :red;">*</span>
                                                <div class="col-lg-9" style="margin-bottom:15px">
                                                    <input id="brand" class="form-control" name="brand" type="text">
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                        </div>
                                        <div class="step" id="personal">
                                            <span data-icon="fa-envelope" data-text="Contact information"></span>
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">酒度系列</label><span style="color :red;">*</span>
                                                <div class="col-lg-9">
						    <p style="padding:6px 12px;">
														<input type="checkbox" style="width:15px; height:15px;" name="degree" value="70度" />70度&nbsp;&nbsp;	
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="68度" />68度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="67度" />67度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="66度" />66度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="65度" />65度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="64度" />64度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="63度" />63度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="62度" />62度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="61度" />61度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="60度" />60度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="59度" />59度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="58度" />58度&nbsp;&nbsp;
														</p>
                                                    <p style="padding:6px 12px;">
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="57度" />57度
						    
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="56度" />56度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="55度" />55度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="54度" />54度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="53度" />53度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="52度" />52度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="51度" />51度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="50度" />50度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="49度" />49度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="48度" />48度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="47度" />47度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="46度" />46度&nbsp;&nbsp;
														</p>
                                                    <p style="padding:6px 12px;">
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="45度" />45度
													
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="44度" />44度&nbsp;&nbsp;
														<input type="checkbox" style="width:15px; height:15px;" name="degree" value="43.8度" />43.8度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="43度" />43度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="42度" />42度&nbsp;&nbsp;
														<input type="checkbox" style="width:15px; height:15px;" name="degree" value="41.8度" />41.8度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="41度" />41度&nbsp;&nbsp;
														<input type="checkbox" style="width:15px; height:15px;" name="degree" value="40.9度" />40.9度&nbsp;&nbsp;
														<input type="checkbox" style="width:15px; height:15px;" name="degree" value="40.8度" />40.8度&nbsp;&nbsp;
														<input type="checkbox" style="width:15px; height:15px;" name="degree" value="40.6度" />40.6度&nbsp;&nbsp;
														<input type="checkbox" style="width:15px; height:15px;" name="degree" value="40.3度" />40.3度&nbsp;&nbsp;
														</p>
                                                    <p style="padding:6px 12px;">
														<input type="checkbox" style="width:15px; height:15px;" name="degree" value="40.2度" />40.2度
														
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="40度" />40度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="39度" />39度&nbsp;&nbsp;
														<input type="checkbox" style="width:15px; height:15px;" name="degree" value="38.6度" />38.6度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="38度" />38度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="37度" />37度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="36度" />36度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="35度" />35度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="34度" />34度&nbsp;&nbsp;
														<input type="checkbox" style="width:15px; height:15px;" name="degree" value="33.8度" />33.8度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="33度" />33度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="32度" />32度&nbsp;&nbsp;
														</p>
                                                    <p style="padding:6px 12px;">
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="31度" />31度&nbsp;&nbsp;
														
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="30度" />30度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="29度" />29度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="28度" />28度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="27度" />27度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="26度" />26度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="25度" />25度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="24度" />24度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="23度" />23度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="22度" />22度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="21度" />21度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="20度" />20度&nbsp;&nbsp;
														</p>
                                                    <p style="padding:6px 12px;">
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="19度" />19度
														
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="18度" />18度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="17度" />17度&nbsp;&nbsp;
                                                        <input type="checkbox" style="width:15px; height:15px;" name="degree" value="16度" />16度&nbsp;&nbsp;
                                                    </p>
                                                    <!-- <select name="degree" class="form-control col-lg-9">
                                                            <option value="55度以上">55度以上</option>
                                                            <option value="55度">55度</option>
                                                            <option value="54度">54度</option>
                                                            <option value="53度">53度</option>
                                                            <option value="52度">52度</option>
                                                            <option value="42度">42度</option>
                                                            <option value="39度">39度</option>
                                                            <option value="38度">38度</option>
                                                            <option value="36度">36度</option>
                                                            <option value="34度">34度</option>
                                                            <option value="32度">32度</option>
                                                            <option value="32度以下">32度以下</option>
                                                        </select> -->
                                                    <%--<input onKeyUp="value=value.replace(/\D/g,'')" id="degree" class="form-control" name="degree" type="text">--%>
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">香型系列</label><span style="color :red;">*</span>
                                                <div class="col-lg-9" style="margin-bottom:15px">
                                                    <select name="scent" class="form-control col-lg-9">
                                                            <option value="酱香型">酱香型</option>
                                                            <option value="浓香型">浓香型</option>
                                                            <option value="清香型">清香型</option>
                                                            <option value="米香型">米香型</option>
                                                            <option value="凤香型">凤香型</option>
                                                            <option value="兼香型">兼香型</option>
                                                            <option value="董香型">董香型</option>
                                                            <option value="豉香型">豉香型</option>
                                                            <option value="芝麻香型">芝麻香型</option>
                                                            <option value="四特香型">四特香型</option>
                                                            <option value="老白干型">老白干型</option>
															<option value="馥郁香型白酒">馥郁香型白酒</option>
                                                            <option value="其他">其他</option>
                                                        </select>
                                                    <%--<input id="scent" class="form-control" name="scent" type="text">--%>
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                        </div>
                                        <div class="step submit_step" id="account">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">其他系列</label>
                                                <div class="col-lg-9">
                                                    <input id="other" class="form-control" name="other" type="text">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wizard-actions">
                                            <input id="selectedRole" type="hidden" value="" name="selectedRole" />
                                            <input type="submit" class="btn pull-right" value="提交" style="margin:auto;" />
                                        </div>
                                    <%--</form> --%>                        
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
    <style>
        .col-lg-3 {width: 15%;}
    </style>
<!-- jQuery-->
<script src="assets/js/jquery-1.8.3.min.js"></script>
<script src="../JS/product.js"></script>
</body>
</html>

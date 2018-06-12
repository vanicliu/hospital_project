<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ri.aspx.cs" Inherits="pages_ri" %>

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
                    <li><a href="product.aspx"> 产品系列 <i class="im-table2"></i></a>
                    </li>
                    <li><a href="ri.aspx" class="waves-effect active"> 科研投入 <i class="st-lab"></i></a>
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
                                    <h4 class="panel-title"><i class="im-wand"></i> 科研投入数据录入项</h4>
                                </div>
                                <div class="panel-body">
                                    <form id="riForm" action="ri.aspx" method="post" runat="server" class="form-horizontal form-wizard" role="form">
                                        <input id="postRi" name="postRi" type="hidden" value="false" />
                                        <%--<form id="wizard" class="form-horizontal form-wizard" role="form">--%>
                                            <div class="step" id="first">
                                                <span data-icon="ec-user" data-text="Personal information"></span>
                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">企业名称</label><span style="color :red;">*</span>
                                                    <div class="col-lg-9">
                                                        <input class="form-control" name="enterprise" type="text">
                                                    </div>
                                                </div>
                                                <!-- End .control-group  -->
                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">年份</label><span style="color :red;">*</span>
                                                    <div class="col-lg-9" style="margin-bottom:15px">
                                                        <select name="year" class="form-control col-lg-9">
                                                            <option value="2017">2017</option>
                                                            <option value="2016">2016</option>
                                                            <option value="2015">2015</option>
                                                            <option value="2014">2014</option>
                                                            <option value="2013">2013</option>
                                                            <option value="2012">2012</option>
                                                            <option value="2011">2011</option>
                                                            <option value="2010">2010</option>
                                                            <option value="2009">2009</option>
                                                            <option value="2008">2008</option>
                                                            <option value="2007">2007</option>
                                                            <option value="2006">2006</option>
                                                            <option value="2005">2005</option>
                                                            <option value="2004">2004</option>
                                                            <option value="2003">2003</option>
                                                            <option value="2002">2002</option>
                                                            <option value="2001">2001</option>
                                                            <option value="2000">2000</option>
                                                            <option value="1999">1999</option>
                                                            <option value="1998">1998</option>
                                                            <option value="1997">1997</option>
                                                            <option value="1996">1996</option>
                                                            <option value="1995">1995</option>
                                                            <option value="1994">1994</option>
                                                            <option value="1993">1993</option>
                                                            <option value="1992">1992</option>
                                                            <option value="1991">1991</option>
                                                            <option value="1990">1990</option>
                                                            <option value="1989">1989</option>
                                                            <option value="1988">1988</option>
                                                            <option value="1987">1987</option>
                                                            <option value="1986">1986</option>
                                                            <option value="1985">1985</option>
                                                            <option value="1984">1984</option>
                                                            <option value="1983">1983</option>
                                                            <option value="1982">1982</option>
                                                            <option value="1981">1981</option>
                                                            <option value="1980">1980</option>
                                                            <option value="1979">1979</option>
                                                            <option value="1978">1978</option>
                                                            <option value="1977">1977</option>
                                                            <option value="1976">1976</option>
                                                            <option value="1975">1975</option>
                                                            <option value="1974">1974</option>
                                                            <option value="1973">1973</option>
                                                            <option value="1972">1972</option>
                                                            <option value="1971">1971</option>
                                                            <option value="1970">1970</option>
                                                        </select>
                                                        <%--<input class="form-control" name="year" type="text">--%>
                                                    </div>
                                                </div>
                                                <!-- End .control-group  -->
                                            </div>
                                            <div class="step" id="personal">
                                                <span data-icon="fa-envelope" data-text="Contact information"></span>
                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">技术开发费（元）</label><span style="color :red;">*</span>
                                                    <div class="col-lg-9">
                                                        <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="techDevelopCost" type="text">
                                                    </div>
                                                </div>
                                                <!-- End .control-group  -->
                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">研发投入（元）</label><span style="color :red;">*</span>
                                                    <div class="col-lg-9">
                                                        <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="RdInvestment" type="text">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">研发机构等级</label><span style="color :red;">*</span>
                                                    <div class="col-lg-9">
                                                        <select name="RdOrgLevel" class="form-control col-lg-9">
                                                            <option value="国家重点">国家重点</option>
                                                            <option value="省重点">省重点</option>
                                                            <option value="市重点">市重点</option>
                                                            <option value="其他">其他</option>
                                                        </select>
                                                        <%--<input class="form-control" name="RdOrgLevel" type="text">--%>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">科研人数总和</label><span style="color :red;">*</span>
                                                    <div class="col-lg-9">
                                                        <input onKeyUp="value=value.replace(/\D/g,'')" class="form-control" name="RderNum" type="text">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">高级职称人数</label><span style="color :red;">*</span>
                                                    <div class="col-lg-9">
                                                        <input onKeyUp="value=value.replace(/\D/g,'')" class="form-control" name="RderSeniorNum" type="text">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">专利申报数</label>
                                                    <div class="col-lg-9">
                                                        <input class="form-control" name="patentFilingNum" type="text">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-3 control-label">专利授权数</label>
                                                    <div class="col-lg-9">
                                                        <input class="form-control" name="patentLicNum" type="text">
                                                    </div>
                                                </div>
                                                <!-- End .control-group  -->
                                            </div>
                                            <div class="wizard-actions">
                                                <input id="selectedRole" type="hidden" value="" name="selectedRole" />
                                                <input type="submit" class="btn pull-right" value="提交" style="margin:auto;" />
                                            </div>
                                        <%--</form>--%>
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
        .col-lg-3 {width: 18%;}
    </style>
<!-- jQuery-->
<script src="assets/js/jquery-1.8.3.min.js"></script>
<script src="../JS/ri.js"></script>
</body>
</html>

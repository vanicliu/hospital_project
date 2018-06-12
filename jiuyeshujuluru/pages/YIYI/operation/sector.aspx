<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sector.aspx.cs" Inherits="sector" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>一乙酒业</title>
           <!-- Mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <!-- Force IE9 to render in normal mode -->
        <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
        <meta name="author" content="SuggeElson" />
        <meta name="description" content=""
        />
        <meta name="keywords" content=""
        />
        <meta name="application-name" content="sprFlat admin template" />
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
        <link href="../../../assets/css/bootstrap.css" rel="stylesheet" />
        <!-- Plugins stylesheets (all plugin custom css) -->
        <link href="assets/css/plugins.css" rel="stylesheet" />
        <!-- Main stylesheets (template main css file) -->
        <link href="../../../assets/css/main.css" rel="stylesheet" />
        <!-- Custom stylesheets ( Put your own changes here ) -->
        <link href="assets/css/custom.css" rel="stylesheet" />
        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/img/ico/apple-touch-icon-144-precomposed.png"/>
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/img/ico/apple-touch-icon-114-precomposed.png"/>
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/img/ico/apple-touch-icon-72-precomposed.png"/>
        <link rel="apple-touch-icon-precomposed" href="assets/img/ico/apple-touch-icon-57-precomposed.png"/>
        <link rel="icon" href="assets/img/ico/favicon.ico" type="image/png"/>
        <!-- Windows8 touch icon ( http://www.buildmypinnedsite.com/ )-->
        <meta name="msapplication-TileColor" content="#3399cc" />
</head>
 <body>
        <!-- Start #header -->
        <div id="header">
            <div class="container-fluid">
                <div class="navbar">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="">
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
                        <a href="operation.aspx"> 经营状况 <i class="im-paragraph-justify"></i></a>
                    </li>
                    <li><a href="../../yiyijiuye/pages/product.aspx"> 产品系列 <i class="im-table2"></i></a>
                            </li>
                    <li><a href="../../yiyijiuye/pages/ri.aspx"> 科研投入 <i class="st-lab"></i></a>
                    </li>
                    <li><a href="../../intangibleAssets-zy/Pages/intangibleassets.aspx"><i class="ec-mail"></i> 无形资产</a>
                    </li>
                    <li><a href="../../intangibleAssets-zy/Pages/socialvaluation.aspx"><i class="en-upload"></i> 社会评价</a>
                    </li>
					<li><a href="../../historyManage.aspx"><i class="en-upload"></i> 数据管理</a>
                    </li>  
                    <li><a href="../../RankSystem/Rank.aspx">排名系统<i class="st-chart"></i></a>
                    </li>
                        </ul>
                    
                   </div>
                <!-- End #sideNav -->
</div>
        <!-- Start #content -->
        <div id="content">
            <!-- Start .content-wrapper -->
            <div class="content-wrapper">
                <div class="row">
                    <!-- Start .row -->
                    <!-- Start .page-header -->
                    <div class="col-lg-12 heading">
                        <h1 class="page-header"><i class="im-screen"></i> 一乙酒业大数据录入系统</h1>
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
                                    <h4 class="panel-title"><i class="im-wand"></i> 分行业数据录入</h4>
                                </div>
                                <div id="oper" class="panel-body">
                                    <form id="wizard" class="form-horizontal form-wizard" role="form">
                                        <div class="msg"></div>
                                        <div class="wizard-steps"></div>
                                        <div class="step">
                                            <span data-icon="ec-user" data-text="Personal information"></span>
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">年份</label>
                                                <div class="col-lg-9">
                                                    <input list="year" class="form-control" name="firstname" type="text"/>
                                                    <datalist id="year">
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
                                                            </datalist>
                                                </div>
                                            </div>
											<div class="form-group">
                                                <label class="col-lg-3 control-label">酒类</label>
                                                <div class="col-lg-9">
                                                    <input list="itemlist" class="form-control" name="firstname" type="text"/>
													<datalist id="itemlist">
                                                    <option>白酒</option>
                                                    <option>啤酒</option>
													<option>黄酒</option>
													<option>米酒</option>
													<option>药酒</option>
													<option>其他品种请直接输入</option>
                                                    </datalist> 
                                                </div>
                                            </div>
                                           
                                            <!-- End .control-group  -->
                                        </div>
                                        <div class="step">
                                            <span data-icon="fa-envelope" data-text="Contact information"></span>
											 <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">企业名称(如:"茅台")</label>
                                                <div class="col-lg-9">
                                                    <input list="coId" class="form-control" name="lastname" type="text"/>
													<datalist id="coId">
                                                        </datalist>
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">营业收入(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="phone" type="text"/>
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                        </div>
                                        <div class="step submit_step">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">营业成本(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">毛利率</label>
                                                <div class="col-lg-9">
                                                    <input class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wizard-actions">
                                            <!-- <button class="btn pull-left" type="reset"><i class="en-arrow-left5"></i>Back</button> -->
                                            <button id="subs" class="btn pull-right" type="button">提交<!-- <i class="en-arrow-right5"></i> -->
                                            </button>
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
        <!-- Load pace first -->
        <!-- Important javascript libs(put in all pages) -->
        <!--[if lt IE 9]>
  <script type="text/javascript" src="assets/js/libs/excanvas.min.js"></script>
  <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <script type="text/javascript" src="assets/js/libs/respond.min.js"></script>
<![endif]-->
        <!-- Bootstrap plugins -->

       <script type="text/javascript" src="assets/server/jquery.js"></script> 
        <script type="text/javascript" src="assets/sectorJS.js"></script> 
    </body>
</html>


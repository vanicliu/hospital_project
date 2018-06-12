﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="operation.aspx.cs" Inherits="product" %>

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
                        <a href="operation.aspx" class="waves-effect active"> 经营状况 <i class="im-paragraph-justify"></i></a>
                    </li>
                    <li><a href="../../yiyijiuye/pages/product.aspx"> 产品系列 <i class="im-table2"></i></a>
                            </li>
                    <li><a href="../../yiyijiuye/pages/ri.aspx"> 科研投入 <i class="st-lab"></i></a>
                    </li>
                    <li><a href="../../intangibleAssets-zy/Pages/intangibleassets.aspx"><i class="ec-mail"></i> 无形资产</a>
                    </li>
                    <li><a href="../../intangibleAssets-zy/Pages/socialvaluation.aspx"><i class="en-upload"></i> 社会评价</a>
                    </li><li><a href="../../historyManage.aspx"><i class="en-upload"></i> 数据管理</a>
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
                                    <h4 class="panel-title"><i class="im-wand"></i> 经营状况数据录入项（主要参考财务报表中的母公司资产负债表）</h4>
                                </div>
                                <div id="oper" class="panel-body">
                                    <form id="wizard" class="form-horizontal form-wizard" role="form">
                                        <div class="msg"></div>
                                        <div class="wizard-steps"></div>
										 <button onclick="window.open('sector.aspx')" class="filter btn btn-primary btn-alt mr5" data-filter="all">分行业数据录入</button>
                                        <button onclick="window.open('area.aspx')" class="filter btn btn-primary btn-alt mr5" data-filter=".sea">分地区数据录入</button>
                                        <div class="step" id="first">
                                            <span data-icon="ec-user" data-text="Personal information"></span>
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">企业名称</label>
                                                <div class="col-lg-9">
                                                    <input class="form-control" name="firstname" type="text"/>
                                                </div>
                                            </div>
							            <div class="form-group">
                                                <label class="col-lg-3 control-label">年份</label>
                                                <div class="col-lg-9">
                                                    <input list="itemlist" class="form-control" name="firstname" type="text"/>
                                                    <datalist id="itemlist">
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
                                           
                                            <!-- End .control-group  -->
                                        </div>
                                        <div class="step" id="personal">
                                            <span data-icon="fa-envelope" data-text="Contact information"></span>
											 <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">营业收入(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="lastname" type="text"/>
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">营业成本(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="phone" type="text"/>
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                        </div>
                                        <div class="step submit_step" id="account">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">销售费用(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div1">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">管理费用(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div2">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">财务费用(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div3">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">所得税费用(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div4">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">营业税金及附加(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div5">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">流动资产(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div6">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">流动资产中的货币资金(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div7">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">流动资产中的存货</label>
                                                <div class="col-lg-9">
                                                    <input class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div8">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">固定资产</label>
                                                <div class="col-lg-9">
                                                    <input class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div9">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">固定资产净值(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div10">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">非流动资产</label>
                                                <div class="col-lg-9">
                                                    <input class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div11">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">资产总计/总资产（上市公司）(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div12">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">归属于上市公司股东的净资产(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div13">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">流动负债(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div14">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">非流动负债(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div15">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">负债合计(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div16">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">所有者权益（或股东权益）(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div17">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">负债和所有者权益（或股东权益）(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div18">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">利润总额(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div19">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">净利润/归属于上市公司股东的净利润(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div20">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">无形资产</label>
                                                <div class="col-lg-9">
                                                    <input class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div21">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">在建工程</label>
                                                <div class="col-lg-9">
                                                    <input class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div22">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">基本每股收益(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div23">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">经营活动产生的现金流量净额(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div24">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">投资活动产生的现金流量净额(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div25">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">筹资活动产生的现金流量净额(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div26">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">报告期投资额(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div27">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">库存商品</label>
                                                <div class="col-lg-9">
                                                    <input class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div28">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">广告促销费(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div29">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">职工薪酬(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
										<div class="step submit_step" id="Div30">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">政府补助(单位:元)</label>
                                                <div class="col-lg-9">
                                                    <input onkeyup="value=value.replace(/[^\d\.]/g,'')" class="form-control" name="password" type="text"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wizard-actions">
                                            <!-- <button class="btn pull-left" type="reset"><i class="en-arrow-left5"></i>Back</button> -->
                                            <button id="subm" class="btn pull-right" type="button">提交<!-- <i class="en-arrow-right5"></i> -->
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
        <script type="text/javascript" src="assets/operation.js"></script> 
    </body>
</html>

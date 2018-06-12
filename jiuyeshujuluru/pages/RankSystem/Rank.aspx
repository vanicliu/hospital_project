<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Rank.aspx.cs" Inherits="pages_RankSystem_Rank" %>
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
        <link href="../../assets/css/icons.css" rel="stylesheet" />
        <!-- jQueryUI -->
        <link href="../../assets/css/sprflat-theme/jquery.ui.all.css" rel="stylesheet" />
        <!-- Bootstrap stylesheets (included template modifications) -->
        <link href="../../assets/css/bootstrap.css" rel="stylesheet" />
        <!-- Plugins stylesheets (all plugin custom css) -->
        <link href="../../assets/css/plugins.css" rel="stylesheet" />
        <!-- Main stylesheets (template main css file) -->
        <link href="../../assets/css/main.css" rel="stylesheet" />
        <!-- Custom stylesheets ( Put your own changes here ) -->
        <link href="../../assets/css/custom.css" rel="stylesheet" />
        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../../assets/img/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../../assets/img/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../../assets/img/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="../../assets/img/ico/apple-touch-icon-57-precomposed.png">
        <link rel="icon" href="../../assets/img/ico/favicon.ico" type="image/png">
        <!-- Windows8 touch icon ( http://www.buildmypinnedsite.com/ )-->
        <meta name="msapplication-TileColor" content="#3399cc" />
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
                    <li><a href="../historyManage.aspx">企业历史管理 <i class="im-screen"></i></a>
                    </li>
                    <li><a href="../sizeManage.aspx">企业规模管理 <i class="st-chart"></i></a>
                    </li>
                    <li>
                        <a href="../YIYI/operation/operationMange.aspx"> 经营状况管理 <i class="im-paragraph-justify"></i></a>                      
                    </li>
					<li><a href="../YIYI/operation/sectorMange.aspx"><i class="im-images"></i> 分行业数据管理</a>
                    </li>
                    <li><a href="../YIYI/operation/areaMange.aspx"><i class="st-diamond"></i> 分地区数据管理 </a>
                    </li>
                    <li><a href="../yiyijiuye/pages/productMan.aspx"> 产品系列管理 <i class="im-table2"></i></a>
                    </li>
                    <li><a href="../yiyijiuye/pages/riMan.aspx"> 科研投入管理 <i class="st-lab"></i></a>
                    </li>
                    <li><a href="../intangibleAssets-zy/Pages/assetsManage.aspx"><i class="ec-mail"></i> 无形资产管理</a>
                    </li>
                    <li><a href="../intangibleAssets-zy/Pages/valuationManage.aspx"><i class="en-upload"></i> 社会评价管理</a>
                    </li>
                    <li><a href="../history.aspx">数据录入<i class="im-screen"></i></a>
                    </li>
                    <li><a href="Rank.aspx">排名系统<i class="st-chart"></i></a>
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
                        <div class="col-lg-8">
                            <!-- col-lg-6 start here -->
                            <div class="panel panel-primary toggle">
                                <!-- Start .panel -->
                                <div class="panel-heading">
                                    <h4 class="panel-title"><i class="im-wand"></i> 一乙酒业大数据排名系统</h4>
                                    <%-- <div  style="float:right;margin-top:5px">
                                          <input class="form-control" type="button" value="搜索" onclick="searchHistory()">      
                                    </div>
                                   <div class="col-lg-2" style="float:right;margin-top:5px;">
                                         <input id="searchHistory" class="form-control" type="text" placeholder="请输入搜索内容" >                                        
                                   </div>
                                   --%>
                                </div>
                                <div class="panel-body" style="font-size:16px">
                                  <div class="col-lg-6">
                                      <label class="col-lg-6 control-label">请选择排名所需的指标</label>
                                  </div>
                                   <div class="Rank" style="width:100%;margin-top:50px">
                                     <div class="firstStep">
                                       <div class="col-lg-3">
                                           <input id="TAcheck" type="checkbox" />
                                           <label>资产总量</label>
                                           <input type="text" runat="server" name="totalAsstes" id="totalAsstes" style="margin-left:10px" placeholder="请输入该指标的权值">
                                       </div>
                                        <div class="col-lg-3">
                                           <input id="incomecheck" type="checkbox" />
                                           <label>营业收入</label>
                                           <input type="text" id="income" style="margin-left:10px" placeholder="请输入该指标的权值">
                                       </div>
                                       <div class="col-lg-3">
                                           <input id="RIcheck" type="checkbox" />
                                           <label>研发投入</label>
                                           <input type="text" id="researchInvestment" style="margin-left:10px" placeholder="请输入该指标的权值">
                                       </div>
                                       <div class="col-lg-3">
                                           <input id="BVcheck" type="checkbox" />
                                           <label>人均销售</label>
                                           <input type="text" id="brandValue" style="margin-left:10px" placeholder="请输入该指标的权值">
                                       </div>
                                     </div>
                                    <div class="secondStep" style="width:100%; padding-top:50px">
                                       <div class="col-lg-3">
                                           <input id="CAcheck" type="checkbox" />
                                           <label>流动资产</label>
                                           <input type="text" id="currentAssets" style="margin-left:10px" placeholder="请输入该指标的权值">
                                       </div>
                                        <div class="col-lg-3">
                                           <input id="MBcheck" type="checkbox" />
                                           <label>货币资金</label>
                                           <input type="text" id="moneyBound" style="margin-left:10px" placeholder="请输入该指标的权值">
                                       </div>
                                        <div class="col-lg-3">
                                           <input id="FAcheck" type="checkbox" />
                                           <label>固定资产</label>
                                           <input type="text" id="fixedAssets" style="margin-left:10px" placeholder="请输入该指标的权值">
                                       </div>
                                        <div class="col-lg-3">
                                           <input id="NCAcheck" type="checkbox" />
                                           <label>非流动资产</label>
                                           <input type="text" id="non-currentAssets" style="margin-left:10px" placeholder="请输入该指标的权值">
                                       </div>
                                     </div>
                                       
                                    <div class="thirdStep" style="width:100%; padding-top:50px">
                                       <div class="col-lg-3">
                                           <input id="TPcheck" type="checkbox" />
                                           <label>总利润</label>
                                           <input type="text" id="totalProfit" style="margin-left:10px" placeholder="请输入该指标的权值">
                                       </div>
                                        <div class="col-lg-3">
                                           <input id="PTcheck" type="checkbox" />
                                           <label>吨酒销售利润</label>
                                           <input type="text" id="profit-tonswine" style="margin-left:10px" placeholder="请输入该指标的权值">
                                       </div>
                                        <div class="col-lg-3">
                                           <input id="PPcheck" type="checkbox" />
                                           <label>人均利润率</label>
                                           <input type="text" id="perProfit" style="margin-left:10px" placeholder="请输入该指标的权值">
                                       </div>
                                        <div class="col-lg-3">
                                           <input id="PIcheck" type="checkbox" />
                                           <label>人均收入</label>
                                           <input type="text" id="perIncome" style="margin-left:10px" placeholder="请输入该指标的权值">
                                       </div>
                                     </div>
                                       <div style="width:100%;padding-top:50px;">
                                            <input id="rank" type="button" value="计算排名">
                                           <input id="dorank" type="button" value="显示排名">
                                       </div>
                                    </div>
                                    <div id="rankResult" style="padding-top:50px;" >
                    <table id="table-1" class="table table-striped" style="font-size:14px;display:none" > <!-- Replace "table-1" with any of the design numbers -->
                                      <thead id="thead">
                                        <th style="text-align:left;">排名</th>
                                        <th style="text-align:left;">企业名称 </th>
                                         <th style="text-align:left;">分数</th>
                                          </thead>
                                                <tbody id="ranktr"> </tbody>
                                                <%--<tbody id="ranktr1"> </tbody>
                                                <tbody id="ranktr2"> </tbody>
                                                <tbody id="ranktr3"> </tbody>
                                                <tbody id="ranktr4"> </tbody>
                                                <tbody id="ranktr5"> </tbody>
                                                <tbody id="ranktr6"> </tbody>
                                                <tbody id="ranktr7"> </tbody>
                                                <tbody id="ranktr8"> </tbody>
                                                <tbody id="ranktr9"> </tbody>
                                                <tbody id="ranktr10"> </tbody>
                                                <tbody id="ranktr11"> </tbody>--%>
                                              
                                        </table>
                </div>
                                   </div>
                                </div>
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
       <script src="js/rankJS.js"></script>
    </body>
</html>
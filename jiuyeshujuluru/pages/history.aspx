<!--企业历史录入界面-->
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="history.aspx.cs" Inherits="pages_history" %>

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
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <meta name="application-name" content="sprFlat admin template" />
        <!-- Import google fonts - Heading first/ text second -->
        

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
        <script src="../login/js/jquery.js"> </script>
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
                    <li><a href="history.aspx" class="waves-effect active">企业历史 <i class="im-screen"></i></a>
                    </li>
                    <li><a href="size.aspx">企业规模 <i class="st-chart"></i></a>
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
                                    <h4 class="panel-title"><i class="im-wand"></i> 企业历史数据录入项</h4>
                                </div>
                                <div class="panel-body" id="history">
                                    <form id="historyForm" class="form-horizontal form-wizard" role="form" method="post" runat="server" action="history.aspx">
                                        <input id="postHistory" name="postHistory" type="hidden" value="false" />
                                        <div class="step" id="first">
                                            <span data-icon="ec-user" data-text="Personal information"></span>
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">企业名称</label>
                                                <div class="col-lg-9">
                                                    <input  id="enterprise" class="form-control" name="enterprise" type="text">
                                                </div>
                                            </div>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">建企时间</label>
                                               <div class="col-xs-9">
                                                    <div>
                                                        <div>
                                                            <div>
                                                                <input type='text' class="form-control" id='buildtime' name="buildTime" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                             
                                            <!-- End .control-group  -->
                                        </div><br/>
                                        <div class="step" id="personal">
                                            <span data-icon="fa-envelope" data-text="Contact information"></span>
                                           <div id="add1" class="add" >
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">厂名改革</label>
                                                <input id="addbutton1" type="button" onclick="addDiv1()" value="添加"/>
                                                <input id="delbutton1" type="button" onclick="delDiv1()" value="取消" style="display:none;" >
                                                 </div>
 
                                            <div class="form-group" >
                                                <label class="col-lg-3 control-label">原用名</label>
                                                <div class="col-lg-9">
                                                    <input id="usedname"  class="form-control isEmpty text" name="usedName"  style="width:100%">                                               
                                                </div>
                                                </div>
                                                <div class="form-group">
                                                   <label class="col-lg-3 control-label">现用名</label>
                                                     <div class="col-lg-9">
                                                        <input id="nowname"  class="form-control isEmpty text" name="nowName"  style="width:100%">                                               
                                                     </div>
                                                </div>
                                            <div class="form-group">
                                                   <label class="col-lg-3 control-label">更改时间</label>
                                                <div class="col-xs-9">
                                                    <div>
                                                        <div>
                                                            <div>
                                                                <input type='text' class="form-control" id="changetime" name="changeTime" />
                                                                 <script>
                                                                     $(function () {
                                                                         $("[name='changeTime']").datetimepicker({
                                                                             format: 'YYYY ',
                                                                             locale: moment.locale('zh-cn')
                                                                         });
                                                                     });
                                                                </script>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                           </div>
                                            </div><br/>
                                           
                                                <div id="add2" class="add" style="display:none;" >
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">厂名改革</label>
                                                <input id="addbutton2" type="button" onclick="addDiv2()" value="添加"/>
                                                <input id="delbutton2" type="button" onclick="delDiv2()" value="取消" style="display:none;">
                                                 </div>
 
                                            <div class="form-group" >
                                                <label class="col-lg-3 control-label">原用名(2)</label>
                                                <div class="col-lg-9">
                                                    <input id="usedname2"  class="form-control isEmpty text" name="usedName2"  style="width:100%">                                               
                                                </div>
                                                </div>
                                                <div class="form-group">
                                                   <label class="col-lg-3 control-label">现用名(2)</label>
                                                     <div class="col-lg-9">
                                                        <input id="nowname2"  class="form-control isEmpty text" name="nowName2"  style="width:100%">                                               
                                                     </div>
                                                </div>
                                            <div class="form-group">
                                                   <label class="col-lg-3 control-label">更改时间(2)</label>
                                                <div class="col-xs-9">
                                                    <div>
                                                        <div>
                                                            <div>
                                                                <input type='text' class="form-control" id="changetime2" name="changeTime2" />
                                                                 <script>
                                                                     $(function () {
                                                                         $("[name='changeTime2']").datetimepicker({
                                                                             format: 'YYYY ',
                                                                             locale: moment.locale('zh-cn')
                                                                         });
                                                                     });
                                                                </script>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                           </div><br/>
                                        
                                           <div id="add3" class="add" style="display:none;">
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">厂名改革</label>
                                                <input id="addbutton3" type="button" onclick="addDiv3()" value="添加"/>
                                                <input id="delbutton3" type="button" onclick="delDiv3()" value="取消" style="display:none;" >
                                                 </div>
 
                                            <div class="form-group" >
                                                <label class="col-lg-3 control-label">原用名(3)</label>
                                                <div class="col-lg-9">
                                                    <input id="usedname3"  class="form-control isEmpty text" name="usedName3"  style="width:100%">                                               
                                                </div>
                                                </div>
                                                <div class="form-group">
                                                   <label class="col-lg-3 control-label">现用名(3)</label>
                                                     <div class="col-lg-9">
                                                        <input id="nowname3"  class="form-control isEmpty text" name="nowName3"  style="width:100%">                                               
                                                     </div>
                                                </div>
                                            <div class="form-group">
                                                   <label class="col-lg-3 control-label">更改时间(3)</label>
                                                <div class="col-xs-9">
                                                    <div>
                                                        <div>
                                                            <div>
                                                                <input type='text' class="form-control" id="changetime3" name="changeTime3" />
                                                                 <script>
                                                                     $(function () {
                                                                         $("[name='changeTime3']").datetimepicker({
                                                                             format: 'YYYY ',
                                                                             locale: moment.locale('zh-cn')
                                                                         });
                                                                     });
                                                                </script>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                           </div>
                                            <!-- End .control-group  -->
                                        <span></span><br/>
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">遗迹传承</label>
                                                <div class="col-lg-9">
                                                    <!-- <input class="form-control" name="phone" type="textarea" cols="20"> -->
													<textarea id="remains"  class="form-control isEmpty text" name="remains"   ></textarea>
                                                </div>
                                            </div>
                                             
                                            <!-- End .control-group  -->
                                        
                                        <div class="step submit_step" id="account">
                                            <span data-icon="ec-unlocked" data-text="Account information"></span>
                                            <!-- End .control-group  -->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label">产品性质</label>
                                                <div class="col-lg-9">
                                                    <select id="product"  class="form-control isEmpty text" name="product" rows="5" style="width:100%">
                                                        <option value="浓香型白酒">浓香型白酒</option>
                                                        <option value="酱香型白酒">酱香型白酒</option>
                                                        <option value="清香型白酒">清香型白酒</option>
                                                        <option value="米香型白酒">米香型白酒</option>
                                                        <option value="兼香型白酒">兼香型白酒</option>
                                                        <option value="凤香型白酒">凤香型白酒</option>
                                                        <option value="董香型白酒">董香型白酒</option>
                                                        <option value="豉香型白酒">豉香型白酒</option>
                                                        <option value="芝麻香型白酒">芝麻香型白酒</option>
                                                        <option value="四特香白酒">四特香型白酒</option>
                                                        <option value="老白干型白酒">老白干型白酒</option>
                                                       <option value="馥郁香型白酒">馥郁香型白酒</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                          
                                        <div class="wizard-actions">
                                            <!-- <button class="btn pull-left" type="reset"><i class="en-arrow-left5"></i>Back</button> -->
                                            <input id="selectedRole" type="hidden" value="" name="selectedRole" />
                                            <input id="subm" class="btn pull-right" type="submit" value="提交"/><!-- <i class="en-arrow-right5"></i> -->
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
        <script src="../JS/history.js"></script>
    <script>
        $(function () {
            $("#buildtime").datetimepicker({
                format: 'YYYY ',
                locale: moment.locale('zh-cn')
            });
        });
     </script>
    
    </body>
</html>

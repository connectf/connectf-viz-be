<%--
  Created by IntelliJ IDEA.
  User: sonny
  Date: 2015/12/9
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>数据源操作</title>
    <!-- Bootstrap -->
    <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
    <link href="resources/assets/styles.css" rel="stylesheet" media="screen">
    <%--<link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">--%>
    <link href="resources/bootstrap/css/new-style.css" rel="stylesheet" media="screen">
    <script src="resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="resources/vendors/datatables/css/jquery.dataTables.css">
    <!-- jQuery -->
    <script type="text/javascript" charset="utf8" src="resources/vendors/datatables/js/jquery.js"></script>
    <!-- DataTables -->
    <script type="text/javascript" charset="utf8" src="resources/vendors/datatables/js/jquery.dataTables.js"></script>
    <style>
        .row{margin:0px; padding:0px;}
        .pagination{margin:0px;}
        .example_info{line-height:30px;}
        .pagination ul{float:right;}
    </style>
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse"
               data-target=".nav-collapse"> <span class="icon-bar"></span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span>
            </a> <a class="brand" href="#">Connectf</a>
            <div class="nav-collapse collapse">
                <ul class="nav pull-right ">
                    <li class="dropdown"><a href="#" role="button"
                                            class="dropdown-toggle" data-toggle="dropdown"> <i
                            class="icon-user"></i>   <i class="caret"></i>

                    </a>
                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#">Profile</a></li>
                            <li class="divider"></li>
                            <li><a tabindex="-1" href="login.html">Logout</a></li>
                        </ul></li>
                </ul>
                <ul class="nav">
                    <li ><a href="/index">Dashboard</a></li>
                    <li class="dropdown active"><a href="#" role="button"
                                            class="dropdown-toggle" data-toggle="dropdown">数据源<i
                            class="caret"></i>

                    </a>
                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="/admin/adddatasource">新增数据源</a></li>
                            <li><a tabindex="-1" href="/admin/datasourcelist">数据集列表</a></li>
                            <li><a tabindex="-1" href="/admin/gotodataSourcelist">数据源列表</a></li>
                        </ul></li>

                    <li class="dropdown"><a href="#" role="button"
                                            class="dropdown-toggle" data-toggle="dropdown">用户管理<i class="caret"></i>

                    </a>
                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="/admin/createuser">创建用户</a></li>
                            <li><a tabindex="-1" href="/admin/createusergroup">创建用户组</a></li>
                            <li><a tabindex="-1" href="/admin/userlist">用户列表</a></li>
                            <li><a tabindex="-1" href="/admin/usergrouplist">用户组列表</a></li>
                        </ul></li>
                    <li class="dropdown"><a href="#" data-toggle="dropdown"
                                            class="dropdown-toggle">权限管理<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="/admin/adminprivilege">权限设置</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </div>
</div>
<div class="row-fluid">
    <!--/span-->
    <div class="span12" id="content">
        <div class="row-fluid section">
            <!-- block -->
            <div class="block">
                <div class="navbar navbar-inner block-header">
                    <div class="muted pull-left">已选数据集列表</div>
                </div>
                <div class="block-content collapse in">
                    <div class="tab-pane" id="tab3">
                        <div class="span12">
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="dataList">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>数据源名称</th>
                                    <th>数据源ID</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /block -->
        </div>
    </div>
</div>

<!-- 模态对话框 -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">提示</h3>
    </div>
    <div class="modal-body ">
        <p id="delnote"></p>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
        <button id="btnOK" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">确定</button>
    </div>
</div>

<footer>
    <p>&copy; Connectf Dev Team 2016</p>
</footer>
<script src="resources/vendors/jquery-1.9.1.js"></script>
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/vendors/datatables/js/jquery.dataTables.min.js"></script>
<script src="resources/assets/scripts.js"></script>
<%--<script src="assets/DT_bootstrap.js"></script>--%>
<script>
    $(function() {
        var dataSourceId = null;

        function DataSourceListInit(index,dataSourceName,dataSourceId,btn){
            this.index = index;
            this.dataSourceName = dataSourceName;
            this.dataSourceId = dataSourceId;
            this.btn = btn;
        }

        var getAllDataSource = function(){
            $.ajax({
                type:"POST",
                async:false,
                url:"/admin/getdatasources",
                data:{},
                dataType:'json',
                success:function(object){
                    var data = new Array(object.length);
                    var obj = null;
                    $.each(object,function(index,value){
                        obj = eval(value);
                        data[index] = new DataSourceListInit(
                                index+1,
                                value.dataSourceName,
                                value.dataSourceId,
                                "<button class=\"btn btn-info btn-mini\">修改</button>" +
                                "<button class=\"btn btn-warning btn-mini tabbut_mg \">删除</button>");
                    });

                    $('#dataList').dataTable({
                        data:data,
                        columns: [
                            { data: 'index' },
                            { data: 'dataSourceName' },
                            { data: 'dataSourceId'},
                            { data: 'btn'}
                        ],
                        "destroy" : true,
                        "deferRender" : true,//懒加载
                        "scrollY" : "350px",
                        "scrollCollapse" : true,
                        "lengthChange" : true,
                        "lengthMenu" : [ 20, 50, 100],//每页展示数量选项
                        language : {//国际化
                            "sProcessing" : "处理中...",
                            "sLengthMenu" : "每页显示 _MENU_ 项数据",
                            "sZeroRecords" : "没有匹配的数据",
                            "sInfo" : "显示第 _START_ 至 _END_ 项数据，共 _TOTAL_ 项",
                            "sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
                            "sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
                            "sInfoPostFix" : "",
                            "sSearch" : "搜索:",
                            "sEmptyTable" : "暂无数据",
                            "sLoadingRecords" : "载入中...",
                            "sInfoThousands" : ",",
                            "oPaginate" : {
                                "sFirst" : "首页",
                                "sPrevious" : "上页",
                                "sNext" : "下页",
                                "sLast" : "末页"
                            }
                        }
                    });
                },
                error:function(){}
            });
        };

        getAllDataSource();

        $("#dataList tbody ").on("click","button",function(){
            var flag = $(this).html();//button name
            tds = $(this).parents('tr').children('td');// all td elements value
            dataSourceId = tds.eq(2).text();
            if(flag == "修改"){
                return ;
            }else if(flag == "删除"){
                $('#myModal').modal();
                $("#delnote").html("删除数据源的同时，所属数据集也会被删除，确定删除？");
            }
        });

        $("#btnOK").on("click",function(){
            $.ajax({
                type:"POST",
                async:false,
                url:"/admin/unregisterDatasourceById",
                data:{dataSourceId:dataSourceId},
                dataType:'json',
                success: function(object){
                    if(object == true){
                        getAllDataSource();
                    }
                },
                error:function(){ }
            });
        });
    });
</script>
</body>
</html>

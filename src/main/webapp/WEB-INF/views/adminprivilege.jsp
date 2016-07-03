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
<title>权限操作</title>
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
                                            class="dropdown-toggle" data-toggle="dropdown"><i class="icon-user"></i>   <i class="caret"></i>

                    </a>
                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#">Profile</a></li>
                            <li class="divider"></li>
                            <li><a tabindex="-1" href="login.html">Logout</a></li>
                        </ul></li>
                </ul>
                <ul class="nav">
                    <li ><a href="/index">Dashboard</a></li>
                    <li class="dropdown"><a href="#" role="button"
                                            class="dropdown-toggle" data-toggle="dropdown">数据源<i class="caret"></i>

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
                    <li class="dropdown active"><a href="#" data-toggle="dropdown"
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
                    <div class="muted pull-left">权限管理</div>
                </div>
                <div class="block-content collapse in">
                    <div class="tab-pane" id="tab3">
                        <div class="span12">
                            <button id="btnAdd" type="button" class="btn btn-primary btn_quanxuan">新增权限</button>
                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table_font" id="dataList">
                                <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>数据源名称</th>
                                        <th>数据源ID</th>
                                        <th>用户组名称</th>
                                        <th>用户组ID</th>
                                        <th>用户组权限</th>
                                        <th>权限ID</th>
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

<!--新增模态对话框 -->
<div id="addModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header aaa">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 >提示</h3>
    </div>
    <div class="modal-body bbb">
        <p>
            <h4>数据源:</h4>
            <select id="dataSourceSel" class="selectpicker" data-style="btn-primary">
                <%--<option value="0">请选择</option>--%>
                <%--<option value="1">允许</option>--%>
                <%--<option value="2">禁止</option>--%>
            </select>

        </p>
        <p>
            <h4>用户组:</h4>
            <select id="userGroupSel" class="selectpicker" data-style="btn-primary">
                <%--<option value="0">请选择</option>--%>
                <%--<option value="1">允许</option>--%>
                <%--<option value="2">禁止</option>--%>
            </select>
        </p>
        <p>
            <h4>权限:</h4>
            <select id="privilegeSel" class="selectpicker" data-style="btn-primary">
                <option value="0">请选择</option>
                <option value="Access">允许</option>
                <option value="NoAccess">禁止</option>
            </select>
        </p>
    </div>
    <!--alert info-->
    <div class="alert alert-error" id="header" style="display: none">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <div id="show_info"></div>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
        <button id="addbtnOK" class="btn btn-primary" aria-hidden="true">确定</button>
    </div>
</div>

<!--修改模态对话框 -->
<div id="modifyModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header aaa">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 >提示</h3>
    </div>
    <div class="modal-body bbb">
        <p>
        <h4>数据源:</h4>
        <button class="btn" type="button" id="dataSource"></button>
        </p>
        <p>
        <h4>用户组:</h4>
        <button class="btn" type="button" id="userGroup"></button>
        </p>
        <p>
        <h4>权限:</h4>
        <select id="modprivilegeSel" class="selectpicker" data-style="btn-primary">
            <option value="0">请选择</option>
            <option value="Access">允许</option>
            <option value="NoAccess">禁止</option>
        </select>
        </p>
    </div>
    <div class="modal-footer">
        <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
        <button id="modbtnOK" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">确定</button>
    </div>
</div>


<!-- 询问模态对话框 -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3>提示</h3>
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
<script>
$(function() {
    var privilegeId = null;
    var privilegeType = null;
    var dataSourceName = null;
    var userGroupName = null;

    var getDataSource = function(){
        $.ajax({
            type:"POST",
            async:false,
            url:"/admin/getDataSourcePrivilege",
            data:{},
            dataType:'json',
            success:function(object){
                var obj = null;
                $("#dataSourceSel").empty();
                $("#dataSourceSel").append($("<option>").attr("value","0").html("请选择"));
                $.each(object,function(index,value){
                    obj = eval(value);
                    var id = obj.dataSourceId;
                    var name = obj.dataSourceName;
                    $("#dataSourceSel").append($("<option>").attr("value",id).html(name));
                });
            },
            error:function(){}
        });
    };

    var getUserGroup = function(){
        $.ajax({
            type:"POST",
            async:false,
            url:"/admin/getUserGroupPrivilege",
            data:{},
            dataType:'json',
            success:function(object){
                var obj = null;
                $("#userGroupSel").empty();
                $("#userGroupSel").append($("<option>").attr("value","0").html("请选择"));
                $.each(object,function(index,value){
                    obj = eval(value);
                    var id = obj.userGroupId;
                    var name = obj.userGroupName;
                    $("#userGroupSel").append($("<option>").attr("value",id).html(name));
                });
            },
            error:function(){}
        });
    };

    var checkValue = function(){
        var dataSourceSel = $("#dataSourceSel").val();
        var userGroupSel = $("#userGroupSel").val();
        var userPrivilegeSel = $("#privilegeSel").val();

        if(dataSourceSel == 0){
            $("#header").css("display","block");
            $("#show_info").html("请选择合适的数据源@");
            return false;
        }else if(userGroupSel == 0){
            $("#header").css("display","block");
            $("#show_info").html("请选择合适的用户组@");
            return false;
        }else if(userPrivilegeSel == 0){
            $("#header").css("display","block");
            $("#show_info").html("请选择合适的操作权限@");
            return false;
        }
        return true;
    };

    $("#btnAdd").on("click",function(){
        getDataSource();
        getUserGroup();
        $("#addModal").modal();
    });

    $("#addbtnOK").on("click",function(){
        var dataSourceSel = $("#dataSourceSel").val();
        var userGroupSel = $("#userGroupSel").val();
        var userPrivilegeSel = $("#privilegeSel").val();
        var dataSourceName = $("#dataSourceSel option:selected").text();
        var userGroupName = $("#userGroupSel option:selected").text();

        if(checkValue()){
            $.ajax({
                type:"POST",
                async:false,
                url:"/admin/addUserGroupPrivilege",
                data:{
                    dataSourceSel:dataSourceSel,
                    userGroupSel:userGroupSel,
                    userPrivilegeSel:userPrivilegeSel,
                    userGroupName:userGroupName,
                    dataSourceName:dataSourceName
                },
                dataType:'json',
                success:function(object){
                    $("#myModal").modal("hide");
                    if (object == true){
                        window.location.href = "/admin/adminprivilege";
                    }else{
                        alert("添加失败");
                    }
                },
                error:function(){}
            });
        }

    });

    function PrivilegeListInit(index,dataSourceName,dataSourceId,userGroupName,userGroupId,privilege,privilegeId,btn){
        this.index = index;
        this.dataSourceName = dataSourceName;
        this.dataSourceId = dataSourceId;
        this.userGroupName = userGroupName;
        this.userGroupId = userGroupId;
        this.privilege = privilege;
        this.privilegeId = privilegeId;
        this.btn = btn;
    }

    var getallprivileges = function(){
        $.ajax({
            type:"POST",
            async:false,
            url:"/admin/getAllPrivileges",
            data:{},
            dataType:'json',
            success:function(object){
                var data = new Array(object.length);
                var obj = null;
                $.each(object,function(index,value){
                    obj = eval(value);
                    data[index] = new PrivilegeListInit(
                            index+1,
                            obj.dataSourceName,
                            obj.dataSourceId,
                            obj.userGroupName,
                            obj.userGroupId,
                            obj.privilege,
                            obj.privilegeId,
                            "<button class=\"btn btn-info btn-mini\">修改权限</button>" +
                            "<button class=\"btn btn-warning btn-mini tabbut_mg \">删除</button>"
                    );
                });

                $('#dataList').dataTable({
                    data:data,
                    columns: [
                        { data: 'index' },
                        { data: 'dataSourceName' },
                        { data: 'dataSourceId'},
                        { data: 'userGroupName'},
                        { data: 'userGroupId' },
                        { data: 'privilege'},
                        { data: 'privilegeId'},
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

    getallprivileges();

    $("#dataList tbody ").on("click","button",function(){
        var flag = $(this).html();//button name
        tds = $(this).parents('tr').children('td');// all td elements value
        privilegeId = tds.eq(6).text();
        dataSourceName = tds.eq(1).text();
        userGroupName = tds.eq(3).text();
        if(flag == "删除"){
            $('#myModal').modal();
            $("#delnote").html("是否确认删除？");
        }else if(flag == "修改权限"){
            $("#dataSource").html(dataSourceName);
            $("#userGroup").html(userGroupName);
            $('#modifyModal').modal();
        }
    });

    $("#btnOK").on("click",function(){
        $.ajax({
            type:"POST",
            async:false,
            url:"/admin/delUserGroupPrivilege",
            data:{privilegeId:privilegeId},
            dataType:'json',
            success: function(object){
                if(object == true){
                    getallprivileges();
                }
            },
            error:function(){ }
        });
    });

    $("#modbtnOK").on("click",function(){
        privilegeType = $("#modprivilegeSel").val();
        $.ajax({
            type:"POST",
            async:false,
            url:"/admin/updateUserGroupPrivilege",
            data:{privilegeId:privilegeId,privilegeType:privilegeType},
            dataType:'json',
            success: function(object){
                if(object == true){
                    getallprivileges();
                }
            },
            error:function(){ }
        });
    });
});
</script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: sonny
  Date: 2015/11/24
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>数据集列表</title>
  <!-- Bootstrap -->
  <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <link href="resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
  <link href="resources/assets/styles.css" rel="stylesheet" media="screen">
  <%--<link href="assets/DT_bootstrap.css" rel="stylesheet" media="screen">--%>
  <link href="resources/bootstrap/css/new-style.css" rel="stylesheet" media="screen">
  <script src="resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
  <link href="resources/assets/hdw.css" rel="stylesheet">
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
          <li class="active"><a href="/index">Dashboard</a></li>
          <li class="dropdown"><a href="#" role="button"
                                  class="dropdown-toggle" data-toggle="dropdown">数据源<i
                  class="caret"></i>

          </a>
            <ul class="dropdown-menu">
              <li><a tabindex="-1" href="/admin/adddatasource">新增数据源</a></li>
              <li><a tabindex="-1" href="/admin/datasourcelist">数据集列表</a></li>
              <li><a tabindex="-1" href="/admin/gotodataSourcelist">数据源列表</a></li>
            </ul></li>

          <li class="dropdown"><a href="#" role="button"
                                  class="dropdown-toggle" data-toggle="dropdown">用户管理  <i class="caret"></i>
          </a>
            <ul class="dropdown-menu">
              <li><a tabindex="-1" href="/admin/createuser">创建用户</a></li>
              <li><a tabindex="-1" href="/admin/createusergroup">创建用户组</a></li>
              <li><a tabindex="-1" href="/admin/userlist">用户列表</a></li>
              <li><a tabindex="-1" href="/admin/usergrouplist">用户组列表</a></li>
            </ul></li>
          <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">权限管理<b class="caret"></b></a>
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

    <div class="row-fluid">
      <!-- block -->
      <div class="block">
        <div class="navbar navbar-inner block-header">
          <div class="muted pull-left">选择数据集</div>
          <div class="pull-right">

          </div>
        </div>
        <div class="block-content collapse in">
          <div class="row-fluid padd-bottom">
            <div class="reg">

              <div class="content regbox1">
                <select multiple="multiple" id="select1">
                  <%--<option value="1">选项1</option>--%>
                </select>
                <div class="remove_but">
                  <span id="add" class="btn">选中右移</span> <span id="add_all"  class="btn">全部右移</span>
                </div></div>
              <div class="content regbox1">
                <select multiple="multiple" id="select2">
                </select>
                <div class="remove_but">
                  <span id="remove"  class="btn">选中左移</span><span id="remove_all"  class="btn">全部左移</span>
                </div>
              </div>
              <div class="form-actions form-actions_box">
                <button type="submit" class="btn btn-primary form-actions-mg" id="next">下一步</button>
                <button type="button" class="btn" id="cancel">取消</button>
              </div>

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
  <div class="modal-body">
    <p id="seldataset" class="sedataset-word"></p>
  </div>
  <div class="modal-footer">
    <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">确定</button>
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

  });

  $(document).ready(function(){
    $.ajax({
      type:"POST",
      async:false,
      url:"/admin/showgetdatasets",
      data:{},
      success: function(data){
        var obj=eval("("+data+")");
        $.each(obj,function(index,value){
          var select1 = $("#select1");
          var option= $("<option>").attr("value",value).html(value);
          select1.append(option);
        });
      },
      error:function(){

      }
    });

    //list add addall remove removeall
    $("#add").click(function(){
      $("#select1 option:selected").appendTo("#select2");
    });
    $("#add_all").click(function(){
      $("#select1 option").appendTo("#select2");
    });
    $("#remove").click(function(){
      $("#select2 option:selected").appendTo("#select1");
    });
    $("#remove_all").click(function(){
      $("#select2 option").appendTo("#select1");
    });
    $("#select1").dblclick(function(){
      $("#select1 option:selected").appendTo("#select2");
    });
    $("#select2").dblclick(function(){
      $("#select2 option:selected").appendTo("#select1");
    });

    //click the button next
    $("#next").on("click",function(){
      var optionsize = $("#select2 option").size();
      if(optionsize == 0){
        $("#myModal").modal();
        $("#seldataset").html("请至少选择一个数据集！");
      }else{
        var aArray = new Array();
        $("#select2 option").each(function(){
          var param = $(this).val();
          aArray.push(param);
        });

        $.ajax({
          type:"POST",
          async:false,
          dataType: 'json',
          url:"/admin/registerdataset",
          data:{param:aArray.join(",")},
          success: function(data){
            if(data == true){
              window.location.href = "/admin/datasetlistnext";
            }
          },
          error:function(){}
        });
      }

     });

    $("#cancel").on("click",function(){
      $.ajax({
        type:"POST",
        async:false,
        url:"/admin/showunregisterdatasource",
        data:{},
        success: function(data){
          if(data == "true"){
            window.location.href = "/index";
          }
        },
        error:function(){}
      });
    });
  });
</script>
</body>
</html>

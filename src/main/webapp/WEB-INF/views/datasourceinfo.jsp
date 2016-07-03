<%--
  Created by IntelliJ IDEA.
  User: sonny
  Date: 2015/11/24
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>数据源信息</title>
  <!-- Bootstrap -->
  <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <link href="resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
  <link href="resources/assets/styles.css" rel="stylesheet" media="screen">
  <link href="resources/bootstrap/css/new-style.css" rel="stylesheet" media="screen">
  <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="resouces/vendors/flot/excanvas.min.js"></script><![endif]-->
  <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
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
                                  class="dropdown-toggle" data-toggle="dropdown">用户管理  <i
                  class="caret"></i>

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

    <div class="row-fluid">
      <!-- block -->
      <div class="block">
        <div class="navbar navbar-inner block-header">
          <div class="muted pull-left">填写数据源信息</div>
        </div>
        <div class="block-content collapse in">
          <div class="span12">
            <!-- BEGIN FORM-->
            <form action="/admin/showsubmitdatasourceinfo" method="post" id="form_datasource_info" class="form-horizontal">
              <fieldset>
                <div class="alert alert-error" id="header" style="display: none">
                  <button type="button" class="close" data-dismiss="alert">&times;</button>
                  <div id="show_info"></div>
                </div>

                <div class="control-group">
                  <label class="control-label">IP：<span class="required">*</span></label>
                  <div class="controls">
                    <input type="text" id="ip" name="ip" data-required="1" class="span6 m-wrap"/>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">PORT：<span class="required">*</span></label>
                  <div class="controls">
                    <input id="port" name="port" type="text" class="span6 m-wrap"/>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">用户名：<span class="required">*</span></label>
                  <div class="controls">
                    <input id="username" name="username" type="text" class="span6 m-wrap"/>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">密码：<span class="required">*</span></label>
                  <div class="controls">
                    <input id="password" name="password" type="password" class="span6 m-wrap"/>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">数据库名称：<span class="required">*</span></label>
                  <div class="controls">
                    <input id="databasename" name="databasename" type="text" class="span6 m-wrap"/>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">数据源名称：<span class="required">*</span></label>
                  <div class="controls">
                    <input id="datasourcename" name="datasourcename" type="text" class="span6 m-wrap"/>
                  </div>
                </div>

                <div class="form-actions">
                  <button type="button" class="btn btn-primary btn_mg" id="testConn">连接测试</button>
                  <button type="button" id="next" class="btn btn-primary btn_mg">下一步</button>
                  <button type="button" id="cancel" class="btn">取消</button>
                  <input type="hidden" id="result" value="${result}"/>
                </div>
              </fieldset>
            </form>
            <!-- END FORM-->
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
    <p id="checkConn"></p>
  </div>
  <div class="modal-footer">
    <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">确定</button>
  </div>
</div>

<footer>
  <p>&copy;Connectf Dev Team 2016</p>
</footer>

<!-- ECharts单文件引入 -->
<link href="resources/vendors/datepicker.css" rel="stylesheet" media="screen">
<link href="resources/vendors/uniform.default.css" rel="stylesheet" media="screen">
<link href="resources/vendors/chosen.min.css" rel="stylesheet" media="screen">
<link href="resources/vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">
<script src="resources/vendors/jquery-1.9.1.js"></script>
<%--<script src="vendors/jquery-1.11.3.min.js" type="text/javascript"/>--%>
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/vendors/jquery.uniform.min.js"></script>
<script src="resources/vendors/chosen.jquery.min.js"></script>
<script src="resources/vendors/bootstrap-datepicker.js"></script>
<script src="resources/vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
<script src="resources/vendors/wysiwyg/bootstrap-wysihtml5.js"></script>
<script src="resources/vendors/wizard/jquery.bootstrap.wizard.min.js"></script>
<script type="text/javascript" src="resources/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="resources/assets/form-validation.js"></script>
<script src="resources/assets/scripts.js"></script>
<script>

jQuery(document).ready(function() {
  FormValidation.init();

  $("#cancel").on("click",function(){
    window.location.href = "/index";
  });

  $("#next").on("click",function(){
    var result = checkDataSource();
    if(result == true){
      var ip = $("#ip").val();
      var port = $("#port").val();
      var username = $("#username").val();
      var password = $("#password").val();
      var databasename = $("#databasename").val();
      var datasourcename = $("#datasourcename").val();

      $.ajax({
        type:"POST",
        async:false,
        url:"/admin/showsubmitdatasourceinfo",
        data:{
          ip:ip,
          port:port,
          username:username,
          password:password,
          datasourcename:datasourcename,
          databasename:databasename
        },
        success: function(data){
          if(data == "1"){
            window.location.href = "/admin/datasetlist"
          }else if(data == "0"){
            $('#myModal').modal();
            $("#checkConn").html("数据源已存在@");
          }else if(data == "-1"){
            $('#myModal').modal();
            $("#checkConn").html("连接数据源失败@");
          }
        },
        error:function(){
          $('#myModal').modal();
          $("#checkConn").html("数据源添加失败@");
        }
      });
    }
  });

  var checkDataSource = function(){
    var ip = $("#ip").val();
    var port = $("#port").val();
    var username = $("#username").val();
    var password = $("#password").val();
    var databasename = $("#databasename").val();
    var datasourcename = $("#datasourcename").val();
    $("#header").css("display","none");

    if(ip.length==0 || ip == null){
      $("#header").css("display","block");
      $("#show_info").html("请填写正确的IP地址！");
      return false;
    }else if(port.length==0 || port == null){
      $("#header").css("display","block");
      $("#show_info").html("请填写正确的PORT！");
      return false;
    }else if(username.length==0 || username == null){
      $("#header").css("display","block");
      $("#show_info").html("请填写正确的用户名！");
      return false;
    }else if(password.length==0 || password == null) {
      $("#header").css("display", "block");
      $("#show_info").html("请填写正确的密码！");
      return false;
    }else if(databasename.length==0 || databasename == null){
      $("#header").css("display","block");
      $("#show_info").html("请填写正确的数据名！");
      return false;
    }else if(datasourcename.length==0 || datasourcename == null){
      $("#header").css("display","block");
      $("#show_info").html("请填写正确的数据源名！");
      return false;
    }

    return true;
  };

  //连接测试
  $("#testConn").on("click",function(){
    var ip = $("#ip").val();
    var port = $("#port").val();
    var username = $("#username").val();
    var password = $("#password").val();
    var databasename = $("#databasename").val();
    var datasourcename = $("#datasourcename").val();
    var result = checkDataSource();
    if(result == true){
      $.ajax({
        type:"POST",
        async:false,
        url:"/admin/showcheckdatasource",
        data:{ip:ip,port:port,username:username,password:password,datasourcename:datasourcename,databasename:databasename},
        success: function(data){
          if(data == "true"){
            $('#myModal').modal();
            $("#checkConn").html("数据源连接成功@");
          }else if(data == "false"){
            $('#myModal').modal();
            $("#checkConn").html("数据源连接失败@");
          }
        },
        error:function(){
          $('#myModal').modal();
          $("#checkConn").html("数据源连接失败@");
        }
      });
    }
  });

});


$(function() {
    $(".datepicker").datepicker();
    $(".uniform_on").uniform();
    $(".chzn-select").chosen();
    $('.textarea').wysihtml5();

    $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
      var $total = navigation.find('li').length;
      var $current = index+1;
      var $percent = ($current/$total) * 100;
      $('#rootwizard').find('.bar').css({width:$percent+'%'});
      // If it's the last tab then hide the last button and show the finish instead
      if($current >= $total) {
        $('#rootwizard').find('.pager .next').hide();
        $('#rootwizard').find('.pager .finish').show();
        $('#rootwizard').find('.pager .finish').removeClass('disabled');
      } else {
        $('#rootwizard').find('.pager .next').show();
        $('#rootwizard').find('.pager .finish').hide();
      }
    }});
    $('#rootwizard .finish').click(function() {
      alert('Finished!, Starting over!');
      $('#rootwizard').find("a[href*='tab1']").trigger('click');
    });

});
</script>
</body>
</html>

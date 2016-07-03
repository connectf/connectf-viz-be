<%--
  Created by IntelliJ IDEA.
  User: sonny
  Date: 2015/11/16
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>创建用户</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <!-- Bootstrap -->
  <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <link href="resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
  <link href="resources/assets/styles.css" rel="stylesheet" media="screen">
  <link href="resources/bootstrap/css/new-style.css" rel="stylesheet" media="screen">
  <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="resources/vendors/flot/excanvas.min.js"></script><![endif]-->
  <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
  <!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <script src="resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
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
          <li class="dropdown"><a href="/index" role="button"
                                  class="dropdown-toggle" data-toggle="dropdown">数据源<i class="caret"></i>

          </a>
            <ul class="dropdown-menu">
              <li><a tabindex="-1" href="/admin/adddatasource">新增数据源</a></li>
              <li><a tabindex="-1" href="/admin/datasourcelist">数据集列表</a></li>
              <li><a tabindex="-1" href="/admin/gotodataSourcelist">数据源列表</a></li>
            </ul></li>

          <li class="dropdown active"><a href="#" role="button"
                                  class="dropdown-toggle" data-toggle="dropdown">用户管理  <i class="caret"></i>

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
            <form action="#" id="form_sample_1" class="form-horizontal">
              <fieldset>
                <div class="control-group">
                  <label class="control-label">用户名<span class="required">*</span></label>
                  <div class="controls">
                    <input id="username" name="username" type="text" class="span6 m-wrap"/>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">密码<span class="required">*</span></label>
                  <div class="controls">
                    <input id="password" name="password" type="text" class="span6 m-wrap"/>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">邮箱<span class="required">*</span></label>
                  <div class="controls">
                    <input id="emails" name="emails" type="text" class="span6 m-wrap"/>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">用户组<span class="required">*</span></label>
                  <div class="controls">
                    <select class="span6 m-wrap" id="sel_usergroup" name="category">
                      <option value="0">请选择数据源</option>
                      <%--<option value="Category 1">Category 1</option>--%>
                    </select>
                  </div>
                </div>
                <div class="control-group">
                  <label class="control-label">描述<span class="required">*</span></label>
                  <div class="controls">
                    <textarea id="desc" rows="10" cols="30" data-required="1" class="span6 m-wrap"></textarea>
                  </div>
                </div>
                <div class="form-actions">
                  <button type="submit" id="btn_OK" class="btn btn-primary btn_mg">确定 </button>
                  <button type="button" id="btn_cancel" class="btn">取消</button>
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
    <p id="checkUser"></p>
  </div>
  <div class="modal-footer">
    <button class="btn btn-primary" data-dismiss="modal" aria-hidden="true">确定</button>
  </div>
</div>

<footer>
  <p>&copy; Connectf Dev Team 2016</p>
</footer>

<!-- ECharts单文件引入 -->
<link href="resources/vendors/datepicker.css" rel="stylesheet" media="screen">
<link href="resources/vendors/uniform.default.css" rel="stylesheet" media="screen">
<link href="resources/vendors/chosen.min.css" rel="stylesheet" media="screen">

<link href="resources/vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">

<script src="resources/vendors/jquery-1.9.1.js"></script>
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
  });

  $("#btn_cancel").on("click",function(){
    window.location.href = "/index";
  });

  var checkinfo = function(){
    var username = $("#username").val();
    var password = $("#password").val();
    var emails = $("#emails").val();
    var sel_usergroup = $("#sel_usergroup").val();
    var desc = $("#desc").val();
//    alert(username+"="+password+"="+emails+"="+sel_usergroup+"="+desc);
    if(username == null || username.length == 0){
      $("#myModal").modal();
      $("#checkUser").html("请填写用户名@");
      return false;
    }else if(password == null || password.length == 0){
      $("#myModal").modal();
      $("#checkUser").html("请填写密码@");
      return false;
    }else if(emails == null || emails.length == 0){
      $("#myModal").modal();
      $("#checkUser").html("请填写电子邮箱@");
      return false;
    }else if(sel_usergroup == 0){
      $("#myModal").modal();
      $("#checkUser").html("请选择用户组@");
      return false;
    }else if(desc == null || desc.length == 0){
      $("#myModal").modal();
      $("#checkUser").html("请填写描述信息@");
      return false;
    }
    return true;
  };

  $(document).ready(function(){
    $.ajax({
      type:"POST",
      async:false,
      dataType: 'json',
      url:"/admin/getallusergroup",
      data:{},
      success: function(data){
        $.each(data,function(index,value){
          var option = $("<option>").attr("value",value.id).html(value.name);
          $("#sel_usergroup").append(option);
        });
      },
      error:function(){

      }
    });
  });

  $("#btn_OK").on("click",function(){
    var result = checkinfo();
    if(result){
      var username = $("#username").val();
      var password = $("#password").val();
      var emails = $("#emails").val();
      var sel_usergroup = $("#sel_usergroup").val();
      var desc = $("#desc").val();
      $.ajax({
        type:"POST",
        async:false,
        dataType: 'json',
        url:"/admin/adduser",
        data:{
          username:username,
          password:password,
          emails:emails,
          sel_usergroup:sel_usergroup,
          desc:desc
        },
        success: function(data){
            if(data){
              $("#myModal").modal();
              $("#checkUser").html("用户注册成功@");
            }else{
              $("#myModal").modal();
              $("#checkUser").html("用户注册失败或已经注册过@");
            }
        },
        error:function(){
        }
      });
    }
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

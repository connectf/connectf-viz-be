<%--
  Created by IntelliJ IDEA.
  User: sonny
  Date: 2015/11/13
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Connectf Backend</title>
  <!-- Bootstrap -->
  <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <link href="resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
  <link href="resources/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
  <link href="resources/assets/styles.css" rel="stylesheet" media="screen">
  <link href="resources/bootstrap/css/new-style.css" rel="stylesheet" media="screen">
  <%--<script type="text/javascript" src="lib/jquery-1.11.1.min.js"></script>--%>
  <%--<script type="text/javascript" src="lib/jquery.easyui.min.js"></script>--%>
  <!--/.fluid-container-->
  <script src="resources/bootstrap/js/bootstrap.min.js"></script>
  <%--<script src="resources/vendors/easypiechart/jquery.easy-pie-chart.js"></script>--%>
  <script src="resources/assets/scripts.js"></script>
  <script src="resources/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
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
  <script src="resources/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
  <script src="resources/assets/form-validation.js"></script>
  <script src="resources/assets/scripts.js"></script>

  <style type="text/css">
    div.container {width: 80%;}
  </style>
</head>
<body>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container-fluid">
      <a class="btn btn-navbar" data-toggle="collapse"
         data-target=".nav-collapse"> <span class="icon-bar"></span> <span
              class="icon-bar"></span> <span class="icon-bar"></span>
      </a> <a class="brand" href="#" onclick="indexpage()">Connectf</a>
      <div class="nav-collapse collapse">
        <ul class="nav pull-right ">
          <li class="dropdown"><a href="#" role="button"
                                  class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i>  <i class="caret"></i>
          </a>
            <ul class="dropdown-menu">
              <li><a tabindex="-1" href="#">Profile</a></li>
              <li class="divider"></li>
              <li><a tabindex="-1" href="/">Logout</a></li>
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

<!--============================================================================================-->
<div class="row-fluid">
  <!--/span-->
  <div class="span12" id="content">
    <div class="row-fluid section">
      <!-- block -->
      <div class="block">
        <div class="navbar navbar-inner block-header">
          <div class="muted pull-left"><span id="title_name"></span></div>
        </div>
        <div id="info">
          <!--dynamic show some infomation -->
        </div>
      </div>
    </div>
  </div>
</div>
<!--======================================================================================-->
<hr>
<footer>
  <p>&copy; Connectf Dev Team 2016</p>
</footer>

<script>
  jQuery(document).ready(function() {
    FormValidation.init();
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

  $(document).ready(function(){
    var div = $("<div>").attr("class","hero-unit");
    var h1 = $("<h1>").html("欢迎使用 Connectf!");
    var p = $("<p>").html("简单交互式大数据可视化分析。");
    var pa = $("<p>").append($("<a href='http://www.connectf.com' class='btn btn-primary btn-large'>").html("了解更多 &raquo;"));
    div.append(h1).append(p).append(pa);
    div.appendTo($("#info"));
  });

</script>
</body>
</html>

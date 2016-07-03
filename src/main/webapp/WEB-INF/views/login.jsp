<%--
  Created by IntelliJ IDEA.
  User: sonny
  Date: 2015/11/14
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Welcome to Connectf Backend</title>
  <!-- Bootstrap -->
  <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <link href="resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
  <link href="resources/assets/styles.css" rel="stylesheet" media="screen">
  <link href="resources/bootstrap/css/new-style.css" rel="stylesheet" media="screen">
  <script src="resources/vendors/jquery-1.9.1.min.js"></script>
  <script src="resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body id="login" onload='document.loginForm.username.focus();'>
<div id="container">
  <form name='loginForm' class="form-signin">
    <h2 class="form-signin-heading form-tit">请登录</h2>
    <div class="input_mgbox">
    </div>
    <input type="text" class="input-block-level" id="username" name='username' placeholder="请输入用户名">
    <input type="password" class="input-block-level" id="password" name='password' placeholder="请输入密码">
    <label class="checkbox form-me">
      <input type="checkbox" value="remember-me form-me">请记住我的用户名密码
    </label>
    <button class="btn btn-large btn-primary form-but" id="btn" type="button">登 录</button>
  </form>
</div>
</body>
<script type="application/javascript">
  $(document).ready(function(){
    $("#btn").on("click",function(){
      var username = $("#username").val();
      var password = $("#password").val();
      if (username != null && password != null){
        $.ajax({
          type:"POST",
          async:false,
          url:"/useraccess",
          data:{username:username,password:password},
          dataType:'text',
          success:function(object){
            if (object > 0){
              window.location.href = "/index";
            }else{
              alert("用户名或密码输入有误!");
              return;
            }
          },
          error:function(){}
        });
      }else {
        alert("用户名或密码不能为空！");
        return;
      }
    });

  });
</script>
</html>

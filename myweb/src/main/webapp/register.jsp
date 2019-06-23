<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: ABC
  Date: 2019/2/22
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <!-- 在移动端不缩放 -->
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.validate.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <title>注册</title>
    <style type="text/css">
        .center {
            margin: 200px auto;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            var vaildate = $("#Myform").validate({
                errorPlacement: function (error, element) {
                    if ($(element).parent("#username").find("#error")) {
                        if (element.is("input")) {
                            error.appendTo($(element).parent().parent().next());
                        }
                    }
                },
                focusCleanup: true,
                Onsubmit: true,
                rules: {
                    username: {
                        required: true,
                        minlength: 8,
                        maxlength: 12,
                        remote: {
                            type: "POST",
                            url: "checkusername",
                            dataType: "json",
                            data: {
                                username: function () {
                                    return $("#Myusername").val();
                                }
                            }
                        }
                    },
                    password: {
                        required: true,
                        minlength: 8,
                        maxlength: 12
                    },
                    email: {
                        required: true,
                        email: true
                        /* remote:{
                             type:"POST",
                             url:"checkemail",
                             dataType:"json",
                             data:{
                                 email:$("#Myemail").val()
                             }
                         }*/
                    },
                    password2: {
                        required: true,
                        equalTo: "#Mypassword",
                        minlength: 8,
                        maxlength: 12
                    },
                    name: {
                        required: true,
                        minlength: 5,
                        maxlength: 20
                    }
                    /* code:{
                         required:true
                     }*/
                },
                messages: {
                    username: {
                        required: "账号不能为空",
                        minlength: "账号不符合规范",
                        maxlength: "账号不符合规范",
                        remote: "用户名已存在"
                    },
                    password: {
                        required: "密码不能为空",
                        minlength: "密码长度不能少于8位",
                        maxlength: "密码长度不能大于12位"
                    },
                    password2: {
                        required: "请输入密码",
                        equalTo: "两次密码不一致",
                        minlength: "密码长度不能少于8位",
                        maxlength: "密码长度不能大于12位"
                    },
                    name: {
                        required: "请输入昵称",
                        minlength: "昵称长度不能少于5位",
                        maxlength: "昵称长度不能大于20位"
                    },
                    /* code:{
                         required:"验证码不能为空"
                     },*/
                    email: {
                        required: "邮箱不能为空",
                        email: "邮箱格式不正确",
                        //remote:"该邮箱已被使用"
                    }
                }
            });
            $("#span").click(function () {
                var email = $("#Myemail").val();
                if (email == null || email == "") {
                    alert("请输入邮箱!");
                } else {
                    $.ajax({
                        type: "POST",
                        url: "send",
                        data: {
                            email: email
                        },
                        success: function (data) {

                        },
                        error: function () {

                        }
                    })


                }
            });
            $("#submit").click(function () {
                var blog = vaildate.form();
                if (blog == true) {
                    var username = $("#Myusername").val();
                    var password = $("#Mypassword").val();
                    var email = $("#Myemail").val();
                    var code = $("#Mycode").val();
                    var name = $("#Myname").val();
                    $.ajax({
                        type: "POST",
                        url: "active",
                        data: {
                            username: username,
                            password: password,
                            email: email,
                            code: code,
                            name: name
                        },
                        success: function (data) {
                            alert(data);
                            //window.location.href="login.jsp";
                        }
                    });
                }
            });

        });
    </script>
</head>
<body>
<div class="container center">
    <form class="form-horizontal col-lg-offset-2" role="form" method="post" id="Myform">
        <div class="form-group">
            <label class="control-label col-lg-2">账号:</label>
            <div class="col-lg-4">
                <div class="input-group">
                       <span class="input-group-addon">
                           <i class="glyphicon glyphicon-user"></i>
                       </span>
                    <input type="text" class="form-control" placeholder="账号" id="Myusername" name="username">
                </div>
            </div>
            <label class="control-label" for="Myusername"></label>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2">邮箱:</label>
            <div class="col-lg-4">
                <div class="input-group ">
               <span class="input-group-addon">
                   <i class="glyphicon glyphicon-envelope"></i>
               </span>
                    <input type="email" class="form-control" placeholder="邮箱" id="Myemail" name="email">
                </div>
            </div>
            <label class="control-label" for="Myemail"></label>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2">验证码:</label>
            <div class="col-lg-3">
                <div class="input-group">
               <span class="input-group-addon">
                   <i class="glyphicon glyphicon-film"></i>
               </span>
                    <input type="text" class="form-control" placeholder="验证码" id="Mycode" name="code">
                </div>
            </div>
            <span class="btn btn-default" id="span"><a href="#">获取验证码</a></span>
            <label class="control-label" for="Mycode"></label>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2">密码:</label>
            <div class="col-lg-4">
                <div class="input-group ">
                <span class="input-group-addon">
                    <i class="glyphicon glyphicon-lock"></i>
                </span>
                    <input type="password" class="form-control" placeholder="密码" id="Mypassword" name="password">
                </div>
            </div>
            <label class="control-label" for="Mypassword"></label>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2">重复密码:</label>
            <div class="col-lg-4">
                <div class="input-group ">
                <span class="input-group-addon">
                    <i class="glyphicon glyphicon-lock"></i>
                </span>
                    <input type="password" class="form-control" placeholder="密码" id="Mypassword2" name="password2">
                </div>
            </div>
            <label class="control-label" for="Mypassword2"></label>
        </div>
        <%--   <div class="form-group">
                   <label class="control-label col-lg-2">验证码:</label>
               <div class="col-lg-4">
                   <div class="input-group ">
                       <span class="input-group-addon">
                           <i class="glyphicon glyphicon-home"></i>
                       </span>
                       <input type="text" class="form-control" placeholder="验证码" id="">
                   </div>
               </div>
                   <label class="control-label">
                       <canvas id="canvas" height="30px" width="100px"></canvas>
                       <a href="#" id="changeImg">看不清，换一张</a>
                   </label>
           </div>--%>
        <div class="form-group">
            <label class="control-label col-lg-2">昵称:</label>
            <div class="col-lg-4">
                <div class="input-group ">
                <span class="input-group-addon">
                <i class="glyphicon glyphicon-user"></i>
                </span>
                    <input type="text" class="form-control" placeholder="昵称" id="Myname" name="name">
                </div>
            </div>
            <label class="control-label" for="Myname"></label>
        </div>
        <div class="form-group col-lg-9 top">
			<span class="col-lg-offset-1">
                   <a href="#" class="btn btn-default" id="submit">注册</a>
               </span>
        </div>
    </form>
</div>
</body>
</html>
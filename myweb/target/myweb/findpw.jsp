<%--
  Created by IntelliJ IDEA.
  User: ABC
  Date: 2019/3/14
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <!-- 在移动端不缩放 -->
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>找回密码</title>
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.validate.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var vaildate = $("#form").validate({
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
                            url: "loginusername",
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
                    password1: {
                        required: true,
                        equalTo: "#Mypassword",
                        minlength: 8,
                        maxlength: 12
                    },
                },
                messages: {
                    username: {
                        required: "账号不能为空",
                        minlength: "账号不符合规范",
                        maxlength: "账号不符合规范",
                        remote: "用户名不存在"
                    },
                    password: {
                        required: "密码不能为空",
                        minlength: "密码长度不能少于8位",
                        maxlength: "密码长度不能大于12位"
                    },
                    password1: {
                        required: "请输入密码",
                        equalTo: "两次密码不一致",
                        minlength: "密码长度不能少于8位",
                        maxlength: "密码长度不能大于12位"
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
                $.ajax({
                    type: "POST",
                    url: "send",
                    data: {
                        email: $("#Myemail").val()
                    },
                    success: function (data) {
                        alert(data);
                    },
                    error: function () {

                    }
                })
            });

            $("#submit").click(function () {
                alert("点击");
                $.ajax({
                    type: "POST",
                    url: "findpw",
                    dataType: "json",
                    contextType: "",
                    data: {
                        username: $("#Myusername").val(),
                        email: $("#Myemail").val(),
                        code: $("#Mycode").val()
                    },
                    success: function (data) {
                        alert(data);
                    }
                });
            });
        });
    </script>
    <style type="text/css">

    </style>
</head>
<body>
<div class="container center" style="margin-top: 200px">
    <form class="form-horizontal col-lg-offset-3" role="form" method="post" id="form" action="login">
        <div class="form-group">
            <label class="control-label col-lg-2" for="Myusername">账号:</label>
            <div class="col-lg-4">
                <!--<span class="glyphicon glyphicon-user form-control-feedback"></span>-->
                <div class="input-group">
                       <span class="input-group-addon">
                           <i class="glyphicon glyphicon-user"></i>
                       </span>
                    <input type="text" class="form-control" id="Myusername" placeholder="账号" name="username">
                </div>
            </div>
            <label class="control-label"></label>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2" for="Myemail">邮箱:</label>
            <div class="col-lg-4">
                <div class="input-group">
                    <span class="input-group-addon glyphicon glyphicon-lock"></span>
                    <input type="email" class="form-control" id="Myemail" placeholder="邮箱" name="email"/>
                </div>
            </div>
            <label class="control-label"></label>
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
            <label class="control-label col-lg-2">新密码:</label>
            <div class="col-lg-3">
                <div class="input-group">
               <span class="input-group-addon">
                   <i class="glyphicon glyphicon-film"></i>
               </span>
                    <input type="text" class="form-control" placeholder="密码" id="Mypassword" name="password">
                </div>
            </div>

            <label class="control-label" for="Mypassword"></label>
        </div>
        <div class="form-group">
            <label class="control-label col-lg-2">重复密码:</label>
            <div class="col-lg-3">
                <div class="input-group">
               <span class="input-group-addon">
                   <i class="glyphicon glyphicon-film"></i>
               </span>
                    <input type="text" class="form-control" placeholder="重复密码" id="Mypassword1" name="code">
                </div>
            </div>
            <label class="control-label" for="Mypassword1"></label>
        </div>
        <div class="form-group">
            <div class="col-lg-2 col-lg-offset-3">
                <span class="btn btn-default" id="submit">提交</span>
            </div>
        </div>
    </form>
</div>
</body>
</html>

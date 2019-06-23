<%--
  Created by IntelliJ IDEA.
  User: ABC
  Date: 2019/2/24
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <!-- 在移动端不缩放 -->
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.validate.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                url: "getcookie",
                dataType: "json",
                success: function (data) {
                    //$("#Mypassword").val(data.value);
                    //alert(data.value);
                    $("#Myusername").val(data.username);
                    $("#Mypassword").val(data.password);
                    $("#check").attr("checked", true);
                },
                error: function () {
                    alert("cookies 信息获取失败");
                }
            });
            var validate = $("#form").validate({
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
                    }
                },
                messages: {
                    username: {
                        required: "请输入你的账号",
                        minlength: "账号不符合规范",
                        maxlength: "账号不符合规范",
                        remote: "用户名不存在,请重新输入"
                    },
                    password: {
                        required: "请输入你的密码",
                        minlength: "密码不符合规范",
                        maxlength: "密码不符合规范"
                    }
                }
            });
            $("#submit").click(function () {
                var blog = validate.form();
                if (blog == true) {
                    var username = $("#Myusername").val();
                    var password = $("#Mypassword").val();
                    var remember = $("input[type='checkbox']").is(':checked');
                    $.ajax({
                        type: "POST",
                        url: "login",
                        dataType: "json",
                        contextType: "application/json;charset=utf-8",
                        data: {
                            username: $("#Myusername").val(),
                            password: $("#Mypassword").val(),
                            remember: $("input[type='checkbox']").is(':checked')
                        },
                        success: function (data) {
                            if (data == true) {
                                window.location.href = "blog.jsp";
                            }
                        }
                    });
                }
            });
        });
    </script>
    <style type="text/css">
        .center {
        / / background-color: #2aabd2;
            margin: 200px auto;
        }

        body {
            font-size: 20px;
        }

        .top {
            margin: 10px 0px;
        }
    </style>
</head>
<body>
<div class="container center">
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
            <label class="control-label col-lg-2" for="Mypassword">密码:</label>
            <div class="col-lg-4">
                <div class="input-group top">
                    <span class="input-group-addon glyphicon glyphicon-lock"></span>
                    <input type="password" class="form-control" id="Mypassword" placeholder="密码" name="password"/>
                </div>
            </div>
            <label class="control-label"></label>
        </div>
        <div class="form-group">
            <div class="col-lg-6  col-lg-offset-1">
                <div class="checkbox col-lg-6">
                    <div class="input-group">
                        <input type="checkbox" id="check">记住我
                    </div>
                </div>
                <div class="col-lg-6">
                    <%--<a class="btn-link btn" href="#" style="color: red">
                        <strong>忘记密码?</strong>
                    </a>--%>
                    <div class="input-group">
                        <a class="btn-link btn" href="blog.jsp">
                            <span>忘记密码?</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group col-lg-9">
           <span class="col-lg-4 col-lg-offset-2" id="login">
               <button type="button" class="btn-default btn" id="submit">登录</button>
           </span>
            <span class="col-lg-6">
                   <a href="#" class="btn btn-default">注册</a>
               </span>
        </div>
    </form>
</div>
</body>
</html>
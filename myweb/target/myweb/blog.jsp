<%--
  Created by IntelliJ IDEA.
  User: ABC
  Date: 2019/2/22
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <!-- 在移动端不缩放 -->
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>blog</title>
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script type="text/javascript" src="static/js/jquery.validate.js"></script>
    <script type="text/javascript" src="js/blog.js"></script>
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/blog.css">
    <script type="text/javascript">
        /*页面初始化博客总页数*/
        var index = 0;

        var size = 0;

        var lable;

        var type;
        /*页面初始化页码*/
        window.startindex = 1;
        /*lable查询初始化页码*/
        window.lableindex = 1;
        /*type查询初始化页码*/
        window.typeindex = 1;
        $(function () {
            /*分页图标切换*/
            $(".pagehelperone").siblings().hide();
            $("#lablelist").on('click', '.blog_lable_a', function () {
                $(".pagehelpertwo").show().siblings().hide();
                lableindex = 1;
                lable = $(this).text();
                findlable(lable);
            });
            $("#ul").on('click', '.blog_type', function () {
                $(".pagehelpertwo").show().siblings().hide();
                lableindex = 1;
                lable = $(this).text();
                findlable(lable);
            });
            $("#ul").on('click', '.blog_sign', function () {
                var url = "showblog.jsp?param=" + $(this).text();
                window.location.href = url;
            });

            /*依据lable查询博客*/
            function findlable(lable) {
                $.ajax({
                    type: "POST",
                    url: "findlable",
                    data: {
                        lable: lable,
                        startindex: 1
                    },
                    dataType: "json",
                    success: function (data) {
                        alert("true");
                        index = data.totalpage;
                        alert(index);
                        //清空页面
                        $("div").remove(".clone");
                        /*显示缩略图*/
                        showfirst(data);
                        /*图片*/
                        image(data);
                        /*显示查询到的数据*/
                        show(data);
                        //检测
                        searchtwo(data);
                    },
                    error: function (data) {
                        alert("false");
                    }
                });
            }

            /*翻页*/
            $("#nextwo").click(function () {
                lableindex = lableindex + 1;
                if (lableindex > index) {
                    lableindex = index;
                } else {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "findlable",
                        data: {
                            startindex: lableindex,
                            lable: lable
                        },
                        success: function (data) {
                            //清空页面
                            $("div").remove(".clone");
                            /*显示缩略图*/
                            showfirst(data);
                            /*图片*/
                            image(data);
                            /*显示查询到的数据*/
                            show(data);
                            //检测
                            searchtwo(data);
                        }
                    });
                }
            });
            $("#pretwo").click(function () {
                window.lableindex = lableindex - 1;
                if (window.lableindex < 1) {
                    window.lableindex = 1;
                } else {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "findlable",
                        data: {
                            startindex: startindex,
                            lable: lable
                        },
                        success: function (data) {
                            //清空页面
                            $("div").remove(".clone");
                            /*显示缩略图*/
                            showfirst(data);
                            /*图片*/
                            image(data);
                            /*显示查询到的数据*/
                            show(data);
                            //检测
                            searchtwo(data);
                        }
                    });
                }
            });
            /*翻页*/
            /*依据lable查询博客*/

            /*依据type查询博客*/
            $("#typelist").on('click', '.blog_type_a', function () {
                $(".pagehelperthree").show().siblings().hide();
                type = $(this).text();
                typeindex = 1;
                findtype(type);
            });

            function findtype(type) {
                $.ajax({
                    type: "POST",
                    url: "findtype",
                    dataType: "json",
                    data: {
                        type: type,
                        startindex: 1
                    },
                    success: function (data) {
                        alert("true");
                        index = data.totalpage;
                        alert(index);
                        //清空页面
                        $("div").remove(".clone");
                        /*显示缩略图*/
                        showfirst(data);
                        /*图片*/
                        image(data);
                        /*显示查询到的数据*/
                        show(data);
                        //检测
                        searchthree(data);
                    },
                    error: function (data) {
                        alert("false");
                    }
                });
            }

            /*翻页*/
            $("#nexthree").click(function () {
                typeindex = typeindex + 1;
                if (typeindex > index) {
                    typeindex = index;
                } else {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "findtype",
                        data: {
                            startindex: typeindex,
                            type: type
                        },
                        success: function (data) {
                            //清空页面
                            $("div").remove(".clone");
                            /*显示缩略图*/
                            showfirst(data);
                            /*图片*/
                            image(data);
                            /*显示查询到的数据*/
                            show(data);
                            //检测
                            searchthree(data);
                        }
                    });
                }
            });
            $("#prethree").click(function () {
                window.typeindex = typeindex - 1;
                if (window.typeindex < 1) {
                    window.typeindex = 1;
                } else {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "findtype",
                        data: {
                            startindex: typeindex,
                            type: type
                        },
                        success: function (data) {
                            //清空页面
                            $("div").remove(".clone");
                            /*显示缩略图*/
                            showfirst(data);
                            /*图片*/
                            image(data);
                            /*显示查询到的数据*/
                            show(data);
                            //检测
                            searchthree(data);
                        }
                    });
                }
            });
            /*翻页*/
            /*依据type查询博客*/
            /*初始化页面*/
            thumbnail(1);
            /*初始化页面*/
            /*初始化博客类别*/
            showtype();
            /*初始化博客类别*/
            /*初始化博客标签*/
            showlable();
            /*初始化博客标签*/
            /*用户未登录时头像框隐藏*/
            $("#userimage").hide();
            /*模态框登录*/
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
                    if (data.username != "") {
                        getimage(data.username);
                    }
                },
                error: function () {
                    alert("cookies 信息获取失败");
                }
            });
            var validatelogin = $("#form").validate({
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
                    loginusername: {
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
                    loginpassword: {
                        required: true,
                        minlength: 8,
                        maxlength: 12
                    }
                },
                messages: {
                    loginusername: {
                        required: "请输入你的账号",
                        minlength: "账号不符合规范",
                        maxlength: "账号不符合规范",
                        remote: "用户名不存在,请重新输入"
                    },
                    loginpassword: {
                        required: "请输入你的密码",
                        minlength: "密码不符合规范",
                        maxlength: "密码不符合规范"
                    }
                }
            });
            $("#submit").click(function () {
                var blog = validatelogin.form();
                if (blog == true) {
                    var username = $("#Myusername").val();
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
                                $("#mymodal").modal("hide");
                                getimage(username);
                            } else {
                                alert("你的账号或密码有误");
                            }
                        }
                    });
                }
            });

            /*退出登录*/
            $("#quit").click(function () {
                $("#userimage").hide();
                $("#login1").show();
            });
            /*退出登录*/

            /*个人中心*/
            $("#personal").click(function () {
                window.location.href = "personal.jsp";
            });
            /*个人中心*/

            /*获取用户头像*/
            function getimage(username) {
                $.ajax({
                    type: "POST",
                    url: "getimage",
                    dataType: "json",
                    async: false,
                    data: {
                        username: username
                    },
                    success: function (data) {
                        $("#login1").hide();
                        $("#userimage1").attr("src", data.image);
                        $("#userimage").show();
                    }
                });
            }

            /*获取用户头像*/
            /*模态框登录*/

            /*模态框注册*/
            var vaildateregister = $("#Myform").validate({
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
                    registerusername: {
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
                    registerpassword: {
                        required: true,
                        minlength: 8,
                        maxlength: 12
                    },
                    registeremail: {
                        required: true,
                        email: true
                    },
                    registerpassword2: {
                        required: true,
                        equalTo: "#Mypassword1",
                        minlength: 8,
                        maxlength: 12
                    },
                    registername: {
                        required: true,
                        minlength: 5,
                        maxlength: 20
                    }
                },
                messages: {
                    registerusername: {
                        required: "账号不能为空",
                        minlength: "账号不符合规范",
                        maxlength: "账号不符合规范",
                        remote: "用户名已存在"
                    },
                    registerpassword: {
                        required: "密码不能为空",
                        minlength: "密码长度不能少于8位",
                        maxlength: "密码长度不能大于12位"
                    },
                    registerpassword2: {
                        required: "请输入密码",
                        equalTo: "两次密码不一致",
                        minlength: "密码长度不能少于8位",
                        maxlength: "密码长度不能大于12位"
                    },
                    registername: {
                        required: "请输入昵称",
                        minlength: "昵称长度不能少于5位",
                        maxlength: "昵称长度不能大于20位"
                    },
                    registeremail: {
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
            $("#modalregister").click(function () {
                var blog = vaildateregister.form();
                if (blog == true) {
                    var username = $("#Myusername1").val();
                    var password = $("#Mypassword1").val();
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
                            $("#registermodal").modal('hide');
                            //window.location.href="login.jsp";
                        }
                    });
                }
            });
            /*模态框验证*/

            /*搜索框*/
            $("#input").keydown(function (event) {
                if (event.keyCode == 13) {
                    find($("#input").val());
                }
            });
            /*搜索框*/

            /*翻页*/
            $("#nexone").click(function () {
                startindex = startindex + 1;
                if (startindex > index) {
                    startindex = index;
                } else {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "find",
                        data: {
                            'startindex': startindex,
                            event: $("#input").val()
                        },
                        success: function (data) {
                            //清空页面
                            $("div").remove(".clone");
                            /*显示缩略图*/
                            showfirst(data);
                            /*图片*/
                            image(data);
                            /*显示查询到的数据*/
                            show(data);
                            //检测
                            search(data);
                        }
                    });
                }
            });
            $("#preone").click(function () {
                window.startindex = startindex - 1;
                if (window.startindex < 1) {
                    window.startindex = 1;
                } else {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "find",
                        data: {
                            'startindex': startindex,
                            event: $("#input").val()
                        },
                        success: function (data) {
                            //清空页面
                            $("div").remove(".clone");
                            /*显示缩略图*/
                            showfirst(data);
                            /*图片*/
                            image(data);
                            /*显示查询到的数据*/
                            show(data);
                            //检测
                            search(data);
                        }
                    });
                }
            });
            /*翻页*/
            /*轮播图控制*/
            $('.carousel').carousel({
                interval: 2000
            });
            $("#mynav a").click(function (e) {
                $(this).tab("show");
            });
            $(".carousel-control").css("line-height", $('.carousel-inner img').height() + "px");
            //当浏览器窗口大小改变时的事件
            $(window).resize(function () {
                var $height = $('.carousel-inner img').eq(0).height() ||
                    $('.carousel-inner img').eq(1).height() ||
                    $('.carousel-inner img').eq(2).height();
                $(".carousel-control").css("line-height", $height + "px");
            });
            /*轮播图控制*/
            /*初始化导航栏切换颜色*/
            $("#mynav .switch").click(function () {
                var index = $(this).index();
                $(this).removeClass("active");
            });
            $(".home-page").click(function () {
                $(".pagehelperone").siblings().hide();
                //清空页面
                $("div").remove(".clone");
                thumbnail(1);
            });
            $(window).scroll(function () {
                if ($(window).scrollTop() > 300) {
                    $("#top").fadeIn(500);
                } else {
                    $("#top").fadeOut(500);
                }
            });
            $("#top").click(function () {
                $("body html").animate({scrollTop: 0}, 1000);
            });
        });
    </script>
</head>
<body>
<%--登录模态框--%>
<div class="modal fade container-fluid" id="mymodal" data-keyboard="false" tabindex="-1" role="dialog"
     aria-labelledby="mymodallable" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 600px;height: 300px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="">欢迎登录!</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" method="post" id="form" action="login">
                    <div class="form-group">
                        <label class="control-label col-lg-2" for="Myusername">账号:</label>
                        <div class="col-lg-6">
                            <!--<span class="glyphicon glyphicon-user form-control-feedback"></span>-->
                            <div class="input-group">
                       <span class="input-group-addon">
                           <i class="glyphicon glyphicon-user"></i>
                       </span>
                                <input type="text" class="form-control" id="Myusername" placeholder="账号"
                                       name="loginusername">
                            </div>
                        </div>
                        <label class="control-label"></label>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-2" for="Mypassword">密码:</label>
                        <div class="col-lg-6">
                            <div class="input-group top">
                                <span class="input-group-addon glyphicon glyphicon-lock"></span>
                                <input type="password" class="form-control" id="Mypassword" placeholder="密码"
                                       name="loginpassword"/>
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
                    </div>
                </form>
            </div>
            <%--<div class="modal-footer">
                <button type="button" class="btn-default btn" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">提交更改</button>
            </div>--%>
        </div>

    </div>
</div>
<%--登录模态框--%>
<%--注册模态框--%>
<div class="modal fade" id="registermodal" tabindex="-1" role="dialog" aria-hidden="true"
     aria-labelledby="registermodallable">
    <div class="modal-dialog">
        <div class="modal-content" style="height: 450px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="registermodallable">欢迎来到注册页面</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" method="post" id="Myform">
                    <div class="form-group">
                        <label class="control-label col-lg-2">账号:</label>
                        <div class="col-lg-6">
                            <div class="input-group">
                                   <span class="input-group-addon">
                                       <i class="glyphicon glyphicon-user"></i>
                                   </span>
                                <input type="text" class="form-control" placeholder="账号" id="Myusername1"
                                       name="registerusername">
                            </div>
                        </div>
                        <label class="control-label" for="Myusername"></label>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-2">邮箱:</label>
                        <div class="col-lg-6">
                            <div class="input-group ">
                               <span class="input-group-addon">
                                   <i class="glyphicon glyphicon-envelope"></i>
                               </span>
                                <input type="email" class="form-control" placeholder="邮箱" id="Myemail"
                                       name="registeremail">
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
                                <input type="text" class="form-control" placeholder="验证码" id="Mycode"
                                       name="registercode">
                            </div>
                        </div>
                        <span class="btn btn-default" id="span"><a href="#"
                                                                   style="text-decoration: none">获取验证码</a></span>
                        <label class="control-label" for="Mycode"></label>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-2">密码:</label>
                        <div class="col-lg-6">
                            <div class="input-group ">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-lock"></i>
                                    </span>
                                <input type="password" class="form-control" placeholder="密码" id="Mypassword1"
                                       name="registerpassword">
                            </div>
                        </div>
                        <label class="control-label" for="Mypassword"></label>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-2">重复密码:</label>
                        <div class="col-lg-6">
                            <div class="input-group ">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-lock"></i>
                                    </span>
                                <input type="password" class="form-control" placeholder="密码" id="Mypassword2"
                                       name="registerpassword2">
                            </div>
                        </div>
                        <label class="control-label" for="Mypassword2"></label>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-2">昵称:</label>
                        <div class="col-lg-6">
                            <div class="input-group ">
                                    <span class="input-group-addon">
                                    <i class="glyphicon glyphicon-user"></i>
                                    </span>
                                <input type="text" class="form-control" placeholder="昵称" id="Myname"
                                       name="registername">
                            </div>
                        </div>
                        <label class="control-label" for="Myname"></label>
                    </div>
                    <div class="form-group col-lg-9" style="margin-top: 20px">
                            <span class="col-lg-offset-4">
                                   <a href="#" class="btn btn-default" id="modalregister">注册</a>
                               </span>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--注册模态框--%>
<%--背景图--%>
<nav class="navbar navbar-default"
     style="margin-bottom: 0px;background: url('image/background.png') no-repeat;-webkit-background-size: 1910px;background-size: 1910px 300px; width: 1910px;height: 300px"
     role="navigation">
    <!--导航条  -->
    <div class="container-fluid" style="">
        <div class="row"><%--col-lg-offset-1--%>
            <div class="navbar-header col-sm-offset-1">
                <%--<a href="#" class="navbar-brand" style="padding: 0px">
                    <img src="image/logo.jpg" class="nav-image">
                </a>--%>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#login">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="mynav">
                <%-- <div class="nav navbar-nav col-lg-offset-2">
                     <li style="margin: 0px 10px;" class="active switch "><a href="#" ><span class="glyphicon glyphicon-home"></span> 首页</a></li>
                     <li style="margin: 0px 10px" class="switch"><a href="#" ><span class="glyphicon glyphicon-list"></span> 资讯</a></li>
                     <li style="margin: 0px 10px" class="switch"><a href="#"><span class="glyphicon glyphicon-fire "></span> 产品</a></li>
                     <li class="dropdown switch" style="margin: 0px 10px">
                         <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="dropdownmenu">
                             下拉菜单
                             <span class="caret"></span>
                         </a>
                         <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownmenu">
                             <li role="presentation">
                                 <a href="index.jsp" data-stopPropagation="true" role="menuitem" tabindex="-1" id="menu">菜单一</a></li>
                             <li><a href="personal.jsp" data-stopPropagation="true">菜单二</a></li>
                         </ul>
                     </li>
                     <li class="switch"><a href="#"><span class="glyphicon glyphicon-question-sign"></span> 关于</a></li>
                 </div>--%>
                <div class="nav navbar-nav navbar-right" id="login1" style="margin-right: 20px;">
                    <li class="switch home-page"><a href="#" style="margin: 0px 20px;color: white;outline: none"><span
                            class="glyphicon glyphicon-tasks"></span> 首页</a></li>
                    <li class="switch"><a href="#" style="margin: 0px 20px;color: white;outline: none"
                                          data-toggle="modal" data-target="#mymodal"><span
                            class="glyphicon glyphicon-user"></span> 登录</a></li>
                    <li class="switch"><a href="#" style="margin: 0px 10px;color: white;outline: none"
                                          data-toggle="modal" data-target="#registermodal"><span
                            class="glyphicon glyphicon-log-in"></span> 注册</a></li>
                </div>
                <div class="navbar-right" style="margin-right: 20px;" id="userimage">
                    <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="" class="nav-image" id="userimage1">
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="personal.jsp" id="personal">个人中心</a></li>
                            <li><a href="writeblog.jsp">写个博客</a></li>
                            <%--
                            <li><a href="#">我的关注</a></li>--%>
                            <li><a href="#" id="quit">退出登录</a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!--导航条  -->
    <div style="color:white;margin-top: 100px">
        <h1 style="font-size: 30px;text-align: center"><strong style="font-style: italic">小陈</strong>'s Blog----change
            from today</h1>
        <hr style="display: block; height: 2px;width: 200px;text-align: center; color: #2aabd2;margin: auto;background-color: #2aabd2">
        <p style="text-align: center;margin-top: 20px;font-size: 20px">路在脚下,天在远方</p>
    </div>
</nav>
<%--背景图--%>
<!-- 轮播图开始 -->
<%--<div id="mycarousel" class="carousel slide">
    <ol class="carousel-indicators">
        <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
        <li data-target="#mycarousel" data-slide-to="1"></li>
        <li data-target="#mycarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img alt="第一张" src="image/background.png">
        </div>
        <div class="item">
            <img alt="第二张" src="image/background2.png" >
        </div>
        <div class="item">
            <img alt="第三张" src="image/background3.jpg" >
        </div>
    </div>
    <a href="#mycarousel" data-slide="prev" class="carousel-control left">&lsaquo;</a>
    <a href="#mycarousel" data-slide="next" class="carousel-control right">&rsaquo;</a>
</div>--%>
<!--轮播图结束-->
<!--主体部分  -->
<div class="container-fluid container-style">
    <div class="row">
        <div class="col-md-7 col-md-offset-1">
            <div class="col-md-12" style="margin-bottom: 50px" id="ul">
                <div class="col-sm-6 col-md-4 thumbnail-image" id="li">
                    <div class="thumbnail img" style="padding: 0;margin-bottom: 5px">
                        <%--博客图片--%>
                        <img src="image/java.png"
                             alt="通用的占位符缩略图" style="" id="blog_image">
                    </div>
                    <div class="caption title" style="">
                        <%--博客标题--%>
                        <a style="font-size: 15px;display:block;text-decoration: none;margin-left: 10px" id="blog_sign"
                           class="blog_sign" href="#"></a>
                        <div style="float: right;margin-right: 10px">
                            <span>By
                                <%--博客所属人--%>
                            <a href="#" class="blog_people" style="text-decoration: none">
                            </a></span>

                        </div>
                        <div class="title_text" style="clear: both;padding-left: 10px; margin-top: 50px;">
                            <%--博客内容简介--%>
                            <%--<p class="blog_intro"></p>--%>
                            <p style="margin-left: 5px">
                                <span class="glyphicon glyphicon-pencil"></span>
                                <%--博客所属类别--%>
                                <a href="#" onclick="" class="blog_type" style="text-decoration: none;">

                                </a>

                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pagehelper">
                <div class="pager pagination-lg pagehelperone" style="margin:20px 200px 20px 200px">
                    <li class="previous preone" id="preone"><a href="#">&larr;Previous</a></li>
                    <li class="next nexone" id="nexone"><a href="#">&rarr;Next</a></li>
                </div>
                <div class="pager pagination-lg pagehelpertwo" style="margin:20px 200px 20px 200px">
                    <li class="previous pretwo" id="pretwo"><a href="#">&larr;Previous</a></li>
                    <li class="next nextwo" id="nextwo"><a href="#">&rarr;Next</a></li>
                </div>
                <div class="pager pagination-lg pagehelperthree" style="margin:20px 200px 20px 200px">
                    <li class="previous prethree" id="prethree"><a href="#">&larr;Previous</a></li>
                    <li class="next nexthree" id="nexthree"><a href="#">&rarr;Next</a></li>
                </div>
            </div>
        </div>

        <div class="col-md-2" style="">
            <div class="form-inline " role="form" style="margin: 10px auto;">
                <div class="form-group">
                    <label class="sr-only control-label">
                        搜索
                    </label>
                    <input type="text" class="form-control" id="input" placeholder="请输入关键字" style="border-radius: 25px">
                </div>
            </div>
            <div class="title">
                <p>简介</p>
                <p style="font-size: 14px">记录成为程序员以来的历程,分享自己的认知,
                    如果对你有帮助可以订阅最下方的RSS或者公众号.</p>
            </div>
            <div id="typelist">
                <h4>文章分类</h4>
                <div class="list-group-item type" style="" id="type">
                    <a href="#" style="text-decoration: none" class="blog_type_a"></a>(
                    <span style="margin: 0px;padding: 0px;" class="blog_type_span"></span>
                    )
                </div>
            </div>
            <div class="lablelist" id="lablelist">
                <h4>文章标签</h4>
                <div class="btn-group" id="blog_lable" style="display: none;margin-right: 10px">
                    <a type="button" class="btn btn-default blog_lable_a" style="border-radius: 25px;" href="#"
                       id="blog_lable_a"></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--主体结束  -->
<!--结尾  -->
<footer class="footer">
    <div class="container-fluid">
        <div class="col-md-4">
            <div style="margin: auto;">
                <h4 style="margin-left: 100px">关于</h4>
                <p style="margin-left: 100px">编程是一件幸福的事情,不要让你的工作变得索然无味.</p>
                <ul style="margin-left: 100px">
                    <li>
                        <span class="glyphicon glyphicon-map-marker"></span>
                        <a href="#" style="color: #cccccc;" style="text-decoration: none"> HangZhou,China</a>
                    </li>
                    <li class="footer-first">
                        <span class="glyphicon glyphicon-envelope"></span>
                        <a href="#" style="text-decoration: none;color: #cccccc;margin-left: 5px;font-size: 15px">
                            niudear@foxmail.com</a>
                    </li>
                    <li class="footer-first">
                        <span class="glyphicon glyphicon-map-marker"></span>
                        <a href="#" style="text-decoration: none">2017 皖ICP备17023807号</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-4" style="">
            <div class="col-md-4 col-md-offset-4">
                <h4>友情链接</h4>
                <ul>
                    <li class="footer-second"><a href="http://www.mengxiang.pro/f"
                                                 style="text-decoration: none">梦翔社团</a></li>
                    <li class="footer-second"><a href="http://www.nyist.edu.cn/"
                                                 style="text-decoration: none">南阳理工学院</a></li>
                    <li class="footer-second"><a href="https://blog.csdn.net/" style="text-decoration: none">CSDN博客</a>
                    </li>
                    <li class="footer-second"><a href="http://www.runoob.com/" style="text-decoration: none">菜鸟教程</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-4">
            <div style="margin: 0px 100px;">
                <img src="image/erweima.png" style="width: 150px;height: 150px;margin:20px 100px">
            </div>
        </div>
    </div>
</footer>
<!--结尾  -->
<a href="#" id="top"
   style="text-decoration: none;display: none; position: fixed;bottom: 60px;right:20px;width:37px;height:37px;text-align: center;background-color: #cccccc;border-radius: 50%">
    <b class="glyphicon glyphicon-chevron-up" style="font-size: 25px;"></b>
</a>
</body>
</html>
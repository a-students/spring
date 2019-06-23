<%--
  Created by IntelliJ IDEA.
  User: ABC
  Date: 2019/4/19
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <!-- 在移动端不缩放 -->
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>showblog</title>
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script type="text/javascript" src="static/js/jquery.validate.js"></script>
    <script type="text/javascript" src="js/blog.js"></script>
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/blog.css">
    <script type="text/javascript">
        var size = 0;
        var a;
        $(function () {
            /*初始化博客标签*/
            showlable();
            showtype();
            /*用户未登录时头像框隐藏*/
            $("#userimage").hide();
            var sign = '<%=request.getParameter("param")%>';
            showcontent(sign);
        });

        /*显示博客内容*/
        function showcontent(sign) {
            $.ajax({
                type: "POST",
                url: "showcontent",
                dataType: "json",
                data: {
                    sign: sign
                },
                success: function (data) {
                    $("#content").append(data.blog.blog_content);
                    $(".sign").append(sign);
                    $(".lable").append(data.blog.blog_lable);
                    $(".people").append(data.blog.blog_people);
                    $("#title").append(sign);
                },
                error: function (data) {
                    alert("false");
                }
            });
        }

        /*显示博客内容*/
    </script>
</head>
<body>
<!--导航条  -->
<nav class="navbar navbar-default"
     style="margin-bottom: 0px;background: url('image/background.png') no-repeat;-webkit-background-size: 1910px;background-size: 1910px 300px; width: 1910px;height: 300px"
     role="navigation">
    <div class="container-fluid">
        <div class="row">
            <div class="navbar-header col-sm-offset-1">
                <a href="#" class="navbar-brand" style="padding: 0px">
                    <img src="image/logo.jpg" class="nav-image">
                </a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#login">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="mynav">
                <div class="nav navbar-nav navbar-right" id="login1" style="margin-right: 20px;">
                    <li><a href="test.jsp" style="margin: 0px 20px;color: white"><span
                            class="glyphicon glyphicon-user"></span> 首页</a></li>
                    <li><a href="#" style="margin: 0px 10px;color: white"><span
                            class="glyphicon glyphicon-log-in"></span> 关于</a></li>
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
</nav>
<!--导航条  -->
<!--主体部分  -->
<div class="container-fluid">
    <div class="row">
        <div class="col-md-7 col-md-offset-1" style="">
            <div style="margin: 20px">
                <h1 class="sign" style="font-size: 30px"></h1>
                <div class="">
                     <span style="margin: 0px 10px">
                        <span class="glyphicon glyphicon-pencil"></span>
                        <a href="#" class="lable" style="text-decoration: none"></a>
                    </span>
                    <span style="margin: 0px 10px">
                        <span class="glyphicon glyphicon-tag"></span>
                        <a href="#" class="people" style="text-decoration: none"></a>
                    </span>
                </div>
            </div>
            <div class="col-md-12" style="" id="content">
            </div>
            <div style="background-color:#E0E0E0;font-size: 15px;" class="col-md-12">
                <ul>
                    <li class="" style="margin: 10px 10px">版权声明:感谢您的阅读,本文由
                        <a href="#">小陈's blog</a>
                        版权所有.如若转载,请注明出处
                    </li>
                    <li style="margin: 10px 10px">
                        文章标题:
                        <a href="#" id="title">

                        </a></li>
                    <li style="margin: 10px 10px">
                        文章链接<a href="#">http://localhost:8080/myweb_war_exploded/test.jsp</a></li>
                </ul>
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
        <div class="col-md-3 col-lg-offset-1">
            <h4>关于</h4>
            <p>编程是一件幸福的事情,不要让你的工作变得索然无味.</p>
            <ul>
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
        <div class="col-md-4">
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
            <div class="col-md-4 col-md-offset-4">
                <ul>
                    <li class="footer-three"><a href="http://jquery.com/" style="text-decoration: none">Jquery</a></li>
                    <li class="footer-three"><a href="http://www.bootcss.com/"
                                                style="text-decoration: none">Bootstrap</a></li>
                    <li class="footer-three"><a href="http://www.w3school.com.cn/ajax/index.asp"
                                                style="text-decoration: none">Ajax</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>
<!--结尾  -->
</body>
</html>

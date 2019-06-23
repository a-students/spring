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
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }

        .carousel-inner img {
            margin: 0 auto;
        }

        #mycarousel {
            margin: 0px auto;
            padding: 0px auto;
        }

        .carousel-control {
            font-size: 100px;
        }

        .footer ul {
            list-style: none;
            margin-top: 10px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            var pn = 1;
            $('.carousel').carousel({
                interval: 2000
            })
            $("#mynav a").click(function (e) {
                //alert(e);
                e.preventDefault();
                $(this).tab("show");
            });
            $(".carousel-control").css("line-height", $('.carousel-inner img').height() + "px");
            //当浏览器窗口大小改变时的事件
            $(window).resize(function () {

                //var height=$(".corousel-inner img");
                var $height = $('.carousel-inner img').eq(0).height() ||
                    $('.carousel-inner img').eq(1).height() ||
                    $('.carousel-inner img').eq(2).height();
                $(".carousel-control").css("line-height", $height + "px");
                //console.log($height);
            });
            list(pn);
        });

        function list(pn) {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "query",
                data: {
                    'startindex': pn
                },
                success: function (data) {
                    /*显示查询到的数据*/
                    showfirst(data);
                    /*图片*/
                    image(data);
                    /*title*/
                    title(data);
                    /*       for (var i=0;i<data.list.length;i++){
                               var pan=$("#li").clone();
                               pan.css("display","inline");
                               $("#ul").append(pan);
                               var title=data.list[i].blog_id;
                               //alert(title);
                               $(".img img").attr("src","image/cat.jpg");
                               $("#ul h3").eq(i+1).text(title);
                           }*/

                    //pan.appendTo("#ul");
                    //$("#ul").append(pan.attr("style","display:inline"));
                }
            })
        }

        function showfirst(data) {
            for (var i = 0; i < data.list.length; i++) {
                var pan = $("#li").clone().css("display", "inline");
                $("#ul").append(pan);
            }
        }

        function image(data) {
            for (var i = 1; i <= data.list.length; i++) {
                $("#ul img").eq(i).attr("src", "image/cat.jpg");
            }
        }

        function title(data) {
            for (var i = 1; i <= data.list.length; i++) {
                var title = data.list[i - 1].blog_id;
                $("#ul h3").eq(i).text(title);
            }
        }
    </script>
</head>
<body>
<!--导航条  -->
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <a href="#" class="navbar-brand">
                LOGO
            </a>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mynav">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="mynav">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-list"></span> 资讯</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-fire"></span> 产品</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown">
                        下拉菜单
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">菜单一</a></
                        +
                        li>
                        <li><a href="#">菜单二</a></li>
                    </ul>
                </li>
                <li><a href="#"><span class="glyphicon glyphicon-question-sign"></span> 关于</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="login.jsp">登录</a></li>
                <li><a href="#">注册</a></li>
            </ul>
        </div>
        </form>
    </div>
</nav>
<!--导航条  -->
<!-- 轮播图开始 -->
<div id="mycarousel" class="carousel slide">
    <ol class="carousel-indicators">
        <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
        <li data-target="#mycarousel" data-slide-to="1"></li>
        <li data-target="#mycarousel" data-slide-to="2"></li>
    </ol>
    <!--  <ol class="carousel-indicators">
    <li data-target="#mycarousel" data-slide-to="0"
    class="active"></li>
    <li data-target="#mycarousel" data-slide-to="1"></li>
    <li data-target="#mycarousel" data-slide-to="2"></li>
    </ol> -->
    <div class="carousel-inner">
        <div class="item active">
            <img alt="第一张" src="image/slide1.png">
        </div>
        <div class="item">
            <img alt="第二张" src="image/slide2.png">
        </div>
        <div class="item">
            <img alt="第三张" src="image/slide3.png">
        </div>
    </div>
    <a href="#mycarousel" data-slide="prev" class="carousel-control left">&lsaquo;</a>
    <a href="#mycarousel" data-slide="next" class="carousel-control right">&rsaquo;</a>
</div>
<!--轮播图结束-->
<!--主体部分  -->
<div class="container" style="margin: 50px 0;">
    <div class="row">
        <div class="col-md-7 col-md-offset-2" style="">
            <div class="col-md-12" id="ul">
                <div class="col-sm-6 col-md-4" style="display: none" id="li">
                    <div class="thumbnail img">
                        <img src="image/java.png"
                             alt="通用的占位符缩略图">
                    </div>
                    <div class="caption title">
                        <h3>缩略图标签</h3>
                        <div style="float: right" class="title_a">
                            <a href="#">
                                chen
                            </a>
                        </div>
                        <div class="title_text" style="clear: both">
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <%--<div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img src="image/cat.jpg"
                             alt="通用的占位符缩略图">
                    </div>
                    <div class="caption">
                        <h3>缩略图标签</h3>
                        <div style="float: right">
                            <a href="#">
                                chen
                            </a>
                        </div>
                        <div class="" style="clear: both">
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img src="image/cat.jpg"
                             alt="通用的占位符缩略图">
                    </div>
                    <div class="caption">
                        <h3>缩略图标签</h3>
                        <div style="float: right">
                            <a href="#">
                                chen
                            </a>
                        </div>
                        <div class="" style="clear: both">
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>--%>
                <%--       <div class="col-sm-6 col-md-4">
                           <div class="thumbnail">
                               <img src="image/cat.jpg"
                                    alt="通用的占位符缩略图">
                           </div>
                           <div class="caption">
                               <h3>缩略图标签</h3>
                               <div style="float: right">
                                   by
                                   <a href="#">
                                       chen
                                   </a>
                               </div>
                                   <div class="" style="clear: both">
                                       <p>一些示例文本。一些示例文本。</p>
                                       <p>
                                           <a href="#" class="btn btn-primary" role="button">
                                               按钮
                                           </a>
                                           <a href="#" class="btn btn-default" role="button">
                                               按钮
                                           </a>
                                       </p>
                                   </div>
                               </div>
                           </div>--%>
            </div>
            <nav style="text-align: center;visibility: hidden">
                <ul class="pagination">
                    <li><a href="#">&laquo;</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">&raquo;</a></li>
                </ul>
            </nav>
            <%--   <div class="text-center">
                   <ul class="pager">
                       <li><a href="#" class="previous">上一页</a></li>
                       <li><a href="#" class="next">下一页</a></li>
                   </ul>
               </div>--%>
        </div>
        <%--    <nav style="text-align: center">
                <ul class="pagination"  >
                    <li><a href="#">&laquo;</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">&raquo;</a></li>
                </ul>
            </nav>--%>
        <div class="col-md-3" style="">
            <div class="form-inline " role="form" style="margin: 10px auto;">
                <div class="form-group">
                    <label class="sr-only control-label">
                        搜索
                    </label>
                    <input type="text" class="form-control" placeholder="请输入关键字">
                </div>
            </div>
            <div class="title">
                <p>简介</p>
                <p style="font-size: 14px">记录成为程序员以来的历程,分享自己的认知,
                    如果对你有帮助可以订阅最下方的RSS或者公众号.</p>
            </div>
            <div>
                <p>文章分类</p>
                <div class="list-group">
                    <a class="list-group-item" href="#">造轮子</a>
                    <a href="#" class="list-group-item">读书笔记</a>
                    <a class="list-group-item" href="#">
                        设计模式专题
                        <span class="badge">新</span>
                    </a>
                    <a href="#" class="list-group-item">框架与中间</a>
                    <a href="#" class="list-group-item">实战总结</a>
                    <a href="#" class="list-group-item">WEB开发</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--主体结束  -->
<!--结尾  -->
<div class="footer" style=" margin: 200px auto 0; background-color: black">
    <div class="container">
        <div class="col-md-4">
            <header>关于</header>
            <p>编程是一件幸福的事情,不要让你的工作变得索然无味.</p>
            <ul>
                <li>
                    <span class="glyphicon glyphicon-map-marker"></span>
                    <a href="#"> HangZhou,China</a>
                </li>
                <li>
                    <span class="glyphicon glyphicon-envelope"></span>
                    <a href="#"> niudear@foxmail.com</a>
                </li>
                <li>
                    <span class="glyphicon glyphicon-map-marker"></span>
                    <a href="#">2017 皖ICP备17023807号</a>
                </li>
            </ul>
        </div>
        <div class="col-md-4">
            <div class="col-md-4 col-md-offset-4">
                <header>友情链接</header>
                <ul>
                    <li><a href="http://www.mengxiang.pro/f">梦翔社团</a></li>
                    <li><a href="http://www.nyist.edu.cn/">南阳理工学院</a></li>
                    <li><a href="https://blog.csdn.net/">CSDN博客</a></li>
                    <li><a href="http://www.runoob.com/">菜鸟教程</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-4">
            <div class="col-md-4 col-md-offset-4">
                <header>构建工具</header>
                <ul>
                    <li><a href="http://jquery.com/">Jquery</a></li>
                    <li><a href="http://www.bootcss.com/">Bootstrap</a></li>
                    <li><a href="http://www.w3school.com.cn/ajax/index.asp">Ajax</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--结尾  -->
</body>
</html>

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
    <meta http-equiv="content-type" content="multipart/form-data" charset="UTF-8">
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.validate.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="static/css/toastr.css">
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="static/js/wangEditor.js"></script>
    <script type="text/javascript" src="static/js/toastr.js"></script>
    <style type="text/css">

    </style>
</head>
<body style="">
<div class="container-fluid" style="margin: 20px 20px 20px 200px;padding-left: 0px;">
    <div id="left" style="border: 1px solid #cccccc;width: 220px;float: left">
        <div class="" style="margin: 0px 0px;padding: 0px 0px">
            <div class="list-group">
                <a href="#" class="list-group-item"
                   style="font-size: 20px;border: none;height: 50px;margin: auto;padding-left: 50px">
                    Markdown编辑器</a>
                <a href="#write" class="list-group-item" data-toggle="tab"
                   style="font-size: 20px;border: none;height: 50px;margin: auto;padding-left: 50px">
                    富文本编辑器</a>
                <a href="#" class="list-group-item"
                   style="font-size: 20px;border: none;height: 50px;margin: auto;padding-left: 50px">
                    查看主页</a>
            </div>
        </div>
        <div class="" style="padding: 0px 0px;margin: 0 0;">
            <div class="list-group-item" style="font-size: 18px;border: none">内容</div>
            <div class="list-group" style="margin: 0px 0px;">
                <a href="#article" class="list-group-item" data-toggle="tab"
                   style="font-size: 20px;border: none;height: 50px;margin: auto;padding-left: 50px">
                    文章管理</a>
                <a href="#" class="list-group-item"
                   style="font-size: 20px;border: none;height: 50px;margin: auto;padding-left: 50px">
                    专栏管理</a>
                <a href="#" class="list-group-item"
                   style="font-size: 20px;border: none;height: 50px;margin: auto;padding-left: 50px">
                    评论管理</a>
                <a href="#" class="list-group-item"
                   style="font-size: 20px;border: none;height: 50px;margin: auto;padding-left: 50px">
                    个人分类管理</a>
                <a href="#" class="list-group-item"
                   style="font-size: 20px;border: none;height: 50px;margin: auto;padding-left: 50px">
                    博客搬家</a>
            </div>
        </div>
        <div class="">
            <div class="list-group-item">数据</div>
            <div class="list-group">
                <a href="#" class="list-group-item"
                   style="font-size: 20px;border: none;height: 50px;margin: auto;padding-left: 50px">
                    百度关键词</a>
            </div>
        </div>
        <div class="">
            <div class="list-group-item">设置</div>
            <div class="list-group">
                <a href="#" class="list-group-item"
                   style="font-size: 20px;border: none;height: 50px;margin: auto;padding-left: 50px">
                    博客设置
                </a>
                <a href="#" class="list-group-item"
                   style="font-size: 20px;border: none;height: 50px;margin: auto;padding-left: 50px">
                    自定义域名</a>
                <a href="#" class="list-group-item"
                   style="font-size: 20px;border: none;height: 50px;margin: auto;padding-left: 50px">
                    栏目管理</a>
            </div>
        </div>
    </div>
    <div class="right tab-content" style="float: left;margin-left: 20px;width: 1200px" id="mytabcontent">
        <div class="tab-pane fade in active" id="write">
            <div style="">
                <input type="text" id="title" placeholder="请输入文章标题" style="width: 100%;height: 40px;font-size: 20px">
            </div>
            <div style="padding: 0 0;margin-top: 20px" id="editor">
                <div id="menu" style="border: 1px solid #cccccc;" class="w-e-toolbar">

                </div>
                <div id="input" class="text" style="border: 1px solid #cccccc">

                </div>
            </div>
            <div class="form-horizontal" style="margin-top: 20px" role="form">
                <div class="row">
                    <div class="form-group">
                        <label class="col-lg-2 control-label"
                               style="margin-top: 3px;margin-right: 0;padding: 0px;font-size: 20px;width:100px ">
                            文章标签:
                        </label>
                        <div class="col-lg-6">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="请输入关键字……" id="inputlable">
                                <span class="input-group-addon btn btn-default dropdown-toggle" data-toggle="dropdown"
                                      id="lable">
                                 <i class="caret"></i>
                            </span>
                                <ul class="dropdown-menu pull-right" id="lablelist">
                                    <li id="lableli" style="display: none">
                                        <a href="#" id="lablea"></a>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <div style="" class="form-group">
                        <label class="col-lg-2 control-label"
                               style="margin-top: 3px;margin-right: 0;padding: 0px;font-size: 20px;width:100px ">
                            个人分类:
                        </label>
                        <div class="col-lg-6">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="请输入关键字……" id="inputtype">
                                <span class="input-group-addon btn btn-default dropdown-toggle" data-toggle="dropdown"
                                      id="type">
                                 <i class="caret"></i>
                            </span>
                                <ul class="dropdown-menu pull-right" id="typelist">
                                    <li id="typeli" style="display: none;">
                                        <a href="#" id="typea"></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="btn-group" style="margin:50px 200px 0px">
                        <button id="button" type="button" class="btn btn-default"
                                style="margin: 0 10px;height: 42px;width: 110px;color: red;border: 1px solid red;font-size: 20px">
                            <span>发布博客</span></button>
                        <%--<button type="button" class="btn btn-default" style="margin: 0 10px;height: 42px;width: 130px;color: red;border: 1px solid red;font-size: 20px">保存为草稿</button>--%>
                        <button type="button" class="btn btn-default" onclick="Javascript:history.back()"
                                style="margin: 0 10px;height: 42px;width: 110px;font-size: 20px "><span>返回</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="article">
            <div class="tab">
                <ul class="nav nav-tabs">
                    <li class="tab-li" style="outline: none"><a href="#"><span>全部</span></a></li>
                    <li class="tab-li"><a href="#" style="outline: none">公开</a></li>
                    <li class="tab-li"><a href="#" style="outline: none">私密</a></li>
                    <li class="tab-li"><a href="#" style="outline: none">草稿箱</a></li>
                    <li class="tab-li"><a href="#" style="outline: none">回收站</a></li>
                </ul>
            </div>
            <div>
                <div>
                    <div style="margin: 20px 0px">
                        <a href="#" style="text-decoration: none;font-size: 20px;font-weight: bold">spring对象set注入</a>
                    </div>
                    <div>
                        <div style="float: left;width: 80%">
                            <span style="margin: 5px">原创</span>
                            <span style="margin: 5px">2018年11月19日 11:43:56</span>
                        </div>
                        <div class="" style="float: left">
                            <a href="#" style="text-decoration: none;padding: 0px 5px">
                                <span>查看</span>
                            </a>
                            <a href="#" style="text-decoration: none;border-left: 1px solid #c0c0c0;padding: 0px 5px">
                                <span>禁止评论</span>
                            </a>
                            <a href="#" style="text-decoration: none;border-left: 1px solid #c0c0c0;padding: 0px 5px">
                                <span>置顶</span>
                            </a>
                            <a href="#" style="text-decoration: none;border-left: 1px solid #c0c0c0;padding: 0px 5px">
                                <span>删除</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<style type="text/css">
    .text {
        height: 700px !important;
    }
</style>
<script type="text/javascript" src="js/writeblog.js"></script>
<script type="text/javascript" src="static/js/wangEditor-fullscreen-plugin.js"></script>
<link rel="stylesheet" type="text/css" href="static/css/wangEditor-fullscreen-plugin.css">
<script type="text/javascript">
    $(document).ready(function () {
        $("#success").click(function () {

        });
        toastr.options = {
            "closeButton": false,//是否显示关闭按钮
            "debug": false,//是否使用都debug模式
            "positionClass": "toast-top-center",//弹出框位置
            "showDuration": "500",//显示的动画时长
            "hideDuration": "500",//消失的动画时长
            "timeOut": "500",//展示时长
            "extendedTimeOut": "100",//加长展示时长
            "showMethod": "fadeIn",//显示时的动画方式
            "hideMethod": "fadeOut",//消失时的动画方式
        };
        $(".tab .tab-li").click(function () {
            //$(this).removeClass("active");
        });
        $("#button").click(function () {
            //alert($("#sign").val());
            //alert(editor.txt.html());
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "insert",
                data: {
                    sign: $("#title").val(),
                    content: editor.txt.html(),
                    lable: $("#inputlable").val(),
                    type: $("#inputtype").val()
                },
                success: function (data) {
                    if (data == true) {
                        $("#test").attr("display", 'inline-block');
                        toastr.success("发布成功");
                        /*上传成功后清除内容*/
                        close();

                    } else {
                        toastr.fail("发布失败");
                    }
                }
            });
        });

        function close() {
            editor.txt.clear();
            //$("#input").html('');
            $("#title").val("");
            $("#inputlable").val("");
            $("#inputtype").val("");
        }

        $("#lable").click(function () {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "queryalllable",
                success: function (data) {
                    closelable();
                    clonelable(data);
                    showlable(data);
                }
            });
        });
        $("#type").click(function () {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "type",
                success: function (data) {
                    closetype();
                    clonetype(data);
                    showtype(data);
                }
            });
        });
        $("#typelist").on('click', '#typea', function () {
            $("#inputtype").val($(this).text());
        });
        $("#lablelist").on('click', '#lablea', function () {
            $("#inputlable").val($(this).text());
        });

        var E = window.wangEditor;
        var editor = new E("#menu", "#input");
        //editor.customConfig.uploadImgShowBase64=true;
        //设置上传文件的服务器路径
        editor.customConfig.uploadImgServer = "upload";
        //设置文件上传的参数名称
        editor.customConfig.uploadFileName = 'file';
        //将图片大小限制为3M
        editor.customConfig.uploadImgMaxSize = 5 * 1024 * 1024;
        editor.customConfig.uploadImgMaxLength = 5;
        editor.customConfig.pasteFilterStyle = false;
        editor.customConfig.pasteIgnoreImg = true;
        editor.customConfig.showLinkImg = false;
        editor.customConfig.uploadImgHooks = {
            before: function (xhr, editor, files) {
                //alert("before")
            },
            success: function (xhr, editor, result) {
                alert("上传成功")
            },
            fail: function (editor, result) {
                alert("上传失败,原因是:" + result);
            },
            error: function (xhr, editor) {
                alert("上传出错");
            },
            timeout: function (xhr, editor) {
                alert("上传超时");
            },
            customInsert: function (insert, result, editor) {
                var url = result.url;
                alert(result.url);
                insert(result.url);
            }

        };
        editor.create();
        E.fullscreen.init("#editor");
        /*页面一刷新就自动全屏*/
        // E.fullscreen.toggleFullscreen("#editor");
    });
</script>
</body>
</html>
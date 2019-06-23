<%--
  Created by IntelliJ IDEA.
  User: ABC
  Date: 2019/4/2
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人资料</title>
    <meta charset="UTF-8">
    <meta http-equiv="content-type" content="multipart/form-data" charset="UTF-8">
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.validate.js"></script>
    <script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script type="text/javascript" src="static/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="static/js/bootstrap-datetimepicker.fr.js"></script>
    <script type="text/javascript" src="static/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <link rel="stylesheet" type="text/css" href="static/css/bootstrap-datetimepicker.css">
    <script type="text/javascript" src="js/personal.js"></script>
    <link rel="stylesheet" type="text/css" href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <style type="text/css">
        a:hover {
            color: #B00000;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            var name = $("#name").text();
            showimage();
            showinformation();
            $("#date").datetimepicker({
                language: 'zh-CN',
                weekStart: 1,
                todayBtn: true,
                autoclose: true,
                todayHighlight: true,
                startView: 2,
                minView: 2,
                forceParse: 0
            });
            $("#submit").click(function () {
                var name = $("#Myname").val();
                var sex = $("#mysex").val();
                var birthday = $("#date-birthday").val();
                var address = $("#myaddress").val();
                $.ajax({
                    type: "POST",
                    url: "setinformation",
                    dataType: "json",
                    data: {
                        name: name,
                        sex: sex,
                        birthday: birthday,
                        address: address
                    },
                    success: function (data) {
                        if (data == true) {
                            showinformation();
                        }
                    },
                    error: function (data) {

                    }
                });
            });
            $("#modal").on('show.bs.modal', function () {
                $("#Myname").attr("value", $("#name").text());
            })
            $("#file").change(function () {
                if ($(this).val() != "") {
                    upload();
                }
            });
            $("#date-birthday").change(function () {
                if ($(this).val() != "") {
                    $("#date-birthday-remove").css("display", "inline-block");
                }
            });
            $("#upload").bind("click", function () {
                $("#file").trigger("click");
            });

        });

    </script>
</head>
<body style="">
<div class="container-fluid"
     style="margin: 20px 20px 20px 0px;padding-left: 0px;background-color: 	#F8F8F8;padding-top: 15px">
    <div id="left" class="" style="float: left;width: 200px;margin-left: 360px;">
        <div class="" style="margin: 0px 0px;padding: 0px 0px;width: 100%;border-bottom:1px dashed">
            <div class="list-group" style="padding-bottom: 0px;margin-bottom: 0px;width: 100%" id="alist">
                <a href="#home" class="list-group-item personal"
                   style="font-size: 14px;border: none;height: 35px;margin: auto;" data-toggle="tab" id="test1">
                    个人资料</a>
                <a href="#ios" class="list-group-item personal"
                   style="font-size: 14px;border: none;height: 35px;margin: auto;" data-toggle="tab" id="test2">
                    我的收藏</a>
                <a href="#jmeter" disabled="true" class="list-group-item"
                   style="font-size: 14px;border: none;height: 35px;margin: auto;"
                   data-toggle="tab tooltip" title="该功能暂未开放,来打我啊">
                    我的关注</a>
                <a href="#ejb" disabled="true" class="list-group-item"
                   style="font-size: 14px;border: none;height: 35px;margin: auto;" data-toggle="tab tooltip"
                   title="该功能暂未开放,来打我啊">
                    我的粉丝</a>
            </div>
        </div>
        <div class="" style="margin: 0px 0px;padding: 0px 0px;width: 100%">
            <div class="list-group" style="padding-bottom: 0px;margin-bottom: 0px;width: 100%">
                <a href="#" class="list-group-item" style="font-size: 14px;border: none;height: 35px;margin: auto;"
                   data-toggle="tooltip" title="该功能暂未开放,来打我啊">
                    我的博客</a>
                <a href="#ios" class="list-group-item" style="font-size: 14px;border: none;height: 35px;margin: auto;"
                   data-toggle="tooltip" title="该功能暂未开放,来打我啊">
                    我的下载</a>
                <a href="#" class="list-group-item" style="font-size: 14px;border: none;height: 35px;margin: auto;"
                   data-toggle="tooltip" title="该功能暂未开放,来打我啊">
                    我的论坛</a>
                <a href="#" class="list-group-item" style="font-size: 14px;border: none;height: 35px;margin: auto;"
                   data-toggle="tooltip" title="该功能暂未开放,来打我啊">
                    我的学院</a>
            </div>
        </div>
    </div>
    <div id="right" class="tab-content" style="float: left;width: 1000px;margin-left: 0px;">
        <div class="tab-pane fade in active" id="home" style="margin: 0px;padding: 0px;">
            <%--个人资料--%>
            <div class="" style="height: 88px;margin:0px 40px;border-bottom:1px dashed">
                <h4 style="margin: 0px;line-height: 88px;font-size: 20px;font-weight: bold">个人资料</h4>
            </div>
            <div style="margin:5px 20px 0px 900px;width: 100%">
                <a style="font-weight: bold;text-decoration: none;font-size: 15px;outline: none" href="#"
                   data-toggle="modal" data-target="#modal">
                    <span>修改资料</span></a>
            </div>
            <div class="" style="float: left">
                <%--修改资料--%>

                <%--头像--%>
                <div class="" style="width: 140px;float: left">
                    <div style="margin-left: 30px">
                        <img id="photo" src="image/tou.jpg" style="border-radius: 50px" width="100px" height="100px">
                    </div>
                    <form style="margin-top: 10px" enctype="multipart/form-data" id="uploadform" method="post"
                          action="ajaxupload">
                        <input type="file" id="file" name="file" style="display: none">
                    </form>
                    <button class="btn-default btn" type="button" id="upload"
                            style="text-decoration: none;font-size: 15px;margin-left: 40px;outline: none">
                        <span>修改头像</span></button>
                </div>
                <div style="float: right;margin-left: 10px;width: 500px">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="control-label col-md-2">昵称:</label>
                            <div class="col-md-6">
                                <p class="form-control-static" id="name">陈祥瑞</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">性别:</label>
                            <div class="col-md-6">
                                <p class="form-control-static" id="sex"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">生日:</label>
                            <div class="col-md-6">
                                <p class="form-control-static" id="birthday"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">地区:</label>
                            <div class="col-md-6">
                                <p class="form-control-static" id="address"></p>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <div class="tab-pane fade " id="ios" style="margin: 0px;padding: 0px;">
            <div style="margin:0px 20px;height: 90px;">
                <div style="float: left;font-size: 20px;font-weight: bold;line-height: 90px">
                    我的收藏
                </div>
                <div style="font-size: 20px;margin-right: 10px;float:right;;line-height: 90px">
                    共7条
                </div>
            </div>
            <div style="margin: 0px 20px;">
                <div style="height: 50px;font-size: 20px;border-top: 1px dotted">
                    <div style="float: left;">
                        <a href="#" style="text-decoration: none;line-height: 50px;">富文本编辑器的使用</a>
                    </div>
                    <div style="float: right;">
                        <span style="margin-right: 20px;line-height: 50px;color: #D0D0D0">2019-04-04</span>
                        <a href="#" style="text-decoration: none;line-height: 50px">取消</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--修改资料模态框--%>
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-hidden="true" aria-labelledby="modallable"
     data-backdrop="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="modallable">修改资料</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" method="post" id="Myform">
                    <div class="form-group">
                        <label class="control-label col-lg-2">昵称:</label>
                        <div class="col-lg-6">
                            <div class="input-group">
                                   <span class="input-group-addon">
                                       <i class="glyphicon glyphicon-user"></i>
                                   </span>
                                <input type="text" class="form-control" value="" placeholder="昵称" id="Myname"
                                       name="username">
                            </div>
                        </div>
                        <label class="control-label" for="Myname"></label>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-2">性别:</label>
                        <div class="col-lg-6">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="glyphicon glyphicon-heart"></i>
                                </span>
                                <select class="form-control" id="mysex">
                                    <option class="form-control-static disabled">请选择</option>
                                    <option>男</option>
                                    <option>女</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-2" for="dtp_input">生日:</label>
                        <div class="col-lg-6" style="float: left;">
                            <div class="input-group date form-date col-lg-10" style="float: left" data-date=""
                                 data-date-format="dd MM yyyy" id="date" data-link-field="dtp_input"
                                 data-link-format="yyyy-mm-dd">
                                <input type="text" class="form-control" id="date-birthday" size="16" readonly value="">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>

                            </div>
                        </div>
                        <input type="hidden" id="dtp_input">

                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-2">性别:</label>
                        <div class="col-lg-6">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="glyphicon glyphicon-heart"></i>
                                </span>
                                <select class="form-control" id="myaddress">
                                    <option class="form-control-static disabled">请选择</option>
                                    <option>北京市</option>
                                    <option>天津市</option>
                                    <option>上海市</option>
                                    <option>重庆市</option>
                                    <option>河北省</option>
                                    <option>山西省</option
                                    <option>黑龙江省</option>
                                    <option>江苏省</option>
                                    <option>浙江省</option>
                                    <option>安徽省</option>
                                    <option>福建省</option>
                                    <option>江西省</option>
                                    <option>山东省</option>
                                    <option>河南省</option>
                                    <option>湖南省</option>
                                    <option>广东省</option>
                                    <option>海南省</option>
                                    <option>四川省</option>
                                    <option>贵州省</option>
                                    option>云南省</option>
                                    <option>陕西省</option>
                                    <option>甘肃省</option>
                                    <option>青海省</option>
                                    <option>台湾省</option>
                                    <option>内蒙古自治区</option>
                                    <option>广西壮族自治区</option>
                                    <option>西藏自治区</option>
                                    <option>宁夏回族自治区</option>
                                    <option>新疆维吾尔自治区</option>
                                    <option>香港特别行政区</option>
                                    <option>澳门特别行政区</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-default btn" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="submit">提交更改</button>
            </div>
        </div>
    </div>
</div>
<%--修改资料模态框--%>
</body>
</html>
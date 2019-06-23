/*翻页图标检索*/
function search(data) {
    $(".preone").removeClass("disabled");
    $(".nexone").removeClass("disabled");
    if (data.pagenum == 1 && data.totalpage == data.pagenum) {
        $(".preone").addClass("disabled");
        $(".nexone").addClass("disabled");
    } else if (data.pagenum == 1) {
        $(".preone").addClass("disabled");
    } else if (data.pagenum == data.totalpage) {
        $(".nexone").addClass("disabled");
    }
}

function searchtwo(data) {
    $(".pretwo").removeClass("disabled");
    $(".nextwo").removeClass("disabled");
    if (data.pagenum == 1 && data.totalpage == data.pagenum) {
        $(".pretwo").addClass("disabled");
        $(".nextwo").addClass("disabled");
    } else if (data.pagenum == 1) {
        $(".pretwo").addClass("disabled");
    } else if (data.pagenum == data.totalpage) {
        $(".nextwo").addClass("disabled");
    }
}

function searchthree(data) {
    $(".prethree").removeClass("disabled");
    $(".nexthree").removeClass("disabled");
    if (data.pagenum == 1 && data.totalpage == data.pagenum) {
        $(".prethree").addClass("disabled");
        $(".nexthree").addClass("disabled");
    } else if (data.pagenum == 1) {
        $(".prethree").addClass("disabled");
    } else if (data.pagenum == data.totalpage) {
        $(".nexthree").addClass("disabled");
    }
}

/*翻页图标检索*/

/*初始化博客标签*/
function showlable() {
    var size = 0;
    $.ajax({
        type: "POST",
        url: "queryalllable",
        dataType: "json",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                size++;
            }
            clonelable(size);
            lable(data);
        }
    });
}

function clonelable(size) {
    for (var i = 0; i < size; i++) {
        var lable = $("#blog_lable").clone().css("display", "inline-block").addClass("clonelable");
        $("#lablelist").append(lable);
    }
}

function lable(data) {
    for (var i = 0; i < data.length; i++) {
        var sign = data[i];
        $(".blog_lable_a").eq(i + 1).text(sign);
    }
}

/*初始化博客标签*/

/*搜索查询特定博客*/

function find(event) {
    //alert("你的输入值是:"+$("#input").val());
    $.ajax({
        type: "POST",
        url: "find",
        dataType: "json",
        data: {
            'event': event,
            'startindex': 1

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

/*搜索查询特定博客*/

/*初始化博客*/
function thumbnail(pn) {
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "find",
        data: {
            startindex: pn,
            event: $("#input").val()
        },
        success: function (data) {
            index = data.totalpage;
            /*显示缩略图*/
            showfirst(data);
            /*图片*/
            image(data);
            /*显示查询到的数据*/
            show(data);
            //检测
            search(data);
        }
    })
}

function showfirst(data) {
    for (var i = 0; i < data.list.length; i++) {
        var pan = $("#li").clone().css("display", "inline").addClass("clone");
        $("#ul").append(pan);
    }
}

function image(data) {
    for (var i = 1; i <= data.list.length; i++) {
        $("#ul img").eq(i).attr("src", "image/cat.jpg");
    }
}

function show(data) {
    for (var i = 1; i <= data.list.length; i++) {
        var intro = data.list[i - 1].blog_intro;
        var sign = data.list[i - 1].blog_sign;
        var lable = data.list[i - 1].blog_lable;
        var people = data.list[i - 1].blog_people;
        $("#ul .blog_intro").eq(i).text(intro);
        $("#ul .blog_sign").eq(i).text(sign);
        $("#ul .blog_type").eq(i).text(lable);
        $("#ul .blog_people").eq(i).text(people);
    }
}

/*初始化博客*/

/*初始化博客所属类别*/
function showtype() {
    $.ajax({
        type: "POST",
        url: "querytypeall",
        dataType: "json",
        success: function (data) {
            for (var key in data) {
                size++;
            }
            clonetype(size);
            type(data);
        }
    });
}

function clonetype(size) {
    for (var i = 0; i < size; i++) {
        // alert("true");
        var pan = $("#type").clone().css("display", "block").addClass("clonetype");
        $("#typelist").append(pan);
    }
}

function type(data) {
    var i = 1;
    for (var key in data) {
        $("#typelist .blog_type_a").eq(i).text(key);
        $("#typelist .blog_type_span").eq(i).text(data[key]);
        i++;
    }
}

/*初始化博客所属类别*/

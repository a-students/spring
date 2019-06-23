function closelable() {
    $("li").remove(".clonelable");
}

function closetype() {
    $("li").remove(".clonetype");

}

function clonelable(data) {
    for (var i = 0; i < data.length; i++) {
        var lable = $("#lableli").clone().css("display", "block").addClass("clonelable");
        $("#lablelist").append(lable);
    }
}

function clonetype(data) {
    for (var i = 0; i < data.length; i++) {
        var type = $("#typeli").clone().css("display", "block").addClass("clonetype");
        $("#typelist").append(type);
    }
}

function showlable(data) {
    for (var i = 0; i < data.length; i++) {
        var lable = data[i];
        $("#lablelist #lablea").eq(i + 1).text(lable);
    }
}

function showtype(data) {
    for (var i = 0; i < data.length; i++) {
        var type = data[i];
        $("#typelist #typea").eq(i + 1).text(type);
    }
}
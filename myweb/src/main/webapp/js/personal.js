function showimage() {
    $.ajax({
        type: "POST",
        url: "showimage",
        dataType: "json",
        success: function (data) {
            $("#photo").attr("src", data.url);
        }
    });
}

function upload() {
    var formdata = new FormData($("#uploadform")[0]);
    $.ajax({
        type: "POST",
        url: "ajaxupload",
        data: formdata,
        dataType: "json",
        cache: false,
        processData: false,
        contentType: false,
        success: function (data) {
            $("#photo").attr("src", data.url);
        },
        error: function (data) {
            alert("error");
        }
    });
}

function showinformation() {
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "showinformation",
        success: function (data) {
            $("#name").text(data.name);
            $("#sex").text(data.sex);
            $("#birthday").text(data.birthday);
            $("#address").text(data.address);
        }
    });
}


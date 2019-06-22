<%--
  Created by IntelliJ IDEA.
  User: ABC
  Date: 2019/5/21
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
</head>
<body>
<%--自定义类型转换器--%>
    <form action="filter">
        姓名:<input type="text" name="username"><br>
        年龄:<input type="text" name="age"><br>
        生日:<input type="text" name="date"><br>
        <input type="submit" value="提交">
    </form>
    <a href="hello">hello</a>
    <h4>跨服务器文件上传</h4>
    <form method="post" enctype="multipart/form-data" action="upload">
        选择文件:<input type="file" name="upload"><br>
        <input type="submit" value="提交">
    </form>
</body>
</html>

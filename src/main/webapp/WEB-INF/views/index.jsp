<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-08
  Time: 오전 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <%--jquery--%>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>

    <%--스타일--%>
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
</head>
<body>

<div class="row">
    <div class="col">
        <jsp:include page="component/header.jsp"/>
        <jsp:include page="${pageName}"/>
        <hr>
        <jsp:include page="component/footer.jsp"/>
    </div>
</div>

</body>
</html>

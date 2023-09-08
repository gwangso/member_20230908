<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-08
  Time: 오전 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row px-5 py-3">
    <div class="col">
        <div id="copy-right">

        </div>
    </div>
</div>
<script>
    const copyRight = document.getElementById("copy-right");
    const date = new Date();
    const year = date.getFullYear();
    copyRight.innerHTML = `<h6>copyright ${year} kyeong su All rights reserved</h6>`


</script>


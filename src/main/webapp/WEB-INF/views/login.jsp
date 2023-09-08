<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-08
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row justify-content-center">
    <div class="col col-sm-10 col-lg-8 col-xl-7">
        <h2 class="text-center my-5">
            <b>Login</b>
        </h2>
        <div class="div_login card mx-5 p-5">
            <form method="post">
                <div class="row">
                    <div class="col-8 col-xl-10">
                        <div class="input-group mb-3">
                            <span class="input-group-text">이메일</span>
                            <input class="form-control" type="text" name="memberEmail" placeholder="Email">
                        </div>
                        <div class="input-group ">
                            <span class="input-group-text">비밀번호</span>
                            <input class="form-control" type="password" name="memberPassword"
                                   placeholder="Password">
                        </div>
                    </div>
                    <div class="col-4 col-xl-2 text-center">
                        <button class="btn btn-outline-dark btn-lg">로그인</button>
                    </div>
                </div>
            </form>
            <span>
                <a href="/save">회원가입</a>
            </span>
        </div>
    </div>
</div>

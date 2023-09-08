<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-09-08
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row m-5">
    <div class="col">
        <div class="div-save card m-5 p-5">
            <form name="frm" method="post">
                <div class="input-group mb-3">
                    <span class="input-group-text">이메일</span>
                    <input class="form-control" type="text" name="memberEmail">
                    <input type="button" id="duplicate-check" class="btn btn-warning btn-sm" value="중복체크"/>
                </div>
                <div class="ms-5">※ 대문자,소문자,숫자,특수문자를 사용해 8자리 이상으로 설정해주세요</div>
                <div class="input-group mb-3">
                    <span class="input-group-text">비밀번호</span>
                    <div class="form-floating">
                        <input id="floatingInput" class="form-control" type="password" name="memberPassword" onkeyup="passwordCheck_fn(this.value)">
                        <label id="passwordCheck" for="floatingInput" style="color:gray">비밀번호를 입력해주세요</label>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text">이름</span>
                    <input class="form-control" type="text" name="memberName">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text">생년월일</span>
                    <input class="form-control" type="text" name="memberBirth">
                </div>
                <div class="input-group mb-5">
                    <span class="input-group-text">전화번호</span>
                    <input class="form-control" type="text" name="memberMobile">
                </div>
                <div class="text-end">
                    <input class="btn btn-primary" name="saveinfo" type="button" value="저장">
                    <input class="btn btn-secondary" type="reset" value="리셋">
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    let emailCheck = 0;
    let passwordCheck = false;

    $("#duplicate-check").on("click", function(){
        const email = $(frm.memberEmail).val();
        if (email==""){
            alert("이메일을 입력해주세요");
        }else {
            $.ajax({
                type:"post",
                url:"/duplicate-check",
                data:{memberEmail : email},
                success:function(data){
                    emailCheck=data;
                    alert("사용할 수 있는 이메일입니다.");
                },
                error:function(err){
                    emailCheck=err;
                    alert("사용할 수 없는 이메일입니다.");
                }
            });
        }
    });

    $("#duplicate-check").keyup(function(){
        emailCheck=0;
    })

    $(frm.memberPassword).keyup(function(){
        const password = $(frm.memberPassword).val();
        const regulation =  /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})/
        console.log(password)
        console.log(regulation.test(password))
        if (password==""){
            $("#passwordCheck").text("비밀번호를 입력해주세요");
            $("#passwordCheck").css('color', 'gray');
            passwordCheck=false;
        } else if(regulation.test(password)){
            $("#passwordCheck").text("사용가능한 비밀번호입니다.");
            $("#passwordCheck").css('color', 'green');
            passwordCheck=true;
        }else {
            $("#passwordCheck").text("사용불가능한 비밀번호입니다.");
            $("#passwordCheck").css('color', 'red');
            passwordCheck=false;
        }
    })

    $(frm.saveinfo).on("click", function(){
        const email = $(frm.memberEmail).val();
        const password = $(frm.memberPassword).val();
        const name = $(frm.memberName).val();
        const birth = $(frm.memberBirth).val();
        const mobile = $(frm.memberMobile).val();

        if (email==""){
            alert("이메일을 입력해주세요.")
            $(frm.memberEmail).focus();
        }else if (emailCheck==0){
            alert("이메일 중복체크를 해주세요.")
        }else if (password==""){
            alert("비밀번호를 입력해주세요.")
            $(frm.memberPassword).focus();
        }else if (passwordCheck==false){
            alert("비밀번호 형식을 체크해주세요.")
        }else if (name==""){
            alert("이름를 입력해주세요.")
            $(frm.memberName).focus();
        }else if (birth==""){
            alert("생일를 입력해주세요.")
            $(frm.memberBirth).focus();
        }else if (mobile==""){
            alert("전화번호를 입력해주세요.")
            $(frm.memberMobile).focus();
        }else {
            frm.submit();
        }
    })
</script>
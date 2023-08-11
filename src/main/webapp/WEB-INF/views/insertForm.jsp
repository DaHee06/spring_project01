<%--
  Created by IntelliJ IDEA.
  User: KimCome
  Date: 2023-07-08
  Time: 오후 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    <title>게시판 등록</title>
    <style>
        .error-message {
            color: red;
        }
    </style>
    <script src="../resources/js/jquery 3.7.0.js"></script>
    <script>
        $(document).ready(function () {
            var maxAttachments = 5; // 최대 첨부파일 개수
            var attachmentCount = 1; // 현재 첨부파일 개수

            $(".add").click(function() {
                if (attachmentCount < maxAttachments) {
                    var newInput = $('<input class="form-control2" type="file" id="formFile">');
                    var deleteButton = $('<input type="button" class="delete" value="삭제">');

                    var newRow = $('<div class="mb-3 row"></div>').append(newInput).append(deleteButton);
                    $(this).parent().append(newRow);
                    attachmentCount++;

                    // 추가한 삭제 버튼에 이벤트 리스너 추가
                    deleteButton.click(function() {
                        newRow.remove();
                        attachmentCount--;
                    });
                } else {
                    alert("최대 첨부파일 개수에 도달했습니다.");
                }
            });

            $("#insertForm").submit(function (e) {

                e.preventDefault();

                // select 박스 유효성 검사
                var selectedOption = $("#category").val();
                if (selectedOption === "") {
                    alert("옵션을 선택하세요.");
                    return;
                }

                // 작성자 아이디 유효성 검사
                var writerId = $("#writer").val().trim();
                if (writerId === "") {
                    alert("작성자 아이디를 입력하세요.");
                    return;
                }

                if (!/^[a-zA-Z0-9]{2,6}$/.test(writerId)) {
                    alert("작성자 이름은 영문과 숫자를 포함하여 2자리 이상 6자리 이하여야 합니다.");
                    return;
                }

                // 비빌번호 유효성 검사
                var pwd = $("#pwd").val();
                var pwd2 = $("#pwd2").val();
                if (pwd === "") {
                    alert("비밀번호를 입력하세요.");
                    return;
                }

                if (pwd.length < 6 || pwd.length > 12 || !/^[a-zA-Z0-9]+$/.test(pwd)) {
                    alert("비밀번호는 영문과 숫자만 포함하여 6자리 이상 12자리 이하어야 합니다.");
                    return;
                }

                if (pwd !== pwd2) {
                    $("#alert").text("비밀번호가 일치하지 않습니다.").addClass("error-message");
                    return;
                } else {
                    $("#alert").empty().removeClass("error-message");
                }
                //아래 css로 빨간글씨 주기

                // 제목 유효성 검사
                var title = $("#title").val();

                if (title === "") {
                    alert("제목을 입력하세요.");
                    return;
                }

                if (title.length > 25 || !/^[a-zA-Z0-9ㄱ-ㅎ가-힣!@#$%^&*()_+]+$/.test(title)) {
                    alert("제목은 영문, 한글, 숫자, 특수문자를 포함하여 최대 25자까지 가능합니다.");
                    return;
                }

                // 내용 유효성 검사
                var content = $("#content").val();

                if (content === "") {
                    alert("내용을 입력하세요.");
                    return;
                }

                if (content.length > 500 || !/^[a-zA-Z0-9ㄱ-ㅎ가-힣!@#$%^&*()_+]+$/.test(content)) {
                    alert("내용은 영문, 한글, 숫자, 특수문자를 포함하여 최대 500자까지 가능합니다.");
                    return;
                }


                alert("폼이 성공적으로 제출되었습니다.");
                this.submit();

                // 폼 제출 후 지정된 페이지로 이동
                window.location.href = "새로운_페이지의_URL";
            });
        });
    </script>
</head>
<body>
    <nav class="navbar navbar-expand navbar-dark bg-dark">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="./home">Home</a>
            </div>
        </div>
    </nav>

    <div class ="jumbotron">
        <dlv class="container">
<%--            <h3 class="display-3">게시판 등록</h3>--%>
        </dlv>
    </div>
f
    <div class="container">
        <form id="insertForm" >
            <div class="mb-3 row">
                <label for="category" class="col-sm-2 col-form-label">카테고리</label>
                <div class="col-sm-10">
                    <select id ="category">
                        <option value="">선택해주세요.</option>
                        <c:forEach var="list" items="${resultList}">
                            <option value="${list.c_name}"a>${list.c_name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="writer" class="col-sm-2 col-form-label">작성자</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="writer">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="pwd" class="col-sm-2 col-form-label">비밀번호</label>
                <div class="col">
                    <input type="password" class="form-control" id="pwd">
                </div>
                <label for="pwd2" class="col-sm-2 col-form-label">비밀번호 확인</label>
                <div class="col">
                    <input type="password" class="form-control" id="pwd2"></br>
                    <span id="alert" class="error-message"></span>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="title" class="col-sm-2 col-form-label">제목</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="title">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="content" class="col-sm-2 col-form-label">내용</label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="content" rows="3"></textarea>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="formFile" class="col-sm-2 col-form-label">첨부파일</label>
                <div class="col-sm-10">
                    <input class="form-control2" type="file" id="formFile">
                    <input type="button" class="add" value="추가">
                </div>
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button class="btn btn-primary me-md-2" type="button">목록</button>
                <button class="btn btn-primary" type="submit">등록</button>
            </div>
        </form>
    </div>
</body>
</html>

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
    <script src="../resources/js/jquery 3.7.0.js"></script>
    <script>
        $(document).ready(function () {
            $("#btn").click(function (e) {

                // select 박스 유효성 검사
                var selectedOption = $("#category").val();
                if (selectedOption === "") {
                    alert("옵션을 선택하세요.");
                    e.preventDefault();
                    return;
                }

                // 작성자 아이디 유효성 검사
                var writerId = $("#writer").val().trim();
                if (writerId === "") {
                    alert("작성자 아이디를 입력하세요.");
                    e.preventDefault();
                    return;
                }


                // 모든 유효성 검사 통과 시 폼 제출
                //  $("#insertForm").submit();
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
            <h3 class="display-3">게시판 등록</h3>
        </dlv>
    </div>

    <div class="container">
        <form id="insertForm">
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
                <label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
                <div class="col">
                    <input type="password" class="form-control" id="inputPassword">
                </div>
                <label for="inputPassword2" class="col-sm-2 col-form-label">비밀번호 확인</label>
                <div class="col">
                    <input type="password" class="form-control" id="inputPassword2">
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
                    <input class="form-control" type="file" id="formFile">
                </div>
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button class="btn btn-primary me-md-2" type="button">목록</button>
                <button class="btn btn-primary" id="btn" type="button" value="등록"/>
            </div>
        </form>
    </div>
</body>
</html>

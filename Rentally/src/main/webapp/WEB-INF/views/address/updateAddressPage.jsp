<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 페이지</title>
</head>
<body>
<div id="editModal" style="display: none;">

    <h3>주소 수정</h3>
    <form id="editForm">
        <input type="hidden" id="editAddrSeq" name="addrSeq">
        <label>우편번호: <input type="text" id="editPostcode" name="postcode"></label><br>
        <label>주소: <input type="text" id="editAddress" name="address"></label><br>
        <label>상세주소: <input type="text" id="editDetailAddress" name="detailAddress"></label><br>
        <label>받는이: <input type="text" id="editRecipName" name="recipName"></label><br>
        <label>연락처: <input type="text" id="editRecipPhone" name="recipPhone"></label><br>
        <label>기본 주소로 설정: <input type="checkbox" id="editAddrDefault" name="addrDefault"></label><br>
        <button type="button" onclick="submitEdit()">수정 완료</button>
        <button type="button" onclick="closeModal()">닫기</button>
    </form>
</div>
</body>
</html>
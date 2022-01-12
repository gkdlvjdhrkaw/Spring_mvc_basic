<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

</body>

        <h1>
        아이디는 ${usinfo.id} 이고 <br>
        비밀번호는 ${usinfo.pw} 입니다. <br>
        이름은 ${usinfo.userName} 이고 ~~~ <br>
        취미는 ${usinfo.hobby} 등등.. <br>

        <c:if test="${usinfo.mail == true}">
        메일은 수신 가능해요. <br>
        </c:if>

         <c:if test="${usinfo.mail == false}">
         메일은 수신 불가능해요. <br>
         </c:if>
        </h1>

</html>
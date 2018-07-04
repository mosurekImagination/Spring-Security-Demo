<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
    <title>Login Page </title>
</head>
<body>
    <form:form action="${pageContext.request.contextPath}/authenticate"
        method="post">

        <c:if test="${param.error != null}">
            <i> Sorry! You entered invalid username/password.</i>
        </c:if>
        <p>
            User name <input type="text" name="username"/>
        </p>
        <p>
            Password <input type="text" name="password"/>
        </p>
        <input type="submit" value="Login"/>
    </form:form>
</body>
</html>

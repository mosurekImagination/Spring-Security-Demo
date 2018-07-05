<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Register new User</title>

    <!-- Reference Bootstrap files -->

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

    <script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<h1>Register</h1>
<hr>
<div style="margin-left: 30%; text-align: center">

    <div id="loginbox" style="margin-top: 50px;"
         class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">

        <div class="panel panel-info">

            <div class="panel-heading">
                <div class="panel-title">Register new Employee</div>
            </div>

            <div style="padding-top: 30px" class="panel-body">

                <form:form action="${pageContext.request.contextPath}/register/processForm"
                        modelAttribute="User"
                           method="post"
                        class="form-horizontal">

                    <c:if test="${registrationError != null}">
                        <div class="alert alert-danger" col-xs-offset-1 col-xs-10">
                            ${registrationError}
                        </div>
                    </c:if>

                    <form:input path="userName" placeholder="username" class="form-control" />

                    <form:input path="password" type="password" placeholder="password" class="form-control" />

                    <button type="submit" style="margin-top:20px;" class = "btn btn-primary"> Register</button>
                </form:form>
        </div>
    </div>
</div>

</body>
</html>

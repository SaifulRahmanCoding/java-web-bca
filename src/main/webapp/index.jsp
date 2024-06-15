<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <div style="max-width: 350px" class="m-auto">
        <h2 class="text-center">Login</h2>
        <%
            if (request.getAttribute("error") != null) { %>
        <small class="form-text text-danger"><%=request.getAttribute("error")%>
        </small>
        <%}%>
        <form id="formLogin" action="login" method="post">
            <div class="mb-3">
                <label for="userID" class="form-label">User ID</label>
                <input type="text" name="userID" class="form-control" id="userID">
                <small id="userIDError" class="form-text text-danger"></small>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="password">
                <small id="passwordError" class="form-text text-danger"></small>
            </div>
            <div class="mb-3">
                <button type="submit" class="btn btn-primary w-100">Login</button>
            </div>
        </form>
    </div>

</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        $("#formLogin").submit(function (event) {
            let isValid = true;
            let username = $("#userID").val().trim();
            let password = $("#password").val().trim();

            if (username === "") {
                $("#userIDError").text("UserID is required");
                isValid = false;
            } else {
                $("#userIDError").text("");
            }

            if (password === "") {
                $("#passwordError").text("Password is required");
                isValid = false;
            } else {
                $("#passwordError").text("");
            }

            if (!isValid) {
                event.preventDefault();
            }
        });
    });
</script>
</body>
</html>
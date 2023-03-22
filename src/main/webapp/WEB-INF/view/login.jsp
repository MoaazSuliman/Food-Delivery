<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/all.css" />
    <link rel="stylesheet" href="css/login.css" />
    <title>signin</title>
  </head>
  <body>
    <div class="container">
      <div class="formcontainer" style="width: 500px; height: fit-content">
        <h2>login</h2>
        <form action="/login" method="post">
          <div class="lab">
            <input
              type="email"
              name="email"
              id=""
              value="${email}"
              placeholder="Email"
              style="width: 450px"
            />
          </div>
          <div class="lab">
            <input
              type="password"
              name="password"
              id=""
              placeholder="Password"
              value="${password}"
              style="width: 450px"
            />
          </div>
          <button class="btn" type="submt">login</button>
          <c:if test="${error}">
            <div
              style="
                width: 100%;
                background-color: var(--main-color);
                color: white;
                padding: 10px;
                text-align: center;
                text-transform: capitalize;
                border-radius: 5px;
                background-color: gray;
                margin-bottom: 20px;
              "
            >
              Error In Email Or Password
            </div></c:if
          >
          <a href="/forgetPassword">forget password?</a>
          <p>don't have any account</p>
          <a href="/register">sign up</a>
        </form>
      </div>
    </div>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/all.css" />
    <link rel="stylesheet" href="css/regester.css" />
    <title>Register</title>
  </head>
  <body>
    <div class="container">
      <div class="formcontainer">
        <h2>sign up</h2>
        <form:form action="/register" method="post" modelAttribute="user">
          <div class="lab">
            <form:input
              path="name"
              aria-required="true"
              placeholder="Name"
              required="required"
            />
          </div>
          <div class="lab">
            <form:input
              placeholder="Address"
              path="address"
              required="required"
            />
          </div>
          <div class="lab">
            <form:input path="email" placeholder="Email" required="required" />
          </div>
          <div class="lab">
            <form:input
              path="password"
              type="password"
              placeholder="create Password"
              required="required"
            />
          </div>
          <div class="lab">
            <form:input
              path="question"
              placeholder="Question"
              required="required"
            />
          </div>
          <div class="lab">
            <form:input
              path="answer"
              placeholder="Answer"
              required="required"
            />
          </div>
          <form:button class="btn">Register</form:button>
          <!-- <a href="#">forget password?</a> -->
          <p>aready have any account</p>
          <a href="/login" class="login">login</a>
           </form:form
        >
      </div>
    </div>
  </body>
</html>

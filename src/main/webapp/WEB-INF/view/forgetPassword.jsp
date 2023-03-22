<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Forget Password</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/all.min.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
  </head>

  <body>
    <div class="title">
      <h3 class="text-center mt-3" style="margin: 10px">Change Password</h3>
    </div>
    <!--     Start Of Form -->
    <form
      class="col-lg-6 col-md-8 col-sm-10 form mt-5"
      action="/forgetPassword"
      method="post"
    >
      <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Email address</label>
        <input
          type="email"
          class="email-inp form-control"
          id="exampleInputEmail1"
          aria-describedby="emailHelp"
          name="email"
          required="required"
          value="${email}"
        />
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Question</label>

        <select name="question" id="">
          <c:forEach var="user" items="${users}">
            <option value="${user.question}" name="question">
              ${user.question}
            </option>
          </c:forEach>
        </select>

        <!-- <input
          type="text"
          class="pass-inp form-control"
          id="exampleInputPassword1"
          name="text"
          required="required"
        /> -->
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Answer</label>
        <input
          type="text"
          class="pass-inp form-control"
          id="exampleInputPassword1"
          name="answer"
          required="required"
          value="${answer}"
        />
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label">Password</label>
        <input
          type="password"
          class="pass-inp form-control"
          id="exampleInputPassword1"
          name="password"
          required="required"
        />
      </div>
      <div class="mb-3">
        <label for="exampleInputPassword1" class="form-label"
          >Confirm Password</label
        >
        <input
          type="password"
          class="pass-inp form-control"
          id="exampleInputPassword1"
          name="confirmPassword"
          required="required"
        />
      </div>
      <c:if test="${error}"
        ><div
          style="
            background-color: #f33f3f;
            border-radius: 30px;
            height: 30px;
            margin-bottom: 10px;
            text-align: center;
          "
        >
          ${errorMsg}
        </div></c:if
      >
      <button type="submit" class="btn">Confirm</button>
    </form>
    <!-- End Of Form -->

    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>

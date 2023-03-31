<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DashBoard</title>
    <link
      href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
      rel="stylesheet"
    />
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/all.min.css" />
    <link rel="stylesheet" href="../assets/css/dashboard.css" />
  </head>

  <body>
    <div class="row">
      <!-- Start RightBar -->
      <div class="right-bar col-lg-3 col-md-4 col-sm-4 sticky-top">
        <h3>Admin DashBoard</h3>
        <ul>
          <div class="hover d-g products active">
            <i class="fa-solid fa-shop"></i>
            <li><a href="dashboard">Show All Foods</a></li>
          </div>

          <div class="hover d-g products">
            <i class="fa-solid fa-plus"></i>
            <li><a href="createFood">Create Food</a></li>
          </div>
          <div class="hover d-g products active">
            <i class="fa-solid fa-shop"></i>
            <li><a href="getAllCategories">Show All Categories</a></li>
          </div>
          <div class="hover d-g products">
            <i class="fa-solid fa-plus"></i>
            <li><a href="createCategory">Create Categorie</a></li>
          </div>
          <div class="hover d-g users">
            <i class="fa-solid fa-users"></i>
            <li><a href="getAllUsers">Users</a></li>
          </div>
          <div class="hover d-g products active">
            <i class="fa-solid fa-shop"></i>
            <li><a href="messages">Messages</a></li>
          </div>
          <div class="hover d-g products active">
            <i class="fa-solid fa-shop"></i>
            <li><a href="getAllReservations">Reservation</a></li>
          </div>
          <div class="hover d-g products active">
            <i class="fas fa-shopping-cart"></i>
            <li><a href="sales">Sales</a></li>
          </div>
        </ul>
      </div>
      <!-- End RightBar -->
      <!-- Strat Products -->
      <div class="col-lg-8 col-md-7 col-sm-7">
        <table class="table text-light text-center">
          <thead class="bg-danger">
            <tr>
              <td>Name</td>
              <td>Detail</td>
              <td>Price</td>
              <td>Discount</td>
              <td>Total Price</td>
              <td>Image</td>
              <td>Category</td>
              <td>Action</td>
              <!-- <td>Action</td> -->
            </tr>
          </thead>
          <tbody class="text-dark product-details">
            <c:forEach items="${foods}" var="food">
              <tr>
                <td>${food.name}</td>
                <td>${food.detail}</td>
                <td>${food.price}$</td>
                <td>${food.discount}%</td>
                <td>${food.total}$</td>
                <td><img src="${food.url}" alt="image" /></td>
                <td>${food.category.name}</td>
                <td class="text-truncate" style="max-width: 150px">
                  <br />
                  <br />
                  <a href="/updateFood/${food.id}" class="btn btn-dark"
                    >Update</a
                  >
                </td>
                <td class="text-truncate" style="max-width: 150px">
                  <br />
                  <br />
                  <!-- <a href="deleteFood/${food.id}" class="btn btn-danger"
                    >Delete</a> -->
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <!-- End Products -->
    </div>

    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>

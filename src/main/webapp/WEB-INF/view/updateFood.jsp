<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>UpdateProduct</title>
    <link
      href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
      rel="stylesheet"
    />
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../assets/css/all.min.css" />
    <link rel="stylesheet" href="../assets/css/dashboard.css" />
  </head>

  <body>
    <form
      class="create-form col-lg-8 col-md-7 col-sm-7"
      action="/updateFood/${food.id}"
      method="post"
    >
      <div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Name</label> <input
					type="text" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" name="name" required="true" value="${food.name}">
			</div>
      <div>
      	<label for="exampleInputEmail1" class="form-label">Details</label> <input
					type="text" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp" name="detail" required="true" value="${food.detail}">updateFood
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Price</label>
				<input type="number" class="form-control" id="exampleInputPassword1"
					name="price" required="true" value="${food.price}">
			</div>
      <div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Discount</label>
				<input type="number" class="form-control" id="exampleInputPassword1"
					name="discount" required="true" value="${food.discount}">
			</div>
			
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Image
					</label> <input type="text" class="form-control" label="url"
					id="exampleInputPassword1" name="file" required="true" value=${food.url}>
			</div>
      <div>
        <label for="exampleInputPassword1" class="form-label">Category
					</label>
          <select name="categoryId" id="" style="border-radius: 50px;width: 350px;">
            <c:forEach var="category" items="${categories}">
            <option value="${category.id}" style="text-align:center;">${category.name}</option>
            </c:forEach>
          </select>


      </div>
			<button type="submit" class="btn btn-dark w-100">Update
				Food</button>
    </form>
    <!-- End Form -->

    <script src="../ vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  </body>
</html>

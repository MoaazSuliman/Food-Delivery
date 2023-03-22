<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%-- 	pageEncoding="ISO-8859-1"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/all.min.css">
<link rel="stylesheet" href="assets/css/dashboard.css">
<link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--     JSTL -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body style="background-color: #fb5849;">

	<header class="" style="background-color: #fff;">
		<nav class="navbar navbar-expand-lg">
			<div class="container">
				<div class="logo">
        <a href="index"><img src="images/klassy-logo.png" alt="" /></a>
      </div>
				<!-- <a class="navbar-brand" href="index.html">
					<h2>
						Sixteen <em>Clothing</em>
					</h2>
				</a> -->
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive" style="background-color: #fff;
				;">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active" ><a class="nav-link"
							href="/indexFromCart" style="color: black; font-weight: bolder;">Home <span class="sr-only">(current)</span>
						</a></li>
			
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<br>
	<br>
	<br>
	<div class=""
		style="background-color: #fff; border-radius: 500px; margin-top: 20px">
		<nav class="navbar navbar-expand-lg">
			<div class="container" >
				<h2 style="font-size: 100px;">
					My <em>Cart</em><i class="fas fa-shopping-cart"></i>
				</h2>

			</div>
		</nav>
	</div>
	<br>
	<br>
	<c:if test="${connect==1 }">
		<p
			style="background-color: #fff; font-size: x-large; font-weight: bold;">We
			Will Call You To Get Your Products In 3 Days.</p>
	</c:if>
	<div class="row" style="margin-left: 20%;">

		<div class="col-lg-8 col-md-7 col-sm-7">
			<table class="table text-light text-center">
				<thead class="bg-danger" style="border-radius: 20px;">
					<tr>
						<td>Name</td>
						<td>Detail</td>
						<td>Price</td>
						<td>Image</td>
						<td>Date</td>
						<td>Action</td>
					</tr>
				</thead>
				<tbody class="text-dark product-details">
					<c:forEach items="${foods}" var="food">
						<tr style="background-color: #fff; border-radius: 20px; margin-top: 20px;">

							<td>${food.name}</td>
							<td>${food.detail}</td>
							<td>${food.total}$</td>
							<td><img src="${food.url}" alt="image"></td>
							<td></td>
							<td class="text-truncate" style="max-width: 150px;"><br>
								<br> <a href="deleteFoodFromCart/${food.id}"
								class="btn btn-dark">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<h4 style="text-align: center;"></h4>
			<p
				style="background-color: #fff; font-size: x-large; font-weight: bold; height: 80px; border-radius: 20px;">
				<span style="margin-left: 25%;">Total Price Before Discount : <span style="color: red;font-weight: bolder;">${totalBefore}$ </span></span><br><br>
			<span style="margin-left: 25%;">Total Price After Discount : <span style="color: red;font-weight: bolder;">${totalAfter}$ </span></span>
			</p>
			
			<button class="bg"
				style="position: absolute; margin-bottom: 20px; width: 100%; height: 100px; border-radius: 30px;margin-left: -15px;">
				<a href="/buyNow/${userId}" style="color: black; font-weight: 600;"> Buy
					Now</a>
			</button>
		</div>

	</div>

	<div class=""
		style="background-color: #fff; border-radius: 500px;     margin-top: 130px;
">
		<nav class="navbar navbar-expand-lg">
			<div class="container" >
				<h2 style="font-size: 100px;">
					Orders <em></em><i class="fas fa-shopping-cart"></i>
				</h2>

			</div>
		</nav>
	</div>


	<div class="row" style="margin-left: 20%;     margin-top: 20px;">

		<div class="col-lg-8 col-md-7 col-sm-7">
			<table class="table text-light text-center">
				<thead class="bg-danger" style="border-radius: 20px;">
					<tr>
							<td>Id</td>
						<td>Date</td>
						<td>Is Open</td>
							<td>Total</td>
						<td>Action</td>
					</tr>
				</thead>
				<tbody class="text-dark product-details">
					<c:forEach items="${orders}" var="order">
						<tr style="background-color: #fff; border-radius: 20px; margin-top: 20px;">
								<td>${order.id}</td>
							<td>${order.date}</td>
							<td>${order.open}</td>
							<td>${order.total}$</td>
						
							<td class="text-truncate" style="max-width: 150px;"><br>
								<br> <a href="/deleteOrderById/${order.id}"
								class="btn btn-dark">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>



</body>
</html>
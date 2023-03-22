<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/all.min.css">
<link rel="stylesheet" href="../assets/css/dashboard.css">
<link rel="stylesheet" href="../assets/css/templatemo-sixteen.css">
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


</head>
<body>


	<div class="col-lg-8 col-md-7 col-sm-7">
		<table class="table text-light text-center">
			<thead class="bg-danger" style="border-radius: 20px;">
				<tr>
				<td>Date</td>
				<td>Is Open</td>
				<td>Total</td>
				<td>Action</td>
				</tr>
			</thead>
			<tbody class="text-dark product-details">
			<c:forEach items="${orders}" var="order">
					<tr>

						<td>${order.date}</td>
						<td>${order.open}</td>
						<td>${order.total}$</td>
					 <td class="text-truncate" style="max-width: 150px">
                  <br />
                  <br />
                  <a href="/viewOrder/${order.id}" class="btn btn-dark"
                    >View Order</a
                  >
                </td>
					</tr>
			</c:forEach>
			</tbody>

		</table>
		<h4 style="text-align: center;"></h4>
		<p
			style="background-color: red; font-size: x-large; font-weight: bold; height: 50px; border-radius: 20px;">
			<span style="margin-left: 40%;">Total Price : ${total}$</span>
		</p>
	</div>

	</div>



</body>
</html>
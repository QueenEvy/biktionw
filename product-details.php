<?php
session_start();
error_reporting(0);
include('includes/config.php');
if (isset($_GET['action']) && $_GET['action'] == "add") {
	$id = intval($_GET['id']);
	if (isset($_SESSION['cart'][$id])) {
		$_SESSION['cart'][$id]['quantity']++;
	} else {
		$sql_p = "SELECT * FROM products WHERE id={$id}";
		$query_p = mysqli_query($con, $sql_p);
		if (mysqli_num_rows($query_p) != 0) {
			$row_p = mysqli_fetch_array($query_p);
			$_SESSION['cart'][$row_p['id']] = array("quantity" => 1, "price" => $row_p['productPrice']);
			header('location:my-cart.php');
		} else {
			$message = "Product ID is invalid";
		}
	}
}
$pid = intval($_GET['pid']);
if (isset($_GET['pid']) && $_GET['action'] == "wishlist") {
	if (strlen($_SESSION['login']) == 0) {
		header('location:login.php');
	} else {
		mysqli_query($con, "insert into wishlist(userId,productId) values('" . $_SESSION['id'] . "','$pid')");
		echo "<script>alert('Product aaded in wishlist');</script>";
		header('location:my-wishlist.php');
	}
}
if (isset($_POST['submit'])) {
	$qty = $_POST['quality'];
	$price = $_POST['price'];
	$value = $_POST['value'];
	$name = $_POST['name'];
	$summary = $_POST['summary'];
	$review = $_POST['review'];
	mysqli_query($con, "insert into productreviews(productId,quality,price,value,name,summary,review) values('$pid','$qty','$price','$value','$name','$summary','$review')");
}


?>
<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="keywords" content="motos, chaquetas, pantalones, botas">
	<meta name="robots" content="all">
	<title>Detalles de producto</title>
	<link rel="shortcut icon" href="img/Logo.svg">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/main.css">
	<link rel="stylesheet" href="assets/css/green.css">
	<link rel="stylesheet" href="assets/css/owl.carousel.css">
	<link rel="stylesheet" href="assets/css/owl.transitions.css">
	<link href="assets/css/lightbox.css" rel="stylesheet">
	<link rel="stylesheet" href="assets/css/animate.min.css">
	<link rel="stylesheet" href="assets/css/rateit.css">
	<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">
	<link rel="stylesheet" href="assets/css/config.css">

	<link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
	<link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
	<link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
	<link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
	<link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">

	<!-- Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
	<link rel="shortcut icon" href="assets/images/favicon.ico">
</head>

<body class="cnt-home">

	<header class="header-style-1">

		<!-- ============================================== TOP MENU ============================================== -->
		<?php include('includes/top-header.php'); ?>
		<!-- ============================================== TOP MENU : END ============================================== -->
		<?php include('includes/main-header.php'); ?>
		<!-- ============================================== NAVBAR ============================================== -->
		<?php include('includes/menu-bar.php'); ?>
		<!-- ============================================== NAVBAR : END ============================================== -->

	</header>

	<!-- ============================================== HEADER : END ============================================== -->
	<div class="breadcrumb">
		<div class="container">
			<div class="breadcrumb-inner">
				<?php
				$ret = mysqli_query($con, "select category.categoryName as catname, products.productName as pname from products join category on category.id=products.category where products.id='$pid'");
				while ($rw = mysqli_fetch_array($ret)) {

				?>


					<ul class="list-inline list-unstyled">
						<li><a href="index.php">Inicio</a></li>
						<li><?php echo htmlentities($rw['catname']); ?></a></li>
						<li><?php echo htmlentities($rw['subcatname']); ?></li>
						<li class='active'><?php echo htmlentities($rw['pname']); ?></li>
					</ul>
				<?php } ?>
			</div>
		</div>
	</div>
	<div class="body-content outer-top-xs">
		<div class='container'>
			<div class='row single-product outer-bottom-sm '>
				<div class='col-md-3 sidebar'>
					<div class="sidebar-module-container">


						<!-- ==============================================CATEGORY============================================== -->
						<div class="sidebar-widget outer-bottom-xs wow fadeInUp">
							<h3 class="section-title">Categoria</h3>
							<div class="sidebar-widget-body m-t-10">
								<div class="accordion">

									<?php $sql = mysqli_query($con, "select id,categoryName  from category");
									while ($row = mysqli_fetch_array($sql)) {
									?>
										<div class="accordion-group">
											<div class="accordion-heading">
												<a href="category.php?cid=<?php echo $row['id']; ?>" class="accordion-toggle collapsed">
													<?php echo $row['categoryName']; ?>
												</a>
											</div>

										</div>
									<?php } ?>
								</div>
							</div>
						</div>
						<!-- ============================================== CATEGORY : END ============================================== -->
						<!-- ============================================== HOT DEALS ============================================== -->
						<div class="sidebar-widget hot-deals wow fadeInUp">

							<div class="owl-carousel sidebar-carousel custom-carousel owl-theme outer-top-xs">




							</div>
						</div>

						<!-- ============================================== COLOR: END ============================================== -->
					</div>
				</div>
				<?php
				$ret = mysqli_query($con, "select * from products where id='$pid'");
				while ($row = mysqli_fetch_array($ret)) {

				?>


					<div class='col-md-9'>
						<div class="row  wow fadeInUp">
							<div class="col-xs-12 col-sm-6 col-md-5 gallery-holder">
								<div class="product-item-holder size-big single-product-gallery small-gallery">

									<div id="owl-single-product">

										<div class="single-product-gallery-item" id="slide1">
											<a data-lightbox="image-1" data-title="<?php echo htmlentities($row['productName']); ?>" href="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage1']); ?>">
												<img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage1']); ?>" width="370" height="350" />
											</a>
										</div>




										<div class="single-product-gallery-item" id="slide1">
											<a data-lightbox="image-1" data-title="<?php echo htmlentities($row['productName']); ?>" href="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage1']); ?>">
												<img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage1']); ?>" width="370" height="350" />
											</a>
										</div>

										<div class="single-product-gallery-item" id="slide2">
											<a data-lightbox="image-1" data-title="Gallery" href="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage2']); ?>">
												<img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage2']); ?>" />
											</a>
										</div>

										<div class="single-product-gallery-item" id="slide3">
											<a data-lightbox="image-1" data-title="Gallery" href="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage3']); ?>">
												<img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage3']); ?>" />
											</a>
										</div>

									</div>


									<div class="single-product-gallery-thumbs gallery-thumbs">

										<div id="owl-single-product-thumbnails">
											<div class="item">
												<a class="horizontal-thumb active" data-target="#owl-single-product" data-slide="1" href="#slide1">
													<img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage1']); ?>" />
												</a>
											</div>

											<div class="item">
												<a class="horizontal-thumb" data-target="#owl-single-product" data-slide="2" href="#slide2">
													<img class="img-responsive" width="85" alt="" src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage2']); ?>" />
												</a>
											</div>
											<div class="item">

												<a class="horizontal-thumb" data-target="#owl-single-product" data-slide="3" href="#slide3">
													<img class="img-responsive" width="85" alt="" src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage3']); ?>" height="200" />
												</a>
											</div>




										</div>



									</div>

								</div>
							</div>




							<div class='col-sm-6 col-md-7 product-info-block'>
								<div class="product-info">
									<h1 class="name"><?php echo htmlentities($row['productName']); ?></h1>
									
									<div class="stock-container info-container m-t-10">
										<div class="row">
											<div class="col-sm-3">
												<div class="stock-box">
													<span class="label">DISPONIBLE :</span>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="stock-box">
													<span class="value"><?php echo htmlentities($row['productAvailability']); ?></span>
												</div>
											</div>
										</div><!-- /.row -->
									</div>



									<div class="stock-container info-container m-t-10">
										<div class="row">
											<div class="col-sm-3">
												<div class="stock-box">
													<span class="label">Marca :</span>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="stock-box">
													<span class="value"><?php echo htmlentities($row['productCompany']); ?></span>
												</div>
											</div>
										</div><!-- /.row -->
									</div>


									<div class="stock-container info-container m-t-10">
										<div class="row">
											<div class="col-sm-3">
												<div class="stock-box">
													<span class="label">Costo de envío:</span>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="stock-box">
													<span class="value"><?php if ($row['shippingCharge'] == 0) {
																			echo "Gratis";
																		} else {
																			echo htmlentities($row['shippingCharge']);
																		}

																		?></span>
												</div>
											</div>
										</div>
									</div>

									<div class="price-container info-container m-t-20">
										<div class="row">


											<div class="col-sm-6">
												<div class="price-box">
													<span class="price">$ <?php echo htmlentities($row['productPrice']); ?></span>
													
												</div>
											</div>

										</div>
									</div>






									<div class="quantity-container info-container">
										<div class="row">

											<div class="col-sm-2">
												<span class="label">Cantidad :</span>
											</div>

											<div class="col-sm-2">
												<div class="cart-quantity">
													<div class="quant-input">
														<div class="arrows">
															<div class="arrow plus gradient"><span class="ir"><i class="icon fa fa-sort-asc"></i></span></div>
															<div class="arrow minus gradient"><span class="ir"><i class="icon fa fa-sort-desc"></i></span></div>
														</div>
														<input type="text" value="1">
													</div>
												</div>
											</div>

											<div class="col-sm-7">
												<a href="product-details.php?page=product&action=add&id=<?php echo $row['id']; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart inner-right-vs"></i> Agregar a compras</a>
											</div>


										</div>
									</div>									
								</div>
							</div>
						</div>


						<div class="product-tabs inner-bottom-xs  wow fadeInUp">
							<div class="row">
								<div class="col-sm-3">
									<ul id="product-tabs" class="nav nav-tabs nav-tab-cell">
										<li class="active"><a data-toggle="tab" href="#description">DESCRIPCIÓN</a></li>
										
									</ul>
								</div>
								<div class="col-sm-9">

									<div class="tab-content">

										<div id="description" class="tab-pane in active">
											<div class="product-tab">
												<p class="text"><?php echo $row['productDescription']; ?></p>
											</div>
										</div>

										

								</div>
							</div>



						</div>
					</div>
			</div>
		</div>

	<?php $cid = $row['category'];
					$subcid = $row['subCategory'];
				} ?>
	
	</div>
	<div class="clearfix"></div>
	</div>

	</div>
	</div>
	<?php include('includes/footer.php'); ?>

	<script src="assets/js/jquery-1.11.1.min.js"></script>

	<script src="assets/js/bootstrap.min.js"></script>

	<script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>

	<script src="assets/js/echo.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
	<script src="assets/js/bootstrap-slider.min.js"></script>
	<script src="assets/js/jquery.rateit.min.js"></script>
	<script type="text/javascript" src="assets/js/lightbox.min.js"></script>
	<script src="assets/js/bootstrap-select.min.js"></script>
	<script src="assets/js/wow.min.js"></script>
	<script src="assets/js/scripts.js"></script>

	<!-- For demo purposes – can be removed on production -->

	<script src="switchstylesheet/switchstylesheet.js"></script>

	<script>
		$(document).ready(function() {
			$(".changecolor").switchstylesheet({
				seperator: "color"
			});
			$('.show-theme-options').click(function() {
				$(this).parent().toggleClass('open');
				return false;
			});
		});

		$(window).bind("load", function() {
			$('.show-theme-options').delay(2000).trigger('click');
		});
	</script>
	<!-- For demo purposes – can be removed on production : End -->



</body>

</html>
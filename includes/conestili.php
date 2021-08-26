<?php

 if(isset($_Get['action'])){
		if(!empty($_SESSION['cart'])){
		foreach($_POST['quantity'] as $key => $val){
			if($val==0){
				unset($_SESSION['cart'][$key]);
			}else{
				$_SESSION['cart'][$key]['quantity']=$val;
			}
		}
		}
	}
?>
	<div class="main-header">
		<div class="container">
			<div class="box container">
			<div class="row">
				<div class="col-xs-12 col-sm-3 col-md-3 logo-holder">

					<!--  LOGO -->
					<div class="logo">
						<a href="index.php">
							<img src="img/Logo.png" width="150" alt="Biktion">
							<span class="Logo-font font-weight-bold" >Biktion</span>
						</a>
					</div>
				</div>
				<div>

				<div class="col-xs-12 col-sm-3 animate-dropdown top-cart-row ">
				<?php
				//session_start();

				?>

				<div class="top-bar animate-dropdown">
				<div class="container">
					<div class="header-top-inner">
						<div class="cnt-account">
							<ul class="list-unstyled">

								<?php if (strlen($_SESSION['login'])) {   ?>
									<li class="btn"><a href="#">Bienvenid@ - <?php echo htmlentities($_SESSION['username']); ?></a></li>
								<?php } ?>

								<li class="btn"><a href="my-account.php"><i class="icon fa fa-user"></i >Mi cuenta </a></li>


								<?php if (strlen($_SESSION['login']) == 0) {   ?>
									<li><a href="login.php"><i class="icon fa fa-sign-in"></i>Iniciar sesión</a></li>
								<?php } else { ?>
														

									<li class="btn"><a href="logout.php"><i class="icon fa fa-sign-out"></i>Cerrar sesión</a></li>
								<?php } ?>
								
								


							<?php
					if(!empty($_SESSION['cart'])){
						?>
						<div class="dropdown dropdown-cart">
							<a href="#" class="dropdown-toggle lnk-cart" data-toggle="dropdown">
								<div class="items-cart-inner">
									<div class="total-price-basket">
										<li class="btn">Carrito -</li>
										<span class="total-price">
											<span class="sign">$.</span>
											<span class="value"><?php echo $_SESSION['tp']; ?></span>
										</span>
									</div>
									<div class="basket">
										<i class="glyphicon glyphicon-shopping-cart"></i>
									</div>
									<div class="basket-item-count"><span class="count"><?php echo $_SESSION['qnty'];?></span></div>

								</div>
							</a>
							<ul class="dropdown-menu">

							<?php
						$sql = "SELECT * FROM products WHERE id IN(";
								foreach($_SESSION['cart'] as $id => $value){
								$sql .=$id. ",";
								}
								$sql=substr($sql,0,-1) . ") ORDER BY id ASC";
								$query = mysqli_query($con,$sql);
								$totalprice=0;
								$totalqunty=0;
								if(!empty($query)){
								while($row = mysqli_fetch_array($query)){
									$quantity=$_SESSION['cart'][$row['id']]['quantity'];
									$subtotal= $_SESSION['cart'][$row['id']]['quantity']*$row['productPrice']+$row['shippingCharge'];
									$totalprice += $subtotal;
									$_SESSION['qnty']=$totalqunty+=$quantity;

						?>
								<li>
									<div class="cart-item product-summary">
										<div class="row">
											<div class="col-xs-4">
												<div class="image">
													<a href="detail.html"><img  src="admin/productimages/<?php echo $row['id'];?>/<?php echo $row['productImage1'];?>" width="35" height="50" alt=""></a>
												</div>
											</div>
											<div class="col-xs-7">

												<h3 class="name"><a href="index.php?page-detail"><?php echo $row['productName']; ?></a></h3>
												<div class="price">$.<?php echo ($row['productPrice']+$row['shippingCharge']); ?>*<?php echo $_SESSION['cart'][$row['id']]['quantity']; ?></div>
											</div>
										</div>
									</div>

									<?php } }?>
									<div class="clearfix"></div>
								</li>
								<div class="clearfix cart-total">
									<div class="pull-right">
											<span class="text">Total :</span><span class='price'>$.<?php echo $_SESSION['tp']="$totalprice". ".00"; ?></span>
									</div>

									<div class="clearfix"></div>

									<a href="my-cart.php" class="btn btn-upper btn-primary btn-block m-t-20">Mi carrito</a>
								</div>
							</li>
							</ul>
						</div>
					<?php } else { ?>
					<div class="dropdown dropdown-cart">
							<a href="#" class="dropdown-toggle lnk-cart" data-toggle="dropdown">
								<div class="items-cart-inner">
									<div class="total-price-basket">
										<span class="lbl">carrito </span>
										<span class="total-price">
											<span class="sign">$.</span>
											<span class="value">00.00</span>
										</span>
									</div>
									<div class="basket">
										<i class="glyphicon glyphicon-shopping-cart"></i>
									</div>
									<div class="basket-item-count"><span class="count">0</span></div>

								</div>
							</a>
							<ul class="dropdown-menu">

								<li>
									<div class="cart-item product-summary">
										<div class="row">
											<div class="col-xs-12">
												Carrito de compras vacio.
											</div>

										</div>
									</div>

				         	</li>

								<div class="clearfix cart-total">

									<div class="clearfix"></div>

									<a href="index.php" class="btn btn-upper btn-primary btn-block m-t-20">Seguir comprando</a>
								</div>


							</li>
							</ul>
						</div>
						<?php }?>
						
							</ul>
						</div>

						<div class="cnt-block">

						</div>

						<div class="clearfix"></div>
					</div><!-- /.header-top-inner -->
				</div><!-- /.container -->
				</div><!-- /.header-top -->

				</div>


                           <!-- = Carrito ============================================================= -->
				<!-- <div class="col-xs-12 col-sm-3 col-md-3 animate-dropdown top-cart-row"> -->
				
						</div>	
			</div>
		</div>
	</div>
			

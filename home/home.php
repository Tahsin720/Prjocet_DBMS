<?php
	session_start();
	$servername = "localhost";
    $username = "dbms";
    $password = "dbms";
    // Create connection
    $con = new mysqli($servername, $username, $password);

    mysqli_select_db($con, 'demo');
?>

<!DOCTYPE html>
<html>
<head>
	<title>Home Page</title>
</head>
<body>
	<form action="..\search\search.php" method="POST"> 
		<input type"text" name="search" placeholder="Search">
		<button type="submit" name="search">Search</button>
	</from>
	
	<form action="..\donate\donate.php" method="POST"> 
		<button type="submit" name="donate">Donate</button>
	</from>

	<?php
	$query = "SELECT * FROM images ORDER BY id ASC";
	$res = mysqli_query($con, $query);
	if(mysqli_num_rows($res) > 0){
		while($row = mysqli_fetch_array($res)){
			?>
			<div class="col-md-3">

				<form method="post" action="..\request\req.php?action=add & id=<?php echo $row["id"]; ?>">

					<div class="product">
						<img src="<?php echo $row['filepath']; ?>" class="img-responsive" width="100" height="50">
						<h5 class="text-info"><?php echo $row["filename"]; ?></h5>
						
						
						<input type="hidden" name="hidden_name" value="<?php echo $row["filename"]; ?>">
						
						<input type="submit" name="add" value="Request">
						<a href="..\post\post.php"> Post </a><br>
					</div>
				</form>
			</div>
		<?php	
		}

	}

	?>
</body>
</html>
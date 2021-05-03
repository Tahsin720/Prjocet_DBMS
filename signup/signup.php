<!DOCTYPE html>
<html>
<head>
	<title>Registration Page</title>
	<style>
		.loginbox{
			width: 320px;
			height: 420px;
			background-color: transparent;
			color: black;
			top: 50%;
			left: 50%;
			position: absolute;
			transform: translate(-50%, -50%);
			box-sizing: border-box;
			padding: 70px 30px;
		}
		.loginbox p{
			margin: 0;
			padding: 0;
			font-weight: bold;
		}

		.loginbox input{
			width: 100%;
			margin-bottom: 20px;

		}

		.loginbox input[type = "text"], input[type = "password"]{
			border: none;
			border-bottom: 1px solid #fff;
			background: transparent;
			color: red;
			outline: none;
			height: 40px;
			font-size: 16px;
		}

		.loginbox input[type = "submit"]{
			border: none;
			outline: none;
			height: 40px;
			background: white;
			color: black;
			font-size: 18px;
			border-radius: 20px;
		}

		.loginbox input[type = "submit"]:hover {
			cursor: pointer;
			background: green;
			color: white;
		}

	</style>
</head>
<body>
		<div class = "loginbody"> 
				<div class = "loginbox">
					<h1>Registrar Here</h1>
					<form action="..\resigter\Registration.php" method="post"> 
						<p>User name</p>
						<input type = "text" name = "user" placeholder = "Enter User name">
						<p>Password</p>
						<input type = "Password" name = "password"placeholder="Enter Password">
						<input type = "submit" name = "" value = "Sign Up">

					</form>
				</div>
			</div>

</body>
</html>
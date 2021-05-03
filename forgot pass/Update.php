<?php
	session_start();
	$servername = "localhost";
	$username = "dbms";
	$password = "dbms";

	// Create connection
	$con = new mysqli($servername, $username, $password);

	mysqli_select_db($con, 'demo');
	$name = $_POST['user'];
	$pass = $_POST['password'];
	$re_type = $_POST['re_password'];

if ($con->connect_error) {
  die("Connection failed: " . $con->connect_error);
}


if ($pass == $re_type) {
	echo "Entered!";
	$sql = "UPDATE registration SET password = '$pass' WHERE username = '$name'";

	if ($con->query($sql) === TRUE) {
	  echo "Record updated successfully";
	} 
}

else {
  	header('location: ..\login\html_login.php');
}

$con->close();
?>
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
if ($con->connect_error) {
  die("Connection failed: " . $con->connect_error);
}

$sql = "INSERT INTO registration (username, password)
VALUES ('$name', '$pass')";

if ($con->query($sql) === TRUE) {
  echo "New record created successfully";
} else {
  echo "Error: " . $sql . "<br>" . $con->error;
}

$con->close();
?>
<?php
	session_start();
	if(!isset($_SESSION['user'])){
        header('location: ..\login\login.php');
    }
	$servername = "localhost";
	$username = "dbms";
	$password = "dbms";

	// Create connection
	$con = new mysqli($servername, $username, $password);

	mysqli_select_db($con, 'demo');

	$flag = 0;

	$isbn = $_GET['isbn'];
	// echo $isbn;

	$requester_name = $_SESSION['user'];
	#echo $requester_name;
	
	$sql = "SELECT book_id FROM request WHERE requester_name = '$requester_name'";
	$result = $con->query($sql);

	if ($result->num_rows > 0) {
	// output data of each row
		while($row = $result->fetch_assoc()) {
			if($row['book_id'] == $isbn){
				$flag = 1;
			}

		}
	}
	echo $flag;
	if($flag == 0){
		$SQL = "SELECT username, author FROM book WHERE isbn = '$isbn'";
		$res = mysqli_query($con, $SQL);
		$row = $res->fetch_assoc();
		#echo $row['username'];
		
		$uname = $row['username'];
		#echo $row['name'];
		#$name = $row['name'];
		#echo $row['author'];
		$author = $row['author'];
		$q = "INSERT INTO request(requester_name, time, username, book_id) VALUES ('$requester_name', NOW(), '$uname', '$isbn')";
		$query = mysqli_query($con, $q);
		#echo $q;

		if ($query){
			echo "New record created successfully";
			header('location: ..\book\book.php');
		} else {
			echo "Error: ";
			
		}
	}
	else{
		header('location: ..\book\book.php');
	}


	$con->close();
?>
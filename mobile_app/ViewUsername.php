<?php 
	$db = mysqli_connect('localhost','root','','login');
    if(!$db){
        echo "Database connection failed";
    }

	$query = "SELECT * FROM signin";
    $rows=array();

    while($row =mysqli_fetch_array($result))
    {
        $rows[] = $row;
    }
    echo json_encode($rows);

?>
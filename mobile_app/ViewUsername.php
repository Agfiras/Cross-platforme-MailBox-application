<?php 
	$db = mysqli_connect('localhost','root','','login');
    if(!$db){
        echo "Database connection failed";
    }

	$query = "SELECT * FROM signin";
    $result = mysqli_query($db, $query);

    $emparray = array();
    while($row =mysqli_fetch_assoc($result))
    {
        $emparray[] = $row;
    }
    echo json_encode($emparray);

?>
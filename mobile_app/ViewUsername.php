<?php 
	$db = mysqli_connect('localhost','root','','login');
    if(!$db){
        echo "Database connection failed";
    }

	$query = $db->query("SELECT * FROM signin");
    $result = array();

    while ($rowData = $query->fetch_assoc()) {
        $result[] = $rowData;
    }
    
    echo json_encode($result);

?>
<?php 
	$db = mysqli_connect('localhost','root','','login');
    if(!$db){
        echo "Database connection failed";
    }

	$result = $db->query("SELECT * FROM signin");

    //Initialize array variable
      $dbdata = array();
    
    //Fetch into associative array
      while ( $row = $result->fetch_assoc())  {
        $dbdata[]=$row;
      }
    
    //Print array in JSON format
     echo json_encode($dbdata[0]);

?>
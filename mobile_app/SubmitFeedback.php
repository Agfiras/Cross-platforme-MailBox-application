<?php 
	$db = mysqli_connect('localhost','root','','login');
    if(!$db){
        echo "Database connection failed";
    }

	$object = $_POST['object'];
	$problem = $_POST['problem'];

	$sql = "INSERT INTO feedback (object,problem) VALUES ('$object','$problem') "; 
    
    if (mysqli_query($db, $sql)) {
        $MSG = 'Data Successfully Submitted.' ;
        $json = json_encode($MSG);
        echo $json ;
        }
        else {

            echo "Error: ";
        }
        $db->close();
?>
    
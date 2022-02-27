<?php
include "FonctionC.php";
include "Client.php";

if (isset($_POST['Full_name']) and isset($_POST['Phone_num']) and isset($_POST['CIN']) and isset($_POST['Email']) and isset($_POST['Adresse']) and isset($_POST['Birth_Date']) and isset($_POST['Id_Login']) and isset($_POST['Password'])) {

    $client=new client($_POST['Full_name'],$_POST['Phone_num'],$_POST['CIN'],$_POST['Email'],$_POST['Adresse'],$_POST['Birth_Date'],$_POST['Id_Login'],$_POST['Password']);

    $functionc=new FonctionC();
    $functionc->AddClient($client);

}
else{
    echo "verify champs";
}


?>
}

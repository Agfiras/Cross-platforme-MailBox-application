<?php
include "FonctionC.php";
include "Admin.php";

if (isset($_POST['Full_name']) and isset($_POST['ID_AdLogin']) and isset($_POST['Password'])) {

    $Admin=new Admin($_POST['Full_name'],$_POST['ID_AdLogin'],$_POST['Password']);

    $functionc=new FonctionC();
    $functionc->AddAdmin($Admin);

}
else{
    echo "verify champs";
}


?>
}
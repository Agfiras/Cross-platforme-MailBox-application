<?php
include "D:\phpstorm project\FonctionC.php";
include "D:\phpstorm project\Smart_Box.phpp";

if (isset($_POST['ID_Box']) and isset($_POST['Adress_rasp'])) {

    $Box=new Smart_Box($_POST['ID_Box'],$_POST['Adress_rasp']);

    $functionc=new fonctionc();
    $functionc->AddBox($Box);

}
else{
    echo "verify champs";
}

?>
}

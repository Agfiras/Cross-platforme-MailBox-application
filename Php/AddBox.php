<?php
include "FonctionC.php";
include "Smart_Box.phpp";

if (isset($_POST['ID_Box']) and isset($_POST['Adress_rasp'])) {

    $Box=new Smart_Box($_POST['ID_Box'],$_POST['Adress_rasp']);

    $functionc=new FonctionC();
    $functionc->AddBox($Box);

}
else{
    echo "verify champs";
}

?>
}

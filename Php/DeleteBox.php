<?php
include 'D:\phpstorm project\Smart_Box.php';
include 'D:\phpstorm project\FonctionC.php';

$Box=new Smart_Box($_GET['Adress_rasp '],NULL,NULL,NULL,NULL,NULL);

$fonctionc=new fonctionc();

$fonctionc->DeleteBox($Box);

//!!MUst include header
?>

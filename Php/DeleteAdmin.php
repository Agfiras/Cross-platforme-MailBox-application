<?php
include 'D:\phpstorm project\Admin.php';
include 'D:\phpstorm project\FonctionC.php';

$Admin=new Admin($_GET['Id_LoginAd'],NULL,NULL,NULL,NULL,NULL);

$fonctionc=new fonctionc();

$fonctionc->DeleteAdmin($Admin);

//!!MUst include header
?>


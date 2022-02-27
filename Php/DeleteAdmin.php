<?php
include 'Admin.php';
include 'FonctionC.php';

$Admin=new Admin($_GET['Id_LoginAd'],NULL,NULL,NULL,NULL,NULL);

$fonctionc=new FonctionC();

$fonctionc->DeleteAdmin($Admin);

//!!MUst include header
?>


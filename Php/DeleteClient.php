<?php
include 'Client.php';
include 'FonctionC.php';

$client=new client($_GET['CIN'],NULL,NULL,NULL,NULL,NULL);

$fonctionc=new fonctionc();

$fonctionc->DeleteClient($client);

//!!MUst include header
?>

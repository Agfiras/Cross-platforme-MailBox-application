<?php
include 'config.php';

class FonctionC
{
    function AddClient($Client)
    {
        $Full_name=$Client->getFull_name();
        $Phone_num=$Client->getPhone_num();
        $Id_Login=$Client->getId_Login();
        $Password=$Client->getPassword();
        $email=$Client->getEmail();
        $Adress=$Client->getAdress();
        $CIN=$Client->getCIN();
        $Birth_Date=$Client->getBirthDate();


        $host=mysqli_connect("localhost", "root", "")or die("cannot connect");
        mysqli_select_db($host,"dashboard")or die("cannot select DB");



        $sql="INSERT INTO client (Full_name,Phone_num , CIN, Email  , Adresse , Birth_Date  , Id_Login  , Password  ) VALUES ($Full_name', '$Phone_num', '$CIN', '$email', '$Adress', '$Birth_Date', '$Id_Login', '$Password,NOW())";


        //verify Email existence
        $select = mysqli_query($host, "SELECT * FROM users WHERE email = '".$_POST['Email']."'");
        if(mysqli_num_rows($select)) {
            exit('This email address is already used!');
        }
        //******
    }


    function DeleteClient($Client) {
        $CIN=$Client->getCIN();

        $host=mysqli_connect("localhost", "root", "")or die("cannot connect");
        mysqli_select_db($host,"dashboard")or die("cannot select DB");

        $sql="DELETE FROM `client` WHERE `client`.`CIN` = '$CIN'";

        $req=mysqli_query($host,$sql);
    }


    function AddAdmin($Admin){
        $Full_name=$Admin->getFullname();
        $Id_LoginAd=$Admin->getIdLoginAd();
        $Password=$Admin->getPasswordAdmin();

        $host=mysqli_connect("localhost", "root", "")or die("cannot connect");
        mysqli_select_db($host,"dashboard")or die("cannot select DB");

        $sql="INSERT INTO admin (Full_name , ID_AdLogin , Password ) VALUES ('$Full_name', '$Id_LoginAd', '$Password')";

        $req=mysqli_query($host,$sql);
        if($req)
        {
            echo 'added';

        }
        else
        {
            echo 'mail invalid';
        }
    }


    function DeleteAdmin($Admin){

        $Id_LoginAd=$Admin->getIdLoginAd();

        $host=mysqli_connect("localhost", "root", "")or die("cannot connect");
        mysqli_select_db($host,"dashboard")or die("cannot select DB");

        $sql="DELETE FROM `admin` WHERE `admin`.`ID_AdLogin` = '$Id_LoginAd'";

        $req=mysqli_query($host,$sql);

    }


    function AddBox($Smart_Box){
        $Id_Box=$Smart_Box->getIdBox();
        $Adress_rasp=$Smart_Box->getAdressRasp();

        $host=mysqli_connect("localhost", "root", "")or die("cannot connect");
        mysqli_select_db($host,"dashboard")or die("cannot select DB");

        $sql="INSERT INTO admin (ID_Box  , Adress_rasp  ) VALUES ('$Id_Box', '$Adress_rasp')";

        $req=mysqli_query($host,$sql);
        if($req)
        {
            echo 'added';

        }
        else
        {
            echo 'invalid';
        }
    }

    function DeleteBox($Smart_Box){

        $Adress_rasp=$Smart_Box->getAdressRasp();

        $host=mysqli_connect("localhost", "root", "")or die("cannot connect");
        mysqli_select_db($host,"dashboard")or die("cannot select DB");

        $sql="DELETE FROM `smart_box ` WHERE `smart_box `.`Adress_rasp ` = '$Adress_rasp'";

        $req=mysqli_query($host,$sql);
    }


    function ViewClient(){

        $sql="SELECT * from dashboard.client";
        $db = config::getConnexion();
        try
        {
            $list=$db->query($sql);
            return $list;
        }
        catch (Exception $e)
        {
            die('Erreur: '.$e->getMessage());
        }
    }

    function ViewAdmin(){

        $sql="SELECT * from dashboard.admin";
        $db = config::getConnexion();
        try
        {
            $list=$db->query($sql);
            return $list;
        }
        catch (Exception $e)
        {
            die('Erreur: '.$e->getMessage());
        }
    }

    function ViewBox(){

        $sql="SELECT * from dashboard.smart_box";
        $db = config::getConnexion();
        try
        {
            $list=$db->query($sql);
            return $list;
        }
        catch (Exception $e)
        {
            die('Erreur: '.$e->getMessage());
        }
    }


    function ModifyClient($Full_name,$Phone_num,$Id_Login,$Password,$email,$Adress,$CIN,$Birth_Date){

        $sql="UPDATE dashboard.client set Full_name='$Full_name', Phone_num='$Phone_num', Passwoard='$Password',Email='$email',Adress='$Adress',CIN='$CIN',Birth_Date='$Birth_Date' where ID_Login='$Id_Login'";
        $db = config::getConnexion();
        try
        {
            $db->query($sql);
        }
        catch (Exception $e)
        {
            die('Erreur: '.$e->getMessage());
        }
    }

    function modifyAdmin($Full_name,$Id_LoginAd,$Password_Admin)
    {
        $sql="update dashboard.categories set Full_name='$Full_name', Passwoard_Admin='$Password_Admin' where Id_Admin='$Id_LoginAd'";
        $db = config::getConnexion();
        try
        {
            $db->query($sql);
        }
        catch (Exception $e)
        {
            die('Erreur: '.$e->getMessage());
        }
    }


    function modifyBox($ID_Box,$Adress_rasp)
    {
        $sql="update dashboard.smart_box set ID_Box='$ID_Box' where adress_rasp='$Adress_rasp'";
        $db = config::getConnexion();
        try
        {
            $db->query($sql);
        }
        catch (Exception $e)
        {
            die('Erreur: '.$e->getMessage());
        }
    }


}

?>

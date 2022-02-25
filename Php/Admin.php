<?php

class Admin
{
    private $Full_name;
    private $Id_LoginAd;
    private $Password_Admin;

    public function __construct($Full_name, $Id_LoginAd, $Password_Admin)
    {
        $this->Full_name = $Full_name;
        $this->Id_LoginAd = $Id_LoginAd;
        $this->Password_Admin = $Password_Admin;
    }

    public function getFullName()
    {
        return $this->Full_name;
    }


    public function setFullName($Full_name)
    {
        $this->Full_name = $Full_name;
    }

    public function getIdLoginAd()
    {
        return $this->Id_LoginAd;
    }


    public function setIdLoginAd($Id_LoginAd)
    {
        $this->Id_LoginAd = $Id_LoginAd;
    }

    public function getPasswordAdmin()
    {
        return $this->Password_Admin;
    }

    public function setPasswordAdmin($Password_Admin)
    {
        $this->Password_Admin = $Password_Admin;
    }



}

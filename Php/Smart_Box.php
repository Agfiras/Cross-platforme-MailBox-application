<?php

class Smart_Box
{ private $Id_Box;
  private $Adress_rasp ;

    public function __construct($Id_Box, $Adress_rasp)
    {
        $this->Id_Box = $Id_Box;
        $this->Adress_rasp = $Adress_rasp;
    }

                                        //**Getter
    public function getIdBox()
    {
        return $this->Id_Box;
    }


    public function setIdBox($Id_Box)
    {
        $this->Id_Box = $Id_Box;
    }


    public function getAdressRasp()
    {
        return $this->Adress_rasp;
    }


    public function setAdressRasp($Adress_rasp)
    {
        $this->Adress_rasp = $Adress_rasp;
    }



}
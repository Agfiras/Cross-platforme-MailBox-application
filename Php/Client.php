<?PHP
class Client
{
    private $Full_name;
    private $Phone_num;
    private $Id_Login;
    private $Password;
    private $email;
    private $Adress;
    private $CIN;
    private $Birth_Date;

    function __construct($Full_name, $Phone_num, $Id_Login, $Password, $email, $Adress, $CIN, $Birth_Date)
    {
        $this->Full_name = $Full_name;
        $this->Phone_num = $Phone_num;
        $this->Id_Login = $Id_Login;
        $this->email = $email;
        $this->Password = $Password;
        $this->Adress = $Adress;
        $this->CIN = $CIN;
        $this->Birth_Date = $Birth_Date;
    }
                                              //****Getter*****
    function getFull_name()
    {
        return $this->Full_name;
    }

    function getPhone_num()
    {
        return $this->Phone_num;
    }

    function getId_Login()
    {
        return $this->Id_Login;
    }

    function getEmail()
    {
        return $this->email;
    }

    function getPassword()
    {
        return $this->Password;
    }

    function getadress()
    {
        return $this->Adress;
    }
    function getCIN()
    {
        return $this->CIN;
    }

    public function getBirthDate()
    {
        return $this->Birth_Date;
    }

                                        //*****SETTER*****

    function setFull_name($Full_name)
    {
        $this->Full_name=$Full_name;
    }
    function setPhone_num($Phone_num)
    {
        $this->Phone_num=$Phone_num;
    }
    function setId_Login($Id_Login)
    {
        $this->Id_Login=$Id_Login;
    }
    function setEmail($email)
    {
        $this->email=$email;
    }
    function setPassword($Password)
    {
        $this->Password=$Password;
    }
    function setAdress($Adress)
    {
        $this->Adress=$Adress;
    }

    public function setCIN($CIN)
    {
        $this->CIN = $CIN;
    }

    public function setBirthDate($Birth_Date)
    {
        $this->Birth_Date = $Birth_Date;
    }
}

?>



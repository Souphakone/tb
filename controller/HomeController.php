<?php

class HomeController
{
    function home()
    {
        require_once("view/home.php");
    }
    static function autoConnection()
    {
        require_once("model/Autologin.php");
        Autologin::login();
    }
}

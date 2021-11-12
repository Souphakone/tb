<?php

require_once("model/Team.php");

class TeamController
{
    public function home()
    {

        $TeamModel = new Team();
        $Teams = $TeamModel->myteams();
        $Teams = $TeamModel->myteams();

        require("view\\teams\myteams.php");
    }
}

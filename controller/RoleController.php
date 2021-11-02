<?php

require_once("model/Role.php");

class RoleController
{
    function home()
    {
        $RoleModel = new Role();
        $Roles = $RoleModel->all();

        require("view\\roles\\roles.php");
    }
}

<?php

require_once("model/Member.php");
require_once("model/Team.php");
require_once("model/Status.php");
require_once("model/Role.php");

class MemberController
{
    public function home()
    {
        $memberModel = new MemberModel();
        $members = $memberModel->all();

        require("view\members\members.php");
    }
    public function profil()
    {
        $roleModel = new Role();
        $role = Role::find($_SESSION["member"]->role_id);

        $statusModel = new Statu();
        $Statu = Statu::find($_SESSION["member"]->Statu_id);
        require("view\members\profil.php");
    }

    public function userProfil()
    {
        $memberModel = new MemberModel();
        $member = $memberModel->find($_GET['user']);

        $roleModel = new Role();
        $role = Role::find($member->role_id);

        $statusModel = new Statu();
        $Statu = Statu::find($member->Statu_id);
        require("view\members\profil.php");
    }
}

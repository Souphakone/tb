<?php

require_once("model/Member.php");

class MemberController
{
    public function home()
    {
        $memberModel = new MemberModel();
        $members = $memberModel->all();

        require("view\members\members.php");
    }
}

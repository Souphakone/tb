<?php

require_once 'Member.php';

class Autologin
{
    static public function login()
    {
        $_SESSION['member'] = MemberModel::find(USER_ID);
    }
}

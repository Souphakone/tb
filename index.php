<?php
session_start();

require_once 'controller/HomeController.php';
HomeController::autoConnection();


if (isset($_GET['controller'])) {
    $controller = $_GET['controller'] . "Controller";

    (isset($_GET['action'])) ? $action = $_GET['controller'] : $action = "home";
} else {
    $controller = "HomeController";
    $action = "home";
}
require_once "controller/$controller.php";
$controller = new $controller();
$controller->$action();

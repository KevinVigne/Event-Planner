<?php
require_once(__DIR__ . '/../vendor/autoload.php');

use Config\Router;

$router = new Router;

$router->addRoute('/404', 'ErrorController', 'notFound');


$router->handleRequest();
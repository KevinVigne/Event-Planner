<?php
// Pour éviter les conflit avec les librairies externes 
    namespace Config;

class Router
{
    private array $routes = [];
    
    public function getUri()
    {
        $uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
        return $uri;
    }

    public function addRoute (string $uriName ,string $controllerName, string $method)
    {
        $this->routes[$uriName] = [
            'controller' => $controllerName,
            'method' => $method
        ];
    }
    public function handleRequest()
    {
        $uri = $this->getUri();

        $routeFound = false;
        
        foreach($this->routes as $pattern => $routeInfo)
        {
            if($uri === $pattern){
                $routeFound = true;

                $controllerClass = $routeInfo['controller'];
                $method = $routeInfo['method'];

                $controller = new $controllerClass();

                $controller->$method();

                break;
            }
        }
        if(!$routeFound){
            echo ErrorController::notFound();
        }
    }
}
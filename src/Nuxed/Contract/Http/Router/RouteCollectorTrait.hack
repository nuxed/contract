namespace Nuxed\Contract\Http\Router;

use namespace HH\Lib\{C, Str, Vec};
use namespace Nuxed\Contract\Http\Server;

/**
 * Aggregate routes for the router.
 *
 * This class provides * methods for creating path+HTTP method-based routes and
 * injecting them into the router:
 *
 * - get
 * - post
 * - put
 * - patch
 * - delete
 * - any
 *
 * A general `route()` method allows specifying multiple request methods and/or
 * arbitrary request methods when creating a path-based route.
 *
 * Internally, the class performs some checks for duplicate routes when
 * attaching via one of the exposed methods, and will raise an exception when a
 * collision occurs.
 */
trait RouteCollectorTrait implements IRouteCollector {
  /**
   * @param null|string $name The name of the route.
   */
  public function get(
    string $path,
    Server\IMiddleware $middleware,
    ?string $name = null,
  ): IRoute {
    return $this->route($path, $middleware, vec['GET'], $name);
  }

  /**
   * @param null|string $name The name of the route.
   */
  public function post(
    string $path,
    Server\IMiddleware $middleware,
    ?string $name = null,
  ): IRoute {
    return $this->route($path, $middleware, vec['POST'], $name);
  }

  /**
   * @param null|string $name The name of the route.
   */
  public function put(
    string $path,
    Server\IMiddleware $middleware,
    ?string $name = null,
  ): IRoute {
    return $this->route($path, $middleware, vec['PUT'], $name);
  }

  /**
   * @param null|string $name The name of the route.
   */
  public function patch(
    string $path,
    Server\IMiddleware $middleware,
    ?string $name = null,
  ): IRoute {
    return $this->route($path, $middleware, vec['PATCH'], $name);
  }

  /**
   * @param null|string $name The name of the route.
   */
  public function delete(
    string $path,
    Server\IMiddleware $middleware,
    ?string $name = null,
  ): IRoute {
    return $this->route($path, $middleware, vec['DELETE'], $name);
  }

  /**
   * @param null|string $name The name of the route.
   */
  public function any(
    string $path,
    Server\IMiddleware $middleware,
    ?string $name = null,
  ): IRoute {
    return $this->route($path, $middleware, null, $name);
  }

  /**
   * Determine if the route is duplicated in the current list.
   *
   * Checks if a route with the same name or path exists already in the list;
   * if so, and it responds to any of the $methods indicated, raises
   * a DuplicateRouteException indicating a duplicate route.
   *
   * @throws Exception\DuplicateRouteException on duplicate route detection.
   */
  protected function checkForDuplicateRoute(
    string $path,
    ?Container<string> $methods = null,
  ): void {
    $matches = Vec\filter(
      $this->getRoutes(),
      (IRoute $route) ==> {
        if ($path !== $route->getPath()) {
          return false;
        }

        if ($methods is null) {
          return true;
        }

        $carry = false;
        foreach ($methods as $method) {
          $carry = $carry || $route->allowsMethod($method);
        }

        return $carry;
      },
    );

    $match = C\first($matches);

    if (0 !== C\count($matches) && $match is nonnull) {
      $allowedMethods = $match->getAllowedMethods() ?? vec['(any)'];
      $name = $match->getName();

      throw new Exception\DuplicateRouteException(Str\format(
        'Duplicate route detected; path "%s" answering to methods [%s]%s',
        $match->getPath(),
        Str\join($allowedMethods, ','),
        $name is nonnull ? Str\format(', with name "%s"', $name) : '',
      ));
    }
  }
}

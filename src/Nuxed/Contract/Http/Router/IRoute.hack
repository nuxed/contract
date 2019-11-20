namespace Nuxed\Contract\Http\Router;

use namespace Nuxed\Contract\Http\Server;

interface IRoute {
  const HTTP_METHOD_SEPARATOR = ':';

  public function getPath(): string;

  public function setName(string $name): void;

  public function getName(): string;

  public function getMiddleware(): Server\IMiddleware;

  public function getAllowedMethods(): ?Container<string>;

  /**
   * Indicate whether the specified method is allowed by the route.
   *
   * @param string $method HTTP method to test.
   */
  public function allowsMethod(string $method): bool;

  public function setOptions(KeyedContainer<string, mixed> $options): void;

  public function getOptions(): KeyedContainer<string, mixed>;
}

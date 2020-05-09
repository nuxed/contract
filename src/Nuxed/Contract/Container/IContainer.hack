namespace Nuxed\Contract\Container;

/**
 * Describes the interface of a container that exposes methods to read its entries.
 */
interface IContainer {
  /**
   * Finds a service of the container by its typename and returns it.
   *
   * @throws NotFoundExceptionInterface  Service is not managed by the container.
   * @throws ContainerExceptionInterface Error while retrieving the service.
   */
  public function get<T>(typename<T> $service): T;

  /**
   * Returns true if the container contains the service.
   * Returns false otherwise.
   *
   * `has($service)` returning true does not mean that `get($service)` will not throw an exception.
   * It does however mean that `get($id)` will not throw a `NotFoundExceptionInterface`.
   */
  public function has<T>(typename<T> $service): bool;
}

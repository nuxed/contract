namespace Nuxed\Contract\Service;

use namespace Nuxed\Contract\Container;

/**
 * An interface representing a container aware service.
 */
interface IContainerAware {
  /**
   * Set the container instance on the service.
   */
  public function setContainer(Container\IContainer $container): void;

  public function hasContainer(): bool;

  public function getContainer(): Container\IContainer;
}

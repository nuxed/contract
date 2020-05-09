namespace Nuxed\Contract\Service;

use namespace Nuxed\Contract\Container;

/**
 * Simple implementation of container aware interface.
 */
trait ContainerAwareTrait implements IContainerAware {
  protected ?Container\IContainer $container = null;

  /**
   * Set the container instance on the service.
   */
  public function setContainer(Container\IContainer $container): void {
    $this->container = $container;
  }

  public function hasContainer(): bool {
    return $this->container is nonnull;
  }

  public function getContainer(): Container\IContainer {
    return $this->container as nonnull;
  }
}

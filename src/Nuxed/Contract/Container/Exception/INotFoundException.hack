namespace Nuxed\Contract\Container\Exception;

/**
 * No entry was found in the container.
 */
interface NotFoundExceptionInterface extends IContainerException {
  require extends \Exception;
}

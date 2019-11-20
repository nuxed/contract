namespace Nuxed\Contract\Http\Router\Exception;

/**
 * Exception thrown when duplicate route is detected.
 */
final class DuplicateRouteException
  extends \DomainException
  implements IException {
}

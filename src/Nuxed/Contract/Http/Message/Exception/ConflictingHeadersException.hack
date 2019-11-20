namespace Nuxed\Contract\Http\Message\Exception;

/**
 * The HTTP request contains headers with conflicting information.
 */
class ConflictingHeadersException
  extends \UnexpectedValueException
  implements IException {
}

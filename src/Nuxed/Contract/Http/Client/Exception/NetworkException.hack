namespace Nuxed\Contract\Http\Client\Exception;

use namespace Nuxed\Contract\Http\Message;

/**
 * Thrown when the request cannot be completed because of network issues.
 *
 * There is no response object as this exception is thrown when no response has been received.
 *
 * Example: the target host name can not be resolved or the connection failed.
 */
final class NetworkException extends \RuntimeException implements IException {
  public function __construct(
    private Message\IRequest $request,
    string $message = '',
    int $code = 0,
    ?\Exception $previous = null,
  ) {
    parent::__construct($message, $code, $previous);
  }

  /**
   * Returns the request.
   *
   * The request object MAY be a different object from the one passed to IHttpClient::send()
   */
  public function getRequest(): Message\IRequest {
    return $this->request;
  }
}

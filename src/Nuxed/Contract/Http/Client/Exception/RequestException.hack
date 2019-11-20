namespace Nuxed\Contract\Http\Client\Exception;

use namespace Nuxed\Contract\Http\Message;

/**
 * Exception for when a request failed.
 *
 * Examples:
 *      - Request is invalid (e.g. method is missing)
 *      - Runtime request errors (e.g. the body stream is not seekable)
 */
final class RequestException extends \RuntimeException implements IException {
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

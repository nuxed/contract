namespace Nuxed\Contract\Http\Server\Authenticator\Result;

/**
 * Indicates an authentication must be retried.
 *
 * The response code to be sent back is as returned from getResponseCode().
 *
 * The Authenticator must also have set any necessary response headers
 * before returning this Retry object.
 */
final class Retry implements IResult {
  public function __construct(private int $responseCode) {}

  /**
   * returns the response code to send to the client.
   */
  public function getResponseCode(): int {
    return $this->responseCode;
  }
}
